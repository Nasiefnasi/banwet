import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../common_widegt/submitpage.dart';
import '../../../../data/model/officeExpense/expense_head_model.dart';
import '../../../../data/model/officeExpense/expense_home_model.dart';
import '../../../../data/service/expen/expense_service.dart';
import '../../../../data/service/projectExpense/project_expense.dart';

class ProjectExpenseController extends GetxController {
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
  int paidCont = 0;
  int partiallyPaidCount = 0;
  int notPaidCount = 0;
  @override
  void onInit() {
    super.onInit();
    getDetails();
    getHeadExpensiveList();
  }

  //  <----------- fetching  office expence  from api ------------>
  ExpenseHomeModel? expenseHomeModel;
  RxBool expenseloading = false.obs;

  getDetails() async {
    expenseloading.value = true;
    expenseloading.refresh();
    update();
    var result = await ProjectExpensiveService()
        .getExpensiveList(argumnetData["workid"]);
    expenseHomeModel = result;
    if (result.status == false) {
      expenseloading.value = false;
      expenseloading.refresh();
      update();
    }
    if (result.data != null) {
      filteringData(result.data!);
    }
    expenseloading.value = false;
    expenseloading.refresh();
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

  paidAccount() {
    TextEditingController debitAccount = TextEditingController(
        text: expenseHeadModel?.accountHeads
            ?.map((e) => e.headName.toString())
            .toString());
    debitAccount1 = debitAccount;
  }

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

  // <-----------------  update screeen controller ------------------------->
  final TextEditingController updatepaidAmount = TextEditingController();
  final TextEditingController updatepaidDate =
      TextEditingController(text: DateTime.now().toString());
  final TextEditingController updatepaymentMode =
      TextEditingController(text: 'CASH');
  final TextEditingController updatepaymentRemarks = TextEditingController();
  TextEditingController updatebillDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController updateexpenseHeader = TextEditingController();
  TextEditingController updatebillNumber = TextEditingController();
  TextEditingController updatebillAmount = TextEditingController();
  TextEditingController updateconsineeName = TextEditingController();
  TextEditingController updatebillremarks = TextEditingController();
  TextEditingController updatetaxPersentage = TextEditingController(text: "0");
  TextEditingController updatebillAmountController = TextEditingController();

  ExpenseHeadModel? expenseHeadModel;

  getHeadExpensiveList() async {
    var result = await ProjectExpensiveService()
        .getHeadExpensiveList(argumnetData["workid"]);
    expenseHeadModel = result;
    update();
  }

  var storage = GetStorage();
  String taxids = "0"; //<--------------------------------------------------->
  var headId;
  createOfficeExpense() async {
    isLoading.value = true;

    var result = await ProjectExpensiveService().crateBill(
        bill_tax_amount: tax.value.toString(),
        byte: byte,
        userId: storage.read('uid').toString(),
        expType: expTypeCtrl.text.toString(),
        expenseHeadId: headId.toString(),
        billDate: billDate.text.toString(),
        billNumber: billNumber.text.toString(),
        payable_amount: billAmount.text.toString(),
        taxPercent: taxid.toString(),
        bill_gross_amount: billAmount.text.toString(),
        consineeName: consineeName.text.toString(),
        billRemarks: billremarks.text.toString(),
        payRemark: paymentRemarks.text.toString(),
        paidAmount: paidAmount.text.toString(),
        paidDate: paidDate.text.toString(),
        debit_acc: debitAccount1.text.toString(),
        paymentMode: paymentMode.text.toString(),
        workid: argumnetData["workid"]);
    if (result.status) {
      isLoading.value = false;
      clear();
      Get.to(() => const SubmitDone());
      getDetails();
    } else {
      isLoading.value = false;
    }

    // log("${result}000000");
  }

  RxDouble grossAmount = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  // this functio calculate the gross amount
  calculateGrossAmount() {
    tax.value = grossAmount.value / (100.00 / taxAmount.value);
    totalGrossAmount.value = grossAmount.value + tax.value;
    update();
  }

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
  //  var fileValue = 0.obs;
  // var byte;
  // var img;
  // File? pic;

  // Method to pick an image from the specified source (camera or gallery)
  // void pickImage(ImageSource source) async {
  //   final file = await ImagePicker().pickImage(source: source);

  //   if (file != null) {
  //     // Compress the image file
  //     var compressFile = await testCompressAndGetFile(File(file.path), file.path);

  //     if (compressFile != null) {
  //       log("-------------------------------------/....");

  //       // Update observable value and store the compressed file
  //       fileValue.value = 1;
  //       byte = File(compressFile.path).readAsBytesSync();
  //       img = file;
  //       pic = File(compressFile.path);
  //     }
  //     // You can add a snackbar or other feedback mechanism here if needed
  //   }
  // }

  // Method to compress the image (add your implementation)
  // Future<File?> testCompressAndGetFile(File file, String targetPath) async {
  //   // Implement your image compression logic here
  //   // Return the compressed file
  //   return file; // Replace with actual compressed file
  // }

  clear() {
    billAmountController.clear();
    paidAmount.clear();
    totalGrossAmount.value = 0;
    grossAmount.value = 0;
    taxAmount.value = 0;
    // paymentMode.clear();
    paymentRemarks.clear();
    expenseHeader.clear();
    billNumber.clear();
    payableAmount.value = 0;
    billAmount.clear();
    balanceAmount.value = 0;
    consineeName.clear();
    billremarks.clear();
    fileValue.value = 0;
    pic = null;
    taxPersentage.clear();
  }

  var totalGrossAmounts = 0.0.obs;
  var billAmounts = 0.0.obs;
  var taxpersentages = 0.0.obs;
  RxDouble taxamount = 0.0.obs;

  calculateGrossAmountss() {
    taxamount.value = billAmounts.value / (100.00 / taxpersentages.value);
    totalGrossAmount.value = billAmounts.value + taxamount.value;
  }

  var taxid = "0";
  var expenseHeadId;

  Future<void> updateExpense(String billid) async {
    isLoadingUpdate.value = true;
    log("${argumnetData["workid"]}----kkkk");
    try {
      var result = await ExpensiveService().updatebill(
          workid: argumnetData["workid"],
          billid: billid,
          expType: expTypeCtrl.text,
          expenseHeadId: expenseHeadId.text,
          billDate: billDate.text,
          billNumber: billNumber.text,
          payable_amount: billAmountController.text,
          taxPercent: taxids.toString(),
          bill_gross_amount: billAmountController.text,
          billtaxamount: taxamount.value.toString(),
          consineeName: consineeName.text,
          billRemarks: billremarks.text,
          payRemark: paymentRemarks.text,
          paidDate: paymentMode.text,
          paymentMode: paymentMode.text);
      if (result.status) {
        isLoadingUpdate.value = false;
        clear();
        await getDetails();

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

  var filteredList = [].obs;

  filteringData(List<ExpenseData> data) {
    filteredList.clear();
    partiallyPaidCount = 0;
    paidCont = 0;
    notPaidCount = 0;
    for (int i = 0; i < data.length; i++) {
      if (dateFormat
                  .parse(data[i].createdDate ?? "")
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(data[i].createdDate ?? "")
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredList.add(data[i]);
        String status = data[i].paymentStatus ?? "";
        if (status == "Partially Paid") {
          partiallyPaidCount++;
          update();
        } else if (status == "Paid") {
          paidCont++;
          update();
        } else if (status == "Not Paid") {
          notPaidCount++;
          update();
        }
      }
    }

    // Define a reducer function to update counts
  }
}
