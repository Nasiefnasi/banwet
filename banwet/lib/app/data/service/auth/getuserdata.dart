import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/user/use_home.dart';

class GetUserdata {
  var storage = GetStorage();
  Future<UserHomeModel> fetchOnGoing() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}user/details?user_id=${storage.read('uid')}",
        isHeaderRequired: true);
    print(response.toString());
    return UserHomeModel.fromJson(json.decode(response));
  }
}
