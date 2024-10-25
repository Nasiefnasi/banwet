import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:banwet/app/modules/activity/Model/myactivitymodel.dart';

class ActivityController extends GetxController {
  var argumentData = Get.arguments;
  var storage = GetStorage();
  TextEditingController billDate =
      TextEditingController(text: DateTime.now().toString());
  @override
  void onInit() {
    super.onInit();
    getactivity();
  }

  MyActivityModel? myActivityModel;
  getactivity() async {
    print(storage.read('uid').toString());
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}user/activities?user_id=${storage.read('uid').toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      myActivityModel = myActivityModelFromJson(responsebody.toString());
      filterAndCalculate();
      update();
    } else {
      myActivityModel = null;
      print(response.reasonPhrase);
    }
  }

  var filteredList = <MyActivitesiteams>[].obs;
  var totalAmount = 0;
  filterAndCalculate(
      // List<DayilyNoteData> dataList,
      ) {
    // log("[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]");
    filteredList.clear();
    totalAmount = 0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < myActivityModel!.data.length; index++) {
      print(myActivityModel!.data[index].date);
      if (dateFormat
                  .parse(myActivityModel!.data[index].date.split(" ")[0])
                  .compareTo(DateTime.parse(billDate.text.split(" ")[0])) ==
              0

          //     &&
          // dateFormat
          //         .parse(myActivityModel!.data[index].date)
          //         .compareTo(DateTime.parse(endDateController.text)) <=
          //     0,
          ) {
        totalAmount++;
        filteredList.add(myActivityModel!.data[index]);
        filteredList.refresh();
        update();
        // totalAmount.value += dataList[index].totalWage;
        // log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
    if (totalAmount == 0) {
      filteredList.clear();
    }
  }
}
