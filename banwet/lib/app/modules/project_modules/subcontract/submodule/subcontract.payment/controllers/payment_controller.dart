import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../common_widegt/submitpage.dart';
import '../../../../../../data/model/officeExpense/expense_head_model.dart';
import '../../../../../../data/model/subcontract_model/sub_common_model.dart';
import '../../../../../../data/service/subcontract/payment_service.dart';

class PaymentController extends GetxController {
  var argumentData = Get.arguments;
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  var isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  SubCommonModel? subCommonModel;
  getDetails() async {
    var result = await SubContractPayment()
        .getSubcontractList(argumentData["workid"], argumentData["contractId"]);
    subCommonModel = result;
    update();
  }

  ExpenseHeadModel? expenseHeadModel;
  getDropDown() async {
    var result = await SubContractPayment().getDropDown(argumentData["workid"]);
    expenseHeadModel = result;
    update();
  }

  addSubContractPayment() async {
    isLoading.value = true;
    var result = await SubContractPayment().addSubContractPayment(
        contractId: argumentData["contractId"],
        payimentAmt: paidAmount.text,
        workid: argumentData["workid"],
        payDate: billPaidDate.text.toString(),
        payMode: paymentMode.text,
        payRemarks: remarks.text);
    log(result.toString());
    if (result.status) {
      getDetails();
      isLoading.value = false;

      clear();

      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }

    update();
  }

  TextEditingController paidAmount = TextEditingController();
  TextEditingController padiFromAccount = TextEditingController();
  TextEditingController paymentMode = TextEditingController(text: "CASH");
  TextEditingController remarks = TextEditingController();
  TextEditingController billPaidDate =
      TextEditingController(text: DateTime.now().toString());

  paidAccount() {
    TextEditingController debitAccount = TextEditingController(
        text: expenseHeadModel?.accountHeads
            ?.map((e) => e.headName.toString())
            .toString());
    padiFromAccount = debitAccount;
    paymentMode.text = "CASH";
    billPaidDate.text = DateTime.now().toString();
  }

  clear() {
    paidAmount.clear();
    padiFromAccount.clear();
    paymentMode.clear();
    remarks.clear();
    billPaidDate.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getDropDown();
  }
}
