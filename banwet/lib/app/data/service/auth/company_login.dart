import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../api/base_url.dart';

class AuthHelper {
  static Map<String, String> commonHeader = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'x-api-key': '159753'
  };
  String baseUrl = BaseUrl.baseUrl;
  Future<String> loginUser(String clientCode, String clientKey) async {
    var map = <String, dynamic>{};
    map['client code'] = clientCode;
    map['client key'] = clientKey;

    var response = await http.post(
        Uri.parse("http://clients.genovatechnologies.com/api/clients/login"),
        headers: commonHeader,
        body: map);

    log(response.body.toString());
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      print(result.toString());
      var storage = GetStorage();
      storage.write("domain", result["data"]["domain"]);

      log(storage.read("domain"));
      baseUrl = storage.read("domain");

      storage.write("name", result["data"]["client_name"]);
      storage.write("logo", result["data"]["logo"]);
      storage.write("isLogin", true);

      String a = storage.read("logo");
      print("$a=====================");

      if (result['status'] == true) {
        print("----------->>>-");
        return result['status'].toString();
      } else {
        return result['status'].toString();
      }
    } else {
      log(",----------->");
      var result = json.decode(response.body);
      return result['status'].toString();
    }
  }
}
