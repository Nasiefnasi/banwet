import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/officeExpense/expense_head_model.dart';
import '../../model/officeExpense/expense_home_model.dart';
import '../dailynote/get_dailynote.dart';

class ExpensiveService {
  var storage = GetStorage();
  Future<ExpenseHomeModel> getExpensiveList() async {
    try {
      final response = await ApiBaseHelper.get(
          "${storage.read("domain")}/bills/select_bills/expense/office?user_id=${storage.read('uid')}",
          isHeaderRequired: true);
      log(response);
      var a = json.decode(response);
      if (a["status"]) {
        log("${a["status"]}----------------->>>");
        return ExpenseHomeModel.fromJson(json.decode(response));
      } else {
        ExpenseHomeModel emptyModelList =
            ExpenseHomeModel(data: [], status: false);
        return emptyModelList;
      }
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<ExpenseHeadModel> getHeadExpensiveList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}/data/select_dropdowns?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    return ExpenseHeadModel.fromJson(json.decode(response));
  }

  Future<void> deleteOfficeExpense(String billId) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}/bills/delete_bill",
        {
          'user_id': storage.read('uid').toString(),
          'bill_id': billId.toString()
        },
        isHeaderRequired: true);
  }

  Future<StatusModel> crateBill({
    required String userId,
    required String expType,
    required String expenseHeadId,
    required String billDate,
    required String billNumber,
    required String payable_amount,
    required String taxPercent,
    required String bill_gross_amount,
    required String bill_tax_amount,
    required String consineeName,
    required String billRemarks,
    required String payRemark,
    var byte,
    required String paidAmount,
    required String paidDate,
    required String debit_acc,
    required String paymentMode,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}bills/create_bill",
        {
          'user_id': userId,
          'bill_type': 'expense',
          "expense_type": expType,
          "expense_head": expenseHeadId,
          "bill_date": billDate,
          "bill_no": billNumber,
          "payable_amount": payable_amount,
          "tax_percent": taxPercent,
          "bill_gross_amount": bill_gross_amount,
          "bill_tax_amount": bill_tax_amount,
          "bill_tds_amount": "",
          "consignee": consineeName,
          "bill_remarks": billRemarks,
          "payment_remarks": payRemark,
          "image": byte == null ? "" : base64Encode(byte),
          "paid_amount": paidAmount,
          "paid_date": paidDate,
          "debit_acc": debit_acc,
          "payment_mode": paymentMode,
        },
        isHeaderRequired: true);
    log(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> updatebill({
    required String billid,
    required String expType,
    required String expenseHeadId,
    required String billDate,
    required String billNumber,
    required String payable_amount,
    required String taxPercent,
    required String bill_gross_amount,
    required String billtaxamount,
    required String consineeName,
    required String billRemarks,
    required String payRemark,
    required String workid,
    var byte,
    required String paidDate,
    required String paymentMode,
  }) async {
    print("postsss");
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}bills/update_bill",
        {
          'user_id': storage.read('uid').toString(),
          'bill_type': 'expense',
          "bill_id": billid.toString(),
          "work_id": workid,
          "expense_type": expType,
          "expense_head": expenseHeadId,
          "bill_date": billDate,
          "bill_no": billNumber,
          "payable_amount": payable_amount,
          "tax_percent": taxPercent,
          "bill_gross_amount": bill_gross_amount,
          "bill_tax_amount": billtaxamount,
          "bill_tds_amount": "",
          "consignee": consineeName,
          "bill_remarks": billRemarks,
        },
        isHeaderRequired: true);
    log(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }
}
