import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/travelexpense/travel_head_model.dart';
import '../../model/travelexpense/travel_model.dart';
import '../dailynote/get_dailynote.dart';

class TravelExpenseService {
  var storage = GetStorage();

  Future<TavelExpenseModel> getTravelExpensiveList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}travel_allowance/select_ta?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    var a = json.decode(response);

    if (a["status"]) {
      return TavelExpenseModel.fromJson(json.decode(response));
    } else {
      TavelExpenseModel emptyModelList =
          TavelExpenseModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<StatusModel> deleteTravelbill(String taid) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}travel_allowance/delete_ta",
        {'user_id': storage.read('uid').toString(), 'ta_id': taid.toString()},
        isHeaderRequired: true);

    print(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addTravelAlavence(
      {required String taVehicle,
      required String taFrom,
      required String taTo,
      required String taKm,
      required String taAmount,
      required String remarks,
      required dynamic endimage,
      required var byte}) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}travel_allowance/create_ta",
        {
          'user_id': storage.read('uid').toString(),
          'ta_vehicle': taVehicle,
          'ta_from': taFrom,
          'ta_to': taTo,
          'ta_km': taKm,
          'ta_amount': taAmount,
          'remarks': remarks,
          "image": byte == null ? "" : base64Encode(byte),
          'image_end': endimage == null ? "" : base64Encode(endimage)
        },
        isHeaderRequired: true);
    print(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<TaHeadModel> getTravelHead() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdowns?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    var a = json.decode(response);

    if (a["status"]) {
      return TaHeadModel.fromJson(json.decode(response));
    } else {
      TaHeadModel emptyModelList =
          TaHeadModel(taVehicleType: [], status: false);
      return emptyModelList;
    }
  }

  Future<StatusModel> editTravelAlavence(
      {required String taVehicle,
      required String taFrom,
      required String taTo,
      required String taKm,
      required String taAmount,
      required dynamic endimage,
      required String remarks,
      required String taId,
      var byte}) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}travel_allowance/update_ta",
        {
          'ta_id': taId,
          'user_id': storage.read('uid').toString(),
          'ta_vehicle': taVehicle,
          'ta_from': taFrom,
          'ta_to': taTo,
          'ta_km': taKm,
          'ta_amount': taAmount,
          'remarks': remarks,
          'image_end': endimage == null ? "" : base64Encode(endimage),
        },
        isHeaderRequired: true);
    print(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }
}
