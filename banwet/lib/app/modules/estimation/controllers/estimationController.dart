import 'package:banwet/app/data/model/estimation/dropdownestimation.dart';
import 'package:banwet/app/data/model/estimation/estimationlistmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Estimationcontroller extends GetxController {
  var dateFormat = DateFormat('dd-MM-yyyy');
  var storage = GetStorage();
  EstimationDropDownList? estimationDropDownmodel;
  // estimationDropDownListFromJson;
  TextEditingController estimationbilldate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController salePriceCategories = TextEditingController();
  TextEditingController emailcustomer = TextEditingController();
  TextEditingController taxnumber = TextEditingController();
  TextEditingController statecode = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    dropdownlist();
  }

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());

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

// EstimationListModel estimationListModelFromJson
  EstimationListModel? estimationlist;
   RxBool estimationloading = false.obs;
  getestimationdetails() async {
    estimationloading.value = true;
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=c21ea52a9715c833b8490fb2ca5fecd43822d234'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}sales_estimation/select?user_id=${storage.read('uid').toString()}'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      estimationlist = estimationListModelFromJson(responsebody);
      filterQuotaiondate();
      update();
       estimationloading.value = false;
    update();
    } else {
      print(response.reasonPhrase); estimationloading.value = false;
    update();
    }
     estimationloading.value = false;
    update();
  }

  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  RxList<EstimationList> flterdetails = <EstimationList>[].obs;
  filterQuotaiondate() {
    flterdetails.clear();
    if (estimationlist != null || estimationlist!.data != null) {
      for (int i = 0; i < estimationlist!.data!.length; i++) {
        if (dateFormat
                    .parse(estimationlist!.data![i].createdDate.toString())
                    .compareTo(DateTime.parse(startDateController.text)) >=
                0 &&
            dateFormat
                    .parse(estimationlist!.data![i].createdDate.toString())
                    .compareTo(DateTime.parse(endDateController.text)) <=
                0) {
          flterdetails.add(estimationlist!.data![i]);
          update();
        }
      }
    }
  }
  postcreateestimation()async{var headers = {
  'x-api-key': '159753',
  'Content-Type': 'application/x-www-form-urlencoded',
  'Cookie': 'ci_session=c21ea52a9715c833b8490fb2ca5fecd43822d234'
};
var request = http.Request('POST', Uri.parse('https://test.smartbuildapp.com/api/sales_estimation/create'));
request.bodyFields = {
  'user_id': '64',
  'customer_id': '',
  'branch_id': '3',
  'estimation_to': 'branch',
  'estimation_date': '31-01-2023',
  'round_amount': '20',
  'items': '[{"material_id":"4","unit_price":"500","quantity":"20","tax_percent":"0"}]',
  'terms_and_conditions': '[{"description":"Some Terms Some Cond"}]'
};
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
}
}
