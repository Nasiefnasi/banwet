import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../dailynote/get_dailynote.dart';

class DutySingOffService {
  var storage = GetStorage();
  Future<StatusModel> dutySingoff(String address, String landmark,
      String latitude, String longitude) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}attendance/sign_off",
        {
          'user_id': storage.read('uid').toString(),
          'address': address,
          'landmark': landmark,
          'latitude': latitude,
          'longitude': longitude
        },
        isHeaderRequired: true);

    var a = json.decode(response);
    log(a.toString());
    return StatusModel.fromJson(json.decode(response));
  }
}
