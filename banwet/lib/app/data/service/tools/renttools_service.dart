import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/ToolsModel/tools_home_model.dart';
import '../../model/subcontract_model/sub_ctract_types_model.dart';
import '../dailynote/get_dailynote.dart';

class RentToolsService {
  var storage = GetStorage();

  Future<ToolsHomeModel> getrenttoolDetails(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}tools/select?user_id=${storage.read('uid')}&work_id=${workid.toString()}&type=rent",
        isHeaderRequired: true);

    print(response.toString());
    return ToolsHomeModel.fromJson(json.decode(response));
  }

  Future<SubContractTypesModel> getSubContractTypesModel() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return SubContractTypesModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addRenttools({
    required String workid,
    required String quantity,
    required String rentid,
    required String date,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/create",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid,
          'rent_id': rentid,
          'quantity': quantity,
          'date': date,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addRenttoolsTransfer({
    required String quantity,
    required String workid,
    required String from,
    required String type,
    required String toolid,
    required String transferDate,
    required String remarks,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/rent_create",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'tool_id': toolid,

          'rented_from': from,
          // 'transfer_to': toolTransferTo.text,
          'quantity': quantity,
          'date': transferDate,
          'remarks': remarks,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }
}
