import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/data/model/officeExpense/expense_head_model.dart';
import 'package:banwet/app/data/model/officeExpense/expense_home_model.dart';
import 'package:banwet/app/data/service/expen/expense_service.dart';
import 'package:banwet/app/data/service/projectExpense/project_expense.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/project_modules/project_expense/controllers/project_expense_controller.dart';

class UpdateprojectexpenseController extends GetxController {
  ProjectExpenseController projectExpenseController =
      Get.put(ProjectExpenseController());
  var argumnetData = Get.arguments;
  var isLoading = false.obs;
  var isLoadingUpdate = false.obs;
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.now();
  var startDate = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
  List<String> dateList = [];
  List<ExpenseData> itemlist = [];

  @override
  void onInit() {
    super.onInit();
    //  getDetails();
    getHeadExpensiveList();
  }

  //  <----------- fetching  office expence  from api ------------>
  ExpenseHomeModel? expenseHomeModel;

  getDetails() async {
    var result = await ProjectExpensiveService()
        .getExpensiveList(argumnetData["workid"]);
    expenseHomeModel = result;

    update();
  }

  var dateFormat = DateFormat('dd-MM-yyyy');

  // this function is update the enddate and start date
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  // <---------- this function using to filtering items from two dates  ---->

  void delateBillExpense(String billId) async {
    await ProjectExpensiveService()
        .deleteOfficeExpense(billId, argumnetData["workid"]);
    getDetails();
    update();
  }

  TextEditingController expTypeCtrl =
      TextEditingController(text: 'Office Expense');
  TextEditingController debitAccount1 = TextEditingController();

  var edit1 = false;
  List expType = [
    'Office Expense',
    'Marketing Expense',
  ];
  editUpdate() {
    edit1 = !edit1;
    log(edit1.toString());
    update();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final TextEditingController paidAmount = TextEditingController();
  final TextEditingController paidDate =
      TextEditingController(text: DateTime.now().toString());
  final TextEditingController paymentMode = TextEditingController(text: 'CASH');
  final TextEditingController paymentRemarks = TextEditingController();
  TextEditingController billDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController expenseHeader = TextEditingController();
  TextEditingController billNumber = TextEditingController();
  TextEditingController billAmount = TextEditingController();
  TextEditingController consineeName = TextEditingController();
  TextEditingController billremarks = TextEditingController();
  TextEditingController taxPersentage = TextEditingController(text: "0");
  TextEditingController billAmountController = TextEditingController();

  ExpenseHeadModel? expenseHeadModel;

  getHeadExpensiveList() async {
    var result = await ProjectExpensiveService()
        .getHeadExpensiveList(argumnetData["workid"]);
    expenseHeadModel = result;
    update();
  }

  var storage = GetStorage();
  String taxids = "";
  var headId;

  RxDouble grossAmount = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  // this functio calculate the gross amount
  // calculateGrossAmount() {
  //   tax.value = grossAmount.value / (100.00 / taxAmount.value);
  //   totalGrossAmount.value = grossAmount.value + tax.value;
  //   update();
  // }

  RxDouble balanceAmount = 0.0.obs;
  RxDouble payableAmount = 0.0.obs;

  calculateBalanceNumber() {
    balanceAmount.value = totalGrossAmount.value - payableAmount.value;
    update();
  }

  XFile? img;
  File? pic;
  var fileValue = 0.obs;
  var byte;

  void pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      fileValue.value = 1;
      byte = File(file.path).readAsBytesSync();
      img = file;
      pic = File(file.path);
      print(base64Encode(byte));
      // Get.snackbar("Bill", "Uploaded");
    }
    print("sorry");
    // Get.snackbar("sorry","Boys");
  }

  clear() {
    billAmountController.clear();
    paidAmount.clear();
    // paymentMode.clear();
    paymentRemarks.clear();
    expenseHeader.clear();
    billNumber.clear();
    billAmount.clear();
    consineeName.clear();
    billremarks.clear();
    taxPersentage.clear();
    totalGrossAmounts.value = 0.0;
    billAmounts.value = 0.0;
    taxpersentages.value = 0.0;
    taxamount.value = 0.0;
  }

  var totalGrossAmounts = 0.0.obs;
  var billAmounts = 0.0.obs;
  var taxpersentages = 0.0.obs;
  var taxamount = 0.0.obs;

  calculateGrossAmountss() {
    taxamount.value = billAmounts.value / (100.00 / taxpersentages.value);
    log("${taxpersentages.value}-------${totalGrossAmount.value}-------${taxpersentages.value}-------${billAmounts.value}");
    totalGrossAmount.value = billAmounts.value + taxamount.value;
  }

  var taxid = "0";
  var expenseHeadId;

  Future<void> updateExpense(String billid) async {
    isLoadingUpdate.value = true;

    try {
      log("${taxAmount.value}-------------   -----------------------");
      await calculateGrossAmountss();
      var result = await ExpensiveService().updatebill(
        workid: argumnetData["workid"].toString(),
        billid: billid,
        expType: "work",
        expenseHeadId: expenseHeadId.toString(),
        billDate: billDate.text.toString(),
        billNumber: billNumber.text.toString(),
        payable_amount: billAmountController.text.toString(),
        taxPercent: taxid.toString(),
        bill_gross_amount: billAmountController.text.toString(),
        //  billtaxamount: taxamount.value.toString(),
        billtaxamount: taxamount.value.toString(),
        consineeName: consineeName.text.toString(),
        billRemarks: billremarks.text.toString(),
        payRemark: paymentRemarks.text,
        paidDate: "",
        // paymentMode.text,
        paymentMode: "",
        // paymentMode.text
      );
      if (result.status) {
        isLoadingUpdate.value = false;
        await projectExpenseController.getDetails();
        edit1 = false;
        Get.to(() => const SubmitDone());
      } else {
        isLoadingUpdate.value = false;
      }
    } catch (e) {
      log(e.toString());
      isLoadingUpdate.value = false;
    }
  }
}
