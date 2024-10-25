import 'dart:convert';

// import 'package:http/http.dart' as http;

import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/notification.model/notification_model.dart';
import 'package:banwet/app/index.dart';

class NotificationService {
  var storage = GetStorage();
  Future<NotificationModel?> getNotification() async {
    print(
        "HHHHHHHHHHHHHHHHHHHHHHHheeeeeeeeeeeellllllllllllllooooooooooooo${storage.read('uid')}");
    // try {
    //   var headers = {
    //     'x-api-key': '159753',
    //     'Content-Type': 'application/x-www-form-urlencoded',
    //     'Cookie': 'ci_session=bbf2daeb3726991c213a4efe82c8c4e0408953ad'
    //   };
    //   var request = http.Request(
    //       'GET',
    //       Uri.parse(
    //           '${storage.read("domain")}/user/notifications?user_id=${storage.read('uid')}'));

    //   request.headers.addAll(headers);

    //   http.StreamedResponse response = await request.send();

    //   if (response.statusCode == 200) {
    //     return NotificationModel.fromJson(json.decode(response.toString()));
    //   }
    // } catch (e) {
    //   return NotificationModel(data: []);
    // }

    try {
      final response = await ApiBaseHelper.get(
          "${storage.read("domain")}user/notifications?user_id=${storage.read('uid')}",
          isHeaderRequired: true);
      print(response.toString());
      return NotificationModel.fromJson(json.decode(response));
    } catch (e) {
      return NotificationModel(data: []);
    }
  }
}
