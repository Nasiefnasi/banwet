import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';

class SubContractBillService {
  var storage = GetStorage();

  Future<void> deleteOfficeExpense(String billId, String workid) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}bills/delete_bill",
        {
          'work_id': workid.toString(),
          'user_id': storage.read('uid').toString(),
          'bill_id': billId.toString()
        },
        isHeaderRequired: true);
  }

  Future<void> updateSubContractBill({
    required String billId,
    required String workid,
    required String contractId,
    required String billDate,
    required String billNo,
    required String billPaidAmt,
    required String taxpercent,
    required String billPaidDate,
    required String billRemarks,
    required String billDebitAct,
    required String billPayMode,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}bills/update_bill",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'bill_id': billId,
          'bill_type': 'subcontract',
          'contract_id': contractId.toString(),
          'bill_date': billDate,
          'bill_no': billNo,
          'payable_amount': billPaidAmt,
          'tax_percent': taxpercent,
          'paid_amount': billPaidAmt,
          'paid_date': billPaidDate,
          'bill_remarks': billRemarks,
          'debit_acc': billDebitAct,
          'payment_mode': billPayMode,
        },
        isHeaderRequired: true);
  }
}
