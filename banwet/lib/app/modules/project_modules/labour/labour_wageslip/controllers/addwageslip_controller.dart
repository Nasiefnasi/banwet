import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/labour_wageslip_controller.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/WageModel/wage_labour_model.dart';
import '../../../../../data/service/labour_service/labourlist_service.dart';
import '../../../../../data/service/wageslip/wageslip_service.dart';

class AddwageslipController extends GetxController {
  LabourWageslipController controller = Get.put(LabourWageslipController());
  var argumentData = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isLoadingInduvitalAdding = false.obs;
  RxDouble preBalanceAmount = 0.0.obs;
  String labourId = '';
  var edit1 = false.obs;
  String labourid = "";
  var dateFormat = DateFormat('dd-MM-yyyy');
  TextEditingController remarkController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();

  TextEditingController quickWageDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController titleController = TextEditingController();
  TextEditingController selectLabour = TextEditingController();
  TextEditingController overtimeWage = TextEditingController(text: "0");
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  WageListModel? wageListModel;
  getLabourlist() async {
    var result = await LabourListService().getLoburs(argumentData["workid"]);
    wageListModel = result;
    //  filterData();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    //getLabourWageList();
    getLabourlist();
  }

  var totalAmount = 0.0.obs;

  //< ----------------   add indivitual wage related function ansd variables ----->
  TextEditingController workDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController nolabourworked = TextEditingController(text: "1");
  TextEditingController noDays = TextEditingController(text: "1");
  TextEditingController overtimeDuration = TextEditingController(text: "0");
  TextEditingController overtimeRateController =
      TextEditingController(text: "0");
  TextEditingController extraWage = TextEditingController(text: "0");
  TextEditingController ta = TextEditingController(text: "0");
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController paymentMode = TextEditingController(text: "CASH");
  TextEditingController paidDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController wageSlipRemarks = TextEditingController();
  TextEditingController referenceNo = TextEditingController();
  TextEditingController referenceDate = TextEditingController();
  TextEditingController trremarks = TextEditingController();
  TextEditingController debitAccount1 = TextEditingController();
  FocusNode focusNode = FocusNode();
  paidAccount() {
    TextEditingController debitAccount = TextEditingController(
        text: wageListModel?.accountHeads
            ?.map((e) => e.headName.toString())
            .toString());
    debitAccount1 = debitAccount;
  }

  clears() {}
  var basicWage = 0.0.obs;
  var overtimeWages = 0.0.obs;
  var overtimeRatevalue = 0.0.obs;
  var overtimeDurationValue = 0.0.obs;
  var numberofDays = 1.0.obs;
  var numberofLabours = 1.0.obs;

  calculateAmountoflabousanddays() {
    tottalAmountoflabousanddays.value =
        numberofLabours.value * numberofDays.value;
    calculateTotalWage();
    update();
  }

  calculateOvetimeWage() async {
    overtimeWages.value = overtimeDurationValue.value * overtimeRatevalue.value;
    // update();
    await calculateTotalWage();
    update();
  }

  var totalWage = 0.0.obs;
  var balanceAmount = 0.0.obs;
  var tottalAmountoflabousanddays = 1.0.obs;
  calculateTotalWage() {
    totalWage.value = basicWage.value * tottalAmountoflabousanddays.value +
        overtimeWages.value +
        double.parse(extraWage.text) +
        double.parse(ta.text);
    // update();
  }

  addIndivitualWage() async {
    isLoadingInduvitalAdding.value = true;
    update();
    var result = await WageSlipService().addIndivitualWageSlip(
        ta_per_day: ta.text,
        workday: noDays.text,
        tr_remarks: trremarks.text,
        debitAccount: debitAccount1.text.toString(),
        workid: argumentData["workid"],
        workdate: workDate.text,
        basicWage: basicWage.value.toString(),
        overTime: overtimeDuration.text,
        overRate: overtimeRatevalue.value.toString(),
        overTimeWage: overtimeWages.value.toString(),
        extraWage: extraWage.text,
        noLabours: nolabourworked.text,
        remarks: wageSlipRemarks.text,
        totalWage: totalWage.value.toString(),
        paidAmt: paidAmountController.text,
        paidMode: paymentMode.text,
        paidDate: paidDate.text,
        labourId: labourId);

    if (result.status) {
      controller.getLabourWageList();
      isLoadingInduvitalAdding.value = false;
      Get.to(() => const SubmitDone());
      update();
    } else {
      isLoadingInduvitalAdding.value = false;
      update();
    }
  }

  var totalAmountBlance = 0.0.obs;
  totalBalanceAdd() {
    totalAmountBlance.value =
        (totalWage.value + preBalanceAmount.value) - balanceAmount.value;
  }

  // var totalWage = 0.0.obs;
}
