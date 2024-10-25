import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/officeExpense/expense_head_model.dart';
import '../../model/subcontract_model/sub_common_model.dart';
import '../dailynote/get_dailynote.dart';

class SubContractPayment {
  var storage = GetStorage();
  Future<SubCommonModel> getSubcontractList(
      String workId, String contractId) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}subcontracts/select_details?user_id=${storage.read('uid')}&work_id=${workId.toString()}&contract_id=${contractId.toString()}",
        isHeaderRequired: true);

    print(response.toString());
    log("${response}9999999999999999999999");
    return SubCommonModel.fromJson(json.decode(response));
  }

  Future<ExpenseHeadModel> getDropDown(
    String workId,
  ) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdowns?user_id=${storage.read('uid')}&work_id=${workId.toString()}",
        isHeaderRequired: true);

    print(response.toString());
    log(response.toString());
    return ExpenseHeadModel.fromJson(json.decode(response));
    
  }

  Future<StatusModel> addSubContractPayment({
    required String contractId,
    required String payimentAmt,
    required String workid,
    required String payDate,
    required String payMode,
    required String payRemarks,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}accounts/transaction_create",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'tr_type': 'subcontract_advance_transaction',
          'reference_id': contractId.toString(),
          'reference_type': 'subcontract',
          'paid_amount': payimentAmt,
          'paid_date': payDate,
          'payment_mode': payMode,
          'remarks': payRemarks,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addSubContractBill({
    required String contractId,
    required String paidamount,
    required String workid,
    required String billDate,
    required String payDate,
    required String billNo,
    required String billRemarks,
    required String taxpersentage,
    required String grossAmount,
    required String payMode,
    required String payRemarks,
    required String taxamount,
    required String billDebitAct,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}bills/create_bill",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'bill_type': 'subcontract',
          'contract_id': contractId.toString(),
          'bill_date': billDate,
          'bill_no': billNo,
          "bill_tax_amount": taxamount,
          'payable_amount': grossAmount,
          'tax_percent': taxpersentage.toString(),
          'paid_amount': paidamount,
          'paid_date': payDate,
          'bill_remarks': billRemarks,
          'debit_acc': billDebitAct,
          'payment_mode': payMode,
        },
        isHeaderRequired: true);
    log(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }
}
