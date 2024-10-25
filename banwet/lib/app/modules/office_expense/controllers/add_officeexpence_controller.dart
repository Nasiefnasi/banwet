import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:banwet/app/utils/image.compress.dart';

import '../../../common_widegt/submitpage.dart';
import '../../../data/model/officeExpense/expense_head_model.dart';
import '../../../data/service/expen/expense_service.dart';
import 'office_expense_controller.dart';

class AddfficeExpenseController extends GetxController {
  var argumentData = Get.arguments;
  OfficeExpenseController officeExpenseController =
      Get.put(OfficeExpenseController());
  TextEditingController expTypeCtrl =
      TextEditingController(text: 'Office Expense');

  String de = "ff";
  var isLoading = false.obs;

  var edit1 = false.obs;
  List expType = [
    'Office Expense',
    'Marketing Expense',
  ];
  editUpdate() {
    edit1.value = !edit1.value;
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

  ExpenseHeadModel? expenseHeadModel;
  getDetails() async {
    var result = await ExpensiveService().getHeadExpensiveList();
    expenseHeadModel = result;
    update();
  }

  var storage = GetStorage();

  var headId;
  var taxid = "0";
  createOfficeExpense() async {
    isLoading.value = true;
    log(expenseHeader.text.toString());
    log(paidAmount.text.toString());
    var result = await ExpensiveService().crateBill(
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
        paymentMode: paymentMode.text.toString());
    if (result.status) {
      isLoading.value = false;
      clear();
      officeExpenseController.getDetails();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }

    log("${result}000000");
  }

  clear() {
    paymentRemarks.clear();
    taxPersentage.clear();
    expenseHeader.clear();
    balanceAmount.value = 0;
    billNumber.clear();
    paidAmount.clear();
    billAmount.clear();
    grossAmount.value = 0;
    fileValue.value = 0;
    taxAmount.value = 0;
    // billAmountController.clear();
    consineeName.clear();
    billremarks.clear();
    //expTypeCtrl.clear();
    totalGrossAmount.value = 0;
    // taxPersentage.clear();
  }

  @override
  void onInit() async {
    super.onInit();
    await getDetails();

    storage = GetStorage();
    OfficeExpenseController();
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
      var compressFile =
          await testCompressAndGetFile(File(file.path), file.path);

      if (compressFile != null) {
        log("-------------------------------------/....");

        fileValue.value = 1;
        byte = File(compressFile.path).readAsBytesSync();
        img = file;
        pic = File(compressFile.path);
        int fileSize = await pic!.length();

        log('File Size: $fileSize bytes');
        log('File Size (KB): ${fileSize / 1024} KB');
        log('File Size (MB): ${fileSize / (1024 * 1024)} MB');
      }

      // Get.snackbar("Bill", "Uploaded");
    }
    // Get.snackbar("sorry","Boys");
  }
}
