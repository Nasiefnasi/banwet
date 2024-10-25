import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/settings/controllers/settings_controller.dart';

class Applyleavecontroler extends GetxController {
  var storage = GetStorage();
  final GlobalKey<FormState> key3 = GlobalKey<FormState>();
  RxBool validatecolor = false.obs;
  TextEditingController LeaveResonfiled = TextEditingController();
  TextEditingController tst = TextEditingController();
  TextEditingController tst1 = TextEditingController();
  SettingsController controller = Get.put(SettingsController());
  applyleavefunction(leave_date, reason) async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=cd7c1d21828aa29c662e7fb57ca3d024556f0f84'
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}/user/create_leave_application'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'leave_date': leave_date,
      'reason': LeaveResonfiled.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhheeeeeeeeeeeeeeeeeeeeeeeeeellllllllllllllooooooooooooooooooooooo");
      Get.to(() => const SubmitDone());
      LeaveResonfiled.clear();
      controller.selectedDates.clear();
    } else {
      print(response.reasonPhrase);
    }
  }
  // String _formatSelectedDates(List<DateTime> dates) {
  //   List<String> formattedDates = [];
  //   for (int i = 0; i < dates.length; i += 2) {
  //     if (i + 1 < dates.length) {
  //       formattedDates
  //           .add("${_formatDate(dates[i])} - ${_formatDate(dates[i + 1])}");
  //     } else {
  //       formattedDates.add(_formatDate(dates[i]));
  //     }
  //   }
  //   return formattedDates.join("\n");
  // }

  // String _formatDate(DateTime date) {
  //   return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  // }
}
