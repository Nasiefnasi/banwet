import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widegt/submitpage.dart';
import '../../../data/model/LabourModel/labour_list_model.dart';
import '../../../data/model/labourpayment_model.dart/labour_payment_model.dart';
import '../../../data/model/officeExpense/expense_head_model.dart';
import '../../../data/service/expen/expense_service.dart';
import '../../../data/service/labourpaynmet/labourpayment_service.dart';

class LabourPaymentController extends GetxController {
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isShow = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDetails();
    getLaborList();
    getExpenseModel();
  }

  var labours = <LaboursPayData>[].obs;

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.now();
  var startDate = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
  LabourPaymentModel? labourPaymentModel;

  //  <----------- fetching laborPayments note from api ------------>
  getDetails() async {
    isShow.value = true;
    try {
      var result = await LaborPaymentService().getLabourpaymentList();
      if (result.status!) {
        labourPaymentModel = result;
        update();
        if (labourPaymentModel != null) {
          filteringData();
        }

        isShow.value = false;
      } else {
        isShow.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  LabourModel? labourModel;
  //  <----------- fetching Labors List note from api ------------>
  getLaborList() async {
    var result = await LaborPaymentService().getLabourList();
    labourModel = result;
    labours.value = labourModel!.labours!;
    update();
  }

  var dateFormat = DateFormat('dd-MM-yyyy');

  // this function is update the enddate and start date
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  ExpenseHeadModel? expenseHeadModel;
  getExpenseModel() async {
    var result = await ExpensiveService().getHeadExpensiveList();
    expenseHeadModel = result;
    update();
  }

  TextEditingController debitAccount1 = TextEditingController();
  paidAccount() {
    TextEditingController debitAccount = TextEditingController(
        text: expenseHeadModel?.accountHeads
            ?.map((e) => e.headName.toString())
            .toString());
    debitAccount1 = debitAccount;
  }

  //  <----------- fetching daily note from api ------------>
  TextEditingController selectLabour = TextEditingController();
  TextEditingController payimentMode = TextEditingController(text: "CASH");
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController paiddateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController trReferenceController = TextEditingController();
  TextEditingController trRefernceDate =
      TextEditingController(text: DateTime.now().toString());

  clear() {
    selectLabour.clear();
    payimentMode.clear();
    amountController.clear();
    trReferenceController.clear();
    remarkController.clear();
    // paiddateController.clear();
    debitAccount1.clear();
    currentBal.value = "";
    labourId.value = "";
    workType.value = "";
  }

  var workType = "".obs;
  var currentBal = "".obs;
  var labourId = "".obs;

  createLaborPayment() async {
    isLoading.value = true;
    var result = await LaborPaymentService().create(
        referenceId: labourId.value,
        paidAmount: amountController.text,
        paidDate: paiddateController.text,
        paymentModes: payimentMode.text,
        remarks: remarkController.text);

    if (result.status) {
      isLoading.value = false;

      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  dateformats() {
    endDateController.text = DateTime.now().toString();
    startDateController.text = DateTime.now().toString();
  }

  var filterList = <LabourPayData>[].obs;
  // filteringData() {
  //   filterList.clear();
  //   if (labourPaymentModel != null || labourPaymentModel?.data != null) {
  //     for (int i = 0; i < labourPaymentModel!.data!.length; i++) {
  //       if (dateFormat
  //                   .parse(labourPaymentModel!.data![i].createdDate ?? "")
  //                   .compareTo(DateTime.parse(startDateController.text)) >=
  //               0 &&
  //           dateFormat
  //                   .parse(labourPaymentModel!.data![i].createdDate ?? "")
  //                   .compareTo(DateTime.parse(endDateController.text)) <=
  //               0) {
  //         filterList.add(labourPaymentModel!.data![i]);
  //         log("${filterList.length}hgbfvd");
  //       }
  //     }
  //   }
  //   return null;
  // }
  dynamic startdate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  dynamic enddate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  filteringData() async {
    filterList.clear();
    filterList.value.clear();
    print("this is ${filterList.length}");
    try {
      if (labourPaymentModel != null || labourPaymentModel?.data != null) {
        for (int i = 0; i < labourPaymentModel!.data!.length; i++) {
          DateTime createdDate =
              dateFormat.parse(labourPaymentModel!.data![i].createdDate!);
          DateTime startDate = DateTime.parse(startdate);
          DateTime endDate = DateTime.parse(enddate);

          if (createdDate.compareTo(startDate) >= 0 &&
              createdDate.compareTo(endDate) <= 0) {
            filterList.add(labourPaymentModel!.data![i]);
            filterList.refresh();
            print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            update();
          } else {
            print("sfbbbbsd dddddddddddddddddddddddddddddddddddddddddd$i");
          }
        }
        filterList.refresh();
        update();
        log("${filterList.length} ffffffffff...");
      }
      filterList.refresh();
      update();
    } catch (e) {
      print("Error in filtering: $e");
    }
  }
}
