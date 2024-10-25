import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/ToolsModel/tool_detail_model.dart';
import '../../model/ToolsModel/tool_detail_model2.dart';
import '../../model/ToolsModel/tools_home_model.dart';
import '../../model/subcontract_model/sub_ctract_types_model.dart';
import '../dailynote/get_dailynote.dart';

class OwnToolsService {
  var storage = GetStorage();

  Future<ToolsHomeModel> getowntoolDetails(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}tools/select?user_id=${storage.read('uid')}&work_id=${workid.toString()}&type=own",
        isHeaderRequired: true);

    log(response.toString());
    return ToolsHomeModel.fromJson(json.decode(response));
  }

  //<------------- add owntool
  Future<StatusModel> addOwntools({
    required String toolName,
    required String categoryid,
    required String quantity,
    required String price,
    required String description,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/create",
        {
          'user_id': storage.read('uid').toString(),
          'name': toolName,
          'category': categoryid,
          'description': description,
          'owned_qty': quantity,
          'price': price,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<SubContractTypesModel> getSubContractTypesModel() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    log(response.toString());
    return SubContractTypesModel.fromJson(json.decode(response));
  }

  Future<ToolDetailsModel2> getOwntollTransfers(
      String workid, String toolid) async {
    print("d${toolid.toString()}");
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}tools/select_details?user_id=${storage.read('uid')}&work_id=${workid.toString()}&tool_id=${toolid.toString()}",
        isHeaderRequired: true);

    log(response.toString());
    return ToolDetailsModel2.fromJson(json.decode(response));
  }

  Future<ToolDetailsModel> getRenttoolTransfers(
      String workid, String toolid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}tools/select_details?user_id=${storage.read('uid')}&work_id=${workid.toString()}&tool_id=${toolid.toString()}",
        isHeaderRequired: true);

    log(response.toString());
    return ToolDetailsModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addOwntoolsTransfer({
    required String quantity,
    required String workid,
    required String from,
    required String type,
    required String toolid,
    required String to,
    required String transferDate,
    required String remarks,
    // required String priceperday,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/transfer_create",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'tool_id': toolid,
          'transfer_type': type,
          'transfer_from': from,
          'transfer_to': to,
          'quantity': quantity,
          'date': transferDate,
          'remarks': remarks,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addOwntoolsRentedIn({
    required String quantity,
    required String workid,
    required String from,
    required String price,
    required String toolid,
    // required String to,
    required String transferDate,
    required String remarks,
    // required String priceperday,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/rent_create",
        {
          'user_id': storage.read('uid').toString(),
          'work_id': workid.toString(),
          'tool_id': toolid,
          'rented_from': from,
          'price': price,
          'quantity': quantity,
          'date': transferDate,
          'remarks': remarks,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addToolTransfer({
    required String quantity,
    required String workid,
    required String from,
    // required String price,
    required String toolid,
    required String type,
    required String to,
    required String transferDate,
    required String remarks,
    // required String priceperday,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}tools/transfer_create",
        {
          'user_id': storage.read('uid').toString(),
          'tool_id': workid.toString(),
          'work_id': toolid,
          'transfer_type': type,
          'transfer_from': from,
          'transfer_to': to,
          'quantity': quantity,
          'date': transferDate,
          'remarks': remarks,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }
}
