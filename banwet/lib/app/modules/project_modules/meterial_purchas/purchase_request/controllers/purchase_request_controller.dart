import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/RequestModel/request_cat_modele.dart';
import '../../../../../data/model/RequestModel/request_detail_model.dart';
import '../../../../../data/model/RequestModel/request_model.dart';
import '../../../../../data/model/purchase/request_home_model.dart';
import '../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../data/service/purchase_bill/purchase_meterial.dart';
import '../../../../../data/service/purchase_bill/purchase_request.dart';

class PurchaseRequestController extends GetxController {
  var activeStep = 0.obs;
  String dropDwonValue = "0";
  var isLoading = false.obs;
  var meterialId = "".obs;
  var meterialName = "".obs;
  var quantitytype = "".obs;
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  final GlobalKey<FormState> key3 = GlobalKey<FormState>();
  var argumentData = Get.arguments;
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
  TextEditingController descriptionController = TextEditingController();
  TextEditingController taxPersentage = TextEditingController();
  RequestHomeModel? requestHomeModel;
  getDetails() async {
    var result = await PurchaseRequestService()
        .getPurchaseRequest(argumentData["workid"]);
    requestHomeModel = result;

    update();
    if (requestHomeModel!.data != null) {
      filterAndCalculateTotalWage(result.data!.toList());
    }
    update();
  }

  RequestCatModel? requestCatModel;
  getrequestCatModel() async {
    var result = await PurchaseRequestService().getRequestCategory();
    requestCatModel = result;
    update();
  }

  RequestModel? requestModel;
  getMetrialList() async {
    var result = await PurchaseMeterialService().getPurchaseMeterialList();
    requestModel = result;
    update();
  }

  // WageListModel? wageListModel;
  // getwageListModel() async {
  //   var result =
  //       await WageLisstServiceDart().getWageList(argumentData['workid']);
  //   wageListModel = result;
  //   update();
  // }

  @override
  void onInit() {
    super.onInit();
    getrequestCatModel();
    getDetails();
    // getwageListModel();

    // getSupplierList();
    getMetrialList();
  }

  RxDouble grossAmount = 0.0.obs;
  RxDouble unitPrice = 0.0.obs;
  RxDouble quantity = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  // this functio calculate the gross amount
  calculateGrossAmount() {
    grossAmount.value = unitPrice.value * quantity.value;
    tax.value = grossAmount.value / (100.00 / taxAmount.value);
    totalGrossAmount.value = grossAmount.value + tax.value;
    update();
  }

  TextEditingController selectCategory = TextEditingController();
  TextEditingController descriptionControllers = TextEditingController();
  TextEditingController descriptionControllers1 = TextEditingController();
  TextEditingController categoryControllers = TextEditingController();
  TextEditingController quantityControllers = TextEditingController();

  RxList<Item> postemetrislList = <Item>[].obs;
  var metrialList = <MetName>[].obs;
  void addpostemetrislList(Item item) {
    bool duplicate = false;

    for (Item existingItem in postemetrislList) {
      if (existingItem.materialId == item.materialId) {
        duplicate = true;
        break;
      }
    }

    if (!duplicate) {
      postemetrislList.add(item);
    }
  }

  void updateDescription(
      List<Item> itemList, String materialId, String newDescription) {
    for (Item item in itemList) {
      if (item.materialId == materialId) {
        item.description = newDescription;
        update();
        break; // Assuming there is only one item with the specified materialId
      }
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

  createPurchaseRequest() async {
    isLoading.value = true;

    var result = await PurchaseRequestService()
        .creatPurchaseRequest(argumentData["workid"], postemetrislList);

    if (result.status) {
      if (result.status) {
        getDetails();
        isLoading.value = false;

        clear();
        Get.to(() => const SubmitDone());

        postemetrislList.clear();
        metrialList.clear();
      } else {
        isLoading.value = false;
      }
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

  var requestDetailModels = RequestDetailModel().obs;
  getEcachbiiDetails(String id) async {
    var result = await PurchaseRequestService().showPurchaseRequestDetails(id);
    requestDetailModels.value = result;
    update();
  }

  clear() {
    descriptionControllers1.clear();
    selectCategory.clear();
    descriptionControllers.clear();
    categoryControllers.clear();
    quantityControllers.clear();
  }

  var filteredList = [].obs;
  // var totalWage = 0.0.obs;
  var totalAmount = 0.0.obs;

  void filterAndCalculateTotalWage(
    List<Homedetailsdata> dataList,
  ) {
    // log();
    filteredList.clear();
    totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < dataList.length; index++) {
      if (dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredList.add(dataList[index]);
        // totalAmount.value += dataList[index].Wage;
        // log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
  }
}
