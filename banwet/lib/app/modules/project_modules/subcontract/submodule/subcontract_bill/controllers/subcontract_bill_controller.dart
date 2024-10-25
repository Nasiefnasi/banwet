import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../common_widegt/submitpage.dart';
import '../../../../../../data/model/officeExpense/expense_head_model.dart';
import '../../../../../../data/model/subcontract_model/sub_common_model.dart';
import '../../../../../../data/service/projectExpense/project_expense.dart';
import '../../../../../../data/service/subcontract/payment_service.dart';
import '../../../../../../data/service/subcontract/subcontractbill_service.dart';

class SubcontractBillController extends GetxController {
  var dateFormat = DateFormat('dd-MM-yyyy');
  var argumentData = Get.arguments;
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  var isLoading = false.obs;
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  //< ---- this function using  get subcontact details ---->

  SubCommonModel? subCommonModel;
  getDetails() async {
    var result = await SubContractPayment()
        .getSubcontractList(argumentData["workid"], argumentData["contractId"]);
    subCommonModel = result;
    filteringData();
    update();
  }

  var filterList = <SubBillsData>[].obs;
  filteringData() async {
    filterList.clear();
    for (int i = 0; i < subCommonModel!.bills!.length; i++) {
      if (dateFormat
                  .parse(subCommonModel!.bills![i].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(subCommonModel!.bills![i].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filterList.add(subCommonModel!.bills![i]);
        update();
        // filterList.value.add(activityModel!.data[i]);
        // log("${filterList.length}hgbfvd");
      }
    }
  }

  //< ---- this function using  get expensehass details ---->

  ExpenseHeadModel? headModel;
  getExpensiveList() async {
    var result = await ProjectExpensiveService().getHeadExpensiveList(
      argumentData["workid"],
    );
    headModel = result;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getExpensiveList();
  }

  var edit1 = false.obs;
  editUpdate() {
    edit1.value = !edit1.value;
    update();
  }

  TextEditingController billNo = TextEditingController();
  TextEditingController billDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController grossAmountController = TextEditingController();
  TextEditingController taxpersentageController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController paidDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController paidFromAccount = TextEditingController();
  TextEditingController paymentMode = TextEditingController(text: "CASH");
  TextEditingController remark = TextEditingController();

  RxDouble grossAmount = 0.0.obs;
  RxDouble taxpersentage = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  RxDouble tax = 0.0.obs;
  // this functio calculate the gross amount
  calculateGrossAmount() {
    tax.value = grossAmount.value / (100.00 / taxpersentage.value);
    totalGrossAmount.value = grossAmount.value + tax.value;
    update();

    print(tax.value);
  }

  paidAccount() {
    TextEditingController debitAccount = TextEditingController(
        text: headModel!.accountHeads!
            .map((e) => e.headName.toString())
            .toString());
    paidFromAccount = debitAccount;
    paymentMode.text = "CASH";
    paidDate.text = DateTime.now().toString();
    billDate.text = DateTime.now().toString();
  }

  RxDouble balanceAmount = 0.0.obs;

  calculateBalanceNumber() {
    balanceAmount.value = totalGrossAmount.value -
        double.parse(paidAmountController.text.toString());
    update();
  }

  String taxid = "0";
  createSubContractBill() async {
    isLoading.value = true;

    var result = await SubContractPayment().addSubContractBill(
        taxamount: tax.value.toString(),
        contractId: argumentData["contractId"],
        paidamount: paidAmountController.text,
        workid: argumentData["workid"],
        billDate: billDate.text,
        payDate: paidDate.text,
        billNo: billNo.text,
        billRemarks: remark.text,
        taxpersentage: taxid.toString(),
        grossAmount: grossAmountController.text.toString(),
        payMode: paymentMode.text,
        payRemarks: remark.text,
        billDebitAct: paidFromAccount.text);

    if (result.status) {
      isLoading.value = false;
      edit1.value = false;
      Get.to(() => const SubmitDone());
      edit1.value = false;
      totalGrossAmount.value = 0;
      getDetails();
      clear();
    } else {
      isLoading.value = false;
    }
  }

  delete(String billid) async {
    var result = await SubContractBillService()
        .deleteOfficeExpense(billid, argumentData["workid"]);
  }

  clear() {
    billNo.clear();
    billDate.clear();
    grossAmountController.clear();
    taxpersentageController.clear();
    paidAmountController.clear();
    paidFromAccount.clear();
    paymentMode.clear();
    remark.clear();
  }
}
