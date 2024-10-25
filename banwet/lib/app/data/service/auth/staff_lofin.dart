import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../api/base_url.dart';

class StaffLoginAuth {
  String baseUrl = BaseUrl.baseUrl;
  static Map<String, String> commonHeader = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'x-api-key': '159753'
  };
  // String baseUrl = BaseUrl.baseUrl;
  Future<dynamic> staffLoging(String username, String password) async {
    print("ddddddaaaaaaaaaaaaaaaaaaaaaaaa${storage.read("domain")}");
    var map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
// "${storage.read("domain")}login/login"
    try {
      var response = await http.post(
          Uri.parse("https://cma.banwet-india.com/api/login/login"),
          headers: commonHeader,
          body: map);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log("---------------------------------------------------------''''''''''''''/////");
        var storage = GetStorage();
        log(response.body.toString());

        var result = json.decode(response.body);
        storage.write("uid", result["user_id"]);
        storage.write("isUserLogin", result["status"]);

        log(result.toString());

        if (result['status'] == true) {
          log("----------->>>-");
          log(result["project_access_without_duty_sign"] +
              "]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]");
          return result;
        } else {
          return result['status'].toString();
        }
      } else {
        log(response.body);

        var result = json.decode(response.body);

        return result;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
