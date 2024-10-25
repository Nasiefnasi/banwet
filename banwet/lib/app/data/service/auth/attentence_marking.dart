import 'dart:convert';
import 'dart:developer';

import '../../api/apibasehelper.dart';
import '../../api/base_url.dart';
import '../dailynote/get_dailynote.dart';


class AttendenceMarkingService {
  Future<StatusModel> addAttentence(String attendance, String address,
      String landmark, String latitude, String longitude,String user, String userId) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}attendance/attendance", {
      'user_id': userId,
      'attendance': attendance,
      'address': address,
      'landmark': landmark,
      'latitude': latitude,
      'longitude': longitude
    });
    print(response.toString());
    log(response.toString());
    return StatusModel.fromJson(json.decode(response));

    // return response.toString();
  }
}
