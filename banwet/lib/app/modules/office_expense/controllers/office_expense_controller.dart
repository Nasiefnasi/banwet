import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common_widegt/submitpage.dart';
import '../../../data/model/officeExpense/expense_head_model.dart';
import '../../../data/model/officeExpense/expense_home_model.dart';
import '../../../data/service/expen/expense_service.dart';

class OfficeExpenseController extends GetxController {
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  final GlobalKey<FormState> key3 = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isShow = false.obs;
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  // TextEditingController startDateController = TextEditingController(
  //     text:
  //         DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  // // TextEditingController startDateController = TextEditingController(
  // //     text:
  // //         DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  // // TextEditingController endDateController =
  // //     TextEditingController(text: DateTime.now().toString());
  // TextEditingController endDateController =
  //     TextEditingController(text: DateTime.now().toString());
  // var endDate = DateTime.now();
  var endDate = DateTime.parse(DateTime.now().toString());
  // var startDate = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  @override
  void onInit() {
    super.onInit();
    FocusManager.instance.primaryFocus?.unfocus();
    getDetails();

    getexpenseHeadModel();
  }

  //  <----------- fetching  office expence  from api ------------>
  ExpenseHomeModel? expenseHomeModel;

  getDetails() async {
    log("------------------");
    isShow.value = true;
    var result = await ExpensiveService().getExpensiveList();
    if (result.status!) {
      expenseHomeModel = result;
      filteringData();

      isShow.value = false;
      update();
    } else {
      isShow.value = false;
      update();
    }
  }

  var dateFormat = DateFormat('dd-MM-yyyy');

  // this function is update the enddate and start date
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  ExpenseHeadModel? expenseHeadModel;
  getexpenseHeadModel() async {
    var result = await ExpensiveService().getHeadExpensiveList();
    expenseHeadModel = result;

    update();
  }
  // <---------- this function using to filtering items from two dates  ---->

  void delateBillExpense(String billId) async {
    await ExpensiveService().deleteOfficeExpense(billId);
    getDetails();
    update();
  }

  final TextEditingController paymentMode = TextEditingController(text: 'CASH');
  final TextEditingController paymentRemarks = TextEditingController();
  TextEditingController billDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController expenseHeader = TextEditingController();
  TextEditingController billNumber = TextEditingController();
  TextEditingController billAmountController = TextEditingController();
  TextEditingController consineeName = TextEditingController();
  TextEditingController billremarks = TextEditingController();
  TextEditingController expTypeCtrl = TextEditingController();
  TextEditingController taxPersentage = TextEditingController();

  var totalGrossAmount = 0.0.obs;
  var billAmount = 0.0.obs;
  var taxpersentage = 0.0.obs;
  RxDouble taxamount = 0.0.obs;

  calculateGrossAmount() {
    taxamount.value = billAmount.value / (100.00 / taxpersentage.value);
    totalGrossAmount.value = billAmount.value + taxamount.value;
  }

  var taxid = "0";
  var expenseHeadId;
  updateExpense(String billid) async {
    isLoading.value = true;
    try {
      await calculateGrossAmount();
      var result = await ExpensiveService().updatebill(
          workid: "",
          billid: billid.toString(),
          expType: expTypeCtrl.text,
          expenseHeadId: expenseHeadId.toString(),
          billDate: billDate.text,
          billNumber: billNumber.text,
          payable_amount: billAmountController.text,
          taxPercent: taxid.toString(),
          bill_gross_amount: billAmountController.text,
          billtaxamount: taxamount.value.toString(),
          consineeName: consineeName.text,
          billRemarks: billremarks.text,
          payRemark: paymentRemarks.text,
          paidDate: paymentMode.text,
          paymentMode: paymentMode.text);
      if (result.status) {
        isLoading.value = false;
        clear();

        getDetails();
        Get.to(() => const SubmitDone());
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;

      log(e.toString());
    }
  }

  clear() {
    paymentRemarks.clear();

    expenseHeader.clear();
    billNumber.clear();
    billAmountController.clear();
    consineeName.clear();
    billremarks.clear();
    expTypeCtrl.clear();
    taxPersentage.clear();
  }

  dateformats() {
    endDateController = TextEditingController(
        text: DateFormat("yyyy-MM-dd")
            .parse(DateTime.now().toString())
            .toString());
    startDateController = TextEditingController(
        text: DateFormat("yyyy-MM-dd")
            .parse(DateTime.now().toString())
            .toString());
    update();
  }

  var filterList = <ExpenseData>[].obs;
  // filteringData() {
  //   filterList.value.clear();
  //   for (int i = 0; i < expenseHomeModel!.data!.length; i++) {
  //     if (dateFormat
  //                 .parse(expenseHomeModel!.data![i].createdDate!)
  //                 .compareTo(DateTime.parse(startDateController.text)) >=
  //             0 &&
  //         dateFormat
  //                 .parse(expenseHomeModel!.data![i].createdDate!)
  //                 .compareTo(DateTime.parse(endDateController.text)) <=
  //             0) {
  //       filterList..value.add(expenseHomeModel!.data![i]);
  //       filterList.refresh();
  //       log("${filterList.length}");
  //     }
  //   }
  // }
  dynamic startdates =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  dynamic enddates =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  filteringData() async {
    filterList.clear();
    filterList.value.clear();
    print("this is ${filterList.length}");
    try {
      if (expenseHomeModel != null && expenseHomeModel?.data != null) {
        for (int i = 0; i < expenseHomeModel!.data!.length; i++) {
          DateTime createdDate = dateFormat
              .parse(expenseHomeModel!.data![i].createdDate.toString());
          DateTime startDate = DateTime.parse(startdates);
          DateTime endDate = DateTime.parse(enddates);

          if (createdDate.compareTo(startDate) >= 0 &&
              createdDate.compareTo(endDate) <= 0) {
            filterList.add(expenseHomeModel!.data![i]);
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

  // filteringData() async {
  //   filterList.clear();
  //   print("this iss  s  s${filterList.length}");
  //   try {
  //     if (expenseHomeModel != null || expenseHomeModel?.data != null) {
  //       for (int i = 0; i < expenseHomeModel!.data!.length; i++) {
  //         // if (dateFormat
  //         //             .parse(expenseHomeModel!.data![i].createdDate.toString())
  //         //             .compareTo(DateTime.parse(startDateController.text)) >=
  //         //         0 &&
  //         //     dateFormat
  //         //             .parse(expenseHomeModel!.data![i].createdDate.toString())
  //         //             .compareTo(DateTime.parse(endDateController.text)) <=
  //         //         0)
  //         if (dateFormat
  //                     .parse(expenseHomeModel!.data![i].createdDate.toString())
  //                     .compareTo(DateTime.parse(startDateController.text)) >=
  //                 0 &&
  //             dateFormat
  //                     .parse(expenseHomeModel!.data![i].createdDate.toString())
  //                     .compareTo(DateTime.parse(endDateController.text)) <=
  //                 0) {
  //           filterList.add(expenseHomeModel!.data![i]);
  //           filterList.refresh();
  //           update();
  //           log("${filterList.length}                                 fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffhgbfvd");
  //         }
  //       }
  //       update();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
