import 'package:banwet/app/data/model/estimation/dropdownestimation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Estimationcontroller extends GetxController {
  var storage = GetStorage();
  EstimationDropDownList? estimationDropDownmodel;
  // estimationDropDownListFromJson;
   @override
  void onInit() {
    super.onInit();
    dropdownlist();
  }
  dropdownlist() async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',

    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid').toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      estimationDropDownmodel =
          await estimationDropDownListFromJson(responsebody);
          update();
    } else {
      print(response.reasonPhrase);
    }
  }
}
