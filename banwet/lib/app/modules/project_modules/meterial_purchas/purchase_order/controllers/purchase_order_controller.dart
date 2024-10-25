import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/data/model/RequestModel/request_cat_modele.dart';
import 'package:banwet/app/data/service/purchase_bill/purchase_request.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/RequestModel/request_detail_model.dart';
import '../../../../../data/model/RequestModel/request_model.dart';
import '../../../../../data/model/purchase/order_model.dart';
import '../../../../../data/model/purchase/request_home_model.dart';
import '../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../data/model/purchase/supplier_list.dart';
import '../../../../../data/service/purchase_bill/purchase_meterial.dart';
import '../../../../../data/service/purchase_bill/purchase_order.dart';
import '../../../../../data/service/purchase_bill/purchasebill_service.dart';

class PurchaseOrderController extends GetxController {
  var date = DateFormat('dd-MMM-yyyy');
  var dateFormat = DateFormat('dd-MM-yyyy');
  var Converterdate = DateFormat("yyyy-MM-dd");
  var activeStep = 0.obs;
  var supplierid = "";
  String delivarydated = "";

  String dropDwonValue = "0";
  var isLoading = false.obs;
  var meterialId = "".obs;
  var meterialName = "".obs;
  var quantitytype = "".obs;
  final GlobalKey<FormState> k1key = GlobalKey<FormState>();

  var argumentData = Get.arguments;
  TextEditingController delivarydate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());

  TextEditingController supplierController = TextEditingController();
  TextEditingController invoiceNumber = TextEditingController();
  TextEditingController vechicleNumber = TextEditingController();
  TextEditingController quanityController = TextEditingController();
  TextEditingController metrialController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController taxPersentage = TextEditingController();
  RequestHomeModel? requestHomeModel;
  getDetails() async {
    var result =
        await PurchaseOrderService().getPurchaseOrder(argumentData["workid"]);
    requestHomeModel = result;
    if (result != null) {
      filteringDate();
    }
    filteringDate();
    update();
  }

  var filterList = <Homedetailsdata>[].obs;
  filteringDate() {
    filterList.clear();
    for (int i = 0; i < requestHomeModel!.data!.length; i++) {
      if (dateFormat
                  .parse(requestHomeModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(requestHomeModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filterList.add(requestHomeModel!.data![i]);
        filterList.refresh();
        update();
      }
    }
  }

  var edit1 = false.obs;

  editUpdate() {
    edit1.value = !edit1.value;
    update();
  }

  SupplierList? supplierList;
  getSupplierList() async {
    var result = await PurchasebillService().getSupplierList();
    supplierList = result;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getrequestCatModel();
    getSupplierList();
    getMetrialList();
  }

  RequestModel? requestModel;
  getMetrialList() async {
    log("-------------------");
    var result = await PurchaseMeterialService().getPurchaseMeterialList();
    requestModel = result;
    update();
  }

  List<Order> postemetrislList = <Order>[].obs;
  List<MetName> metrialList = <MetName>[].obs;
  void addpostemetrislList(Order item) {
    bool duplicate = false;

    for (Order existingItem in postemetrislList) {
      if (existingItem.materialId == item.materialId) {
        duplicate = true;
        break;
      }
    }

    if (!duplicate) {
      postemetrislList.add(item);
    }
  }

  void addmetrialList(MetName item) {
    bool duplicate = false;

    for (MetName existingItem in metrialList) {
      if (existingItem.name == item.name) {
        duplicate = true;
        break;
      }
    }

    if (!duplicate) {
      metrialList.add(item);
    }
  }

  editItem(int index, String description, String newQuantity) {
    if (index >= 0 && index < metrialList.length) {
      var up = metrialList[index];
      up.qtext = newQuantity;
      metrialList[index].qtext = newQuantity;
      postemetrislList[index].description = description;
      postemetrislList[index].quantity = newQuantity;
      metrialList[index] = up;
      update();
    }
  }

  createPurchaseRequest(date) async {
    isLoading.value = true;

    var result = await PurchaseOrderService().creatPurchaseOrder(
        argumentData["workid"],
        supplierid,
        vechicleNumber.text,
        invoiceNumber.text,
        postemetrislList,
        date);

    if (result.status) {
      if (result.status) {
        getDetails();
        clear();
        isLoading.value = false;
        edit1.value = false;
        Get.to(() => const SubmitDone());
      } else {
        isLoading.value = false;
      }
    }
  }

  clear() {
    supplierController.clear();
    vechicleNumber.clear();
    invoiceNumber.clear();
    postemetrislList.clear();
    metrialList.clear();
  }

  RequestCatModel? requestCatModel;
  getrequestCatModel() async {
    var result = await PurchaseRequestService().getRequestCategory();
    requestCatModel = result;
    update();
  }

  var requestDetailModels = RequestDetailModel().obs;
  getEcachbiiDetails(String id) async {
    var result = await PurchaseOrderService().showPurchaseBillDetails(id);
    requestDetailModels.value = result;
    update();
  }

  /// this function used for only  update description

  void updateDescription(
      List<Order> itemList, String materialId, String newDescription) {
    for (Order item in itemList) {
      if (item.materialId == materialId) {
        item.description = newDescription;
        update();
        break; // Assuming there is only one item with the specified materialId
      }
    }
  }
}
