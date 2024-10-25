import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/LabourModel/labour_list_model.dart';
import '../../model/labourpayment_model.dart/labour_payment_model.dart';
import '../dailynote/get_dailynote.dart';

class LaborPaymentService {
  var storage = GetStorage();
  Future<LabourPaymentModel> getLabourpaymentList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}labours/select_labour_payments?user_id=${storage.read('uid')}",
        isHeaderRequired: true);
    var a = json.decode(response);

    if (a["status"]) {
      return LabourPaymentModel.fromJson(json.decode(response));
    } else {
      LabourPaymentModel emptyModelList =
          LabourPaymentModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<LabourModel> getLabourList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    return LabourModel.fromJson(json.decode(response));
  }

  Future<StatusModel> create({
    required String referenceId,
    required String paidAmount,
    required String paidDate,
    required String paymentModes,
    required String remarks,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}accounts/transaction_create",
        {
          'user_id': storage.read('uid').toString(),
          'tr_type': 'labour_transaction',
          'reference_id': referenceId,
          'reference_type': 'labour',
          'paid_amount': paidAmount,
          'paid_date': paidDate,
          'payment_mode': paymentModes,
          'remarks': remarks,
        },
        isHeaderRequired: true);
    log("====================>  ${response.toString()}");
    return StatusModel.fromJson(json.decode(response));
  }
}
