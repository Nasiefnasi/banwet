import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/user/user_details_model.dart';

import '../../api/apibasehelper.dart';

class GetUserDetailsService {
  var storage = GetStorage();
  Future<UserDetailsModel> getUserDetails() async {
    try {
      final response = await ApiBaseHelper.get(
          // "https://test.smartbuildapp.com/api/user/details?user_id=64",
          "${storage.read("domain")}user/details?user_id=${storage.read('uid')}",

          // "https://test.smartbuildapp.com/api/user/details?user_id=${storage.read('uid')}",
          isHeaderRequired: true);
      log(response + "--------------------------------");

      return UserDetailsModel.fromJson(json.decode(response));
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}
