import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import '../../api/apibasehelper.dart';
import '../../model/subcontract_model/sub_activity_model.dart';
import '../dailynote/get_dailynote.dart';

class SubContractActivity {
  var storage = GetStorage();
  Future<dynamic> getSubcontractActivity(
      String workId, String contractId) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}subcontracts/select_activities?user_id=${storage.read('uid')}&work_id=${workId.toString()}&contract_id=${contractId.toString()}",
        isHeaderRequired: true);

    print(response.toString());
    log("${response}9999999999999999999999");

    var a = json.decode(response);

    if (a["status"]) {
      return SubActivityModel.fromJson(json.decode(response));
    } else {
      SubActivityModel emptyModelList =
          SubActivityModel(data: [], status: false);
      return emptyModelList;
    }
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

  Future<StatusModel> addSubContactActivity({
    required String contractId,
    required String workid,
    required String title,
    required String description,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}subcontracts/create_activity",
        {
          "user_id": storage.read('uid').toString(),
          "contract_id": contractId,
          "work_id": workid.toString(),
          "title": title,
          "description": description,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> updateSubctivity({
    required String contractId,
    required String workid,
    required String title,
    required String description,
    required String reportId,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}subcontracts/update_activity",
        {
          "user_id": storage.read('uid').toString(),
          "contract_id": contractId,
          "report_id": reportId,
          "work_id": workid.toString(),
          "title": title,
          "description": description,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }
}
