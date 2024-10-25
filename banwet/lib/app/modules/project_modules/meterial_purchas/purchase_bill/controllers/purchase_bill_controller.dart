import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/RequestModel/request_cat_modele.dart';
import '../../../../../data/model/RequestModel/request_detail_model.dart';
import '../../../../../data/model/RequestModel/request_model.dart';
import '../../../../../data/model/WageModel/wage_labour_model.dart';
import '../../../../../data/model/purchase/bill_post_model.dart';
import '../../../../../data/model/purchase/request_home_model.dart';
import '../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../data/model/purchase/supplier_list.dart';
import '../../../../../data/service/purchase_bill/purchase_meterial.dart';
import '../../../../../data/service/purchase_bill/purchasebill_service.dart';
import '../../../../../data/service/wagelistService/wagelist_service.dart';

class PurchaseBillController extends GetxController {
  var activeStep = 0.obs;
  var isLoading = false.obs;
  var balanceAmount = 0.0.obs;
  var payableAmount = 0.0.obs;
  var meterialId = "".obs;
  var meterialName = "".obs;
  var quantitytype = "".obs;
  String supplerId = "";
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
  RequestHomeModel? requestHomeModel;
  getDetails() async {
    var result =
        await PurchasebillService().getPurchaseBill(argumentData["workid"]);
    requestHomeModel = result;
    update();
    if (result.data != null) {
      filterAndCalculateTotalWagse(result.data!.toList());
    }
    update();
  }

  var filteredList = [].obs;
  // var totalWage = 0.0.obs;
  var totalAmount = 0.0.obs;

  void filterAndCalculateTotalWagse(
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

  SupplierList? supplierList;
  getSupplierList() async {
    var result = await PurchasebillService().getSupplierList();
    supplierList = result;
    update();
  }

  RequestModel? requestModel;
  getMetrialList() async {
    var result = await PurchaseMeterialService().getPurchaseMeterialList();
    requestModel = result;
    update();
  }

  WageListModel? wageListModel;
  getwageListModel() async {
    var result =
        await WageLisstServiceDart().getWageList(argumentData['workid']);
    wageListModel = result;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getRequstdialoge();

    getwageListModel();
    getSupplierList();
    getMetrialList();
  }

  RxDouble grossAmount = 0.0.obs;
  RxDouble unitPrice = 0.0.obs;
  RxDouble quantity = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  // RxDouble totalGrossAmount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  // this functio calculate the gross amount
  calculateGrossAmount() {
    grossAmount.value = unitPrice.value * quantity.value;
    tax.value = grossAmount.value / (100.00 / taxAmount.value);
    totalGrossAmounts.value = grossAmount.value + tax.value;
    update();
  }

  var totalGrossAmounts = 0.0.obs;
  void calculateTotalAmount() {
    totalGrossAmounts.value = 0.0;
    for (var i = 0; i < metrialList.length; i++) {
      log("-----${metrialList[i].totalAmt}-------->>>>>>>>>>>>>>>>>>>>");

      totalGrossAmounts.value = totalGrossAmounts.value +
          double.parse(metrialList[i].totalAmt ?? "0");
    }
    log("-----${totalGrossAmounts.value}--------");

    update();
  }

  List<BillOrder> postemetrislList = <BillOrder>[].obs;
  List<MetName2> metrialList = <MetName2>[].obs;

  void addpostemetrislList(BillOrder item) {
    bool duplicate = false;

    for (BillOrder existingItem in postemetrislList) {
      if (existingItem.materialId == item.materialId) {
        duplicate = true;
        break;
      }
    }

    if (!duplicate) {
      postemetrislList.add(item);
    }
  }

  void addmetrialList(MetName2 item) {
    bool duplicate = false;

    for (MetName2 existingItem in metrialList) {
      if (existingItem.name == item.name) {
        duplicate = true;
        break;
      }
    }

    if (!duplicate) {
      metrialList.add(item);
    }
  }

  editItem(int index, String description, String newQuantity, String tax,
      String taxid, String unitPrice, String totalAmount) {
    if (index >= 0 && index < metrialList.length) {
      metrialList[index].qtext = newQuantity;
      metrialList[index].taxPer = tax;
      metrialList[index].totalAmt = totalAmount;
      postemetrislList[index].description = description;
      postemetrislList[index].quantity = newQuantity;
      postemetrislList[index].unitPrice = unitPrice;
      postemetrislList[index].taxPercentage = taxid;
      update();
    }
  }

  double get totalPoints => metrialList.fold(
      0.0, (sum, datas) => sum + double.parse(datas.totalAmt!.toString()));

  // calculate() {
  //   for (int i = 0; i < metrialList.length; i++) {
  //     totalGrossAmounts.value = totalGrossAmount.value +
  //         double.parse(metrialList[i].totalAmt.toString());
  //   }
  // }

  RequestCatModel? requestCatModel;
  getRequstdialoge() async {
    var result = await WageLisstServiceDart().requestCategoryModel();
    requestCatModel = result;
    update();
  }

  clear() {
    supplierController.clear();
    invoiceNumber.clear();
    vechicleNumber.clear();
    postemetrislList.clear();
    metrialList.clear();
    activeStep.value = 0;
    balanceAmount.value = 0;
    totalGrossAmounts.value = 0;
  }

  //      <--------  this function using to  create a bill  ---->
  createPurchaseBill(
      {required String paidamount,
      required String paidDate,
      required String paymentMode,
      required String debitAc}) async {
    isLoading.value = true;

    var result = await PurchasebillService().creatPurchaseBill(
        workid: argumentData["workid"],
        supplier: supplerId,
        vehicle: vechicleNumber.text,
        invoice: invoiceNumber.text,
        paidAmount: paidamount,
        paidDate: paidDate,
        paymentMode: paymentMode,
        debitAc: debitAc,
        itemList: postemetrislList);

    if (result.status) {
      if (result.status) {
        isLoading.value = false;

        Get.to(() => const SubmitDone());
        getDetails();
        getSupplierList();
        activeStep.value = 0;

        clear();
      } else {
        isLoading.value = false;
      }
    }
  }

  var requestDetailModels = RequestDetailModel().obs;
  getEcachbiiDetails(String id) async {
    var result = await PurchasebillService().showPurchaseBillDetails(id);
    requestDetailModels.value = result;
    update();
  }

  calculateBalanceAmount() {
    balanceAmount.value = totalGrossAmounts.value - payableAmount.value;
  }
}
