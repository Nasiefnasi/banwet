import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/LabourModel/labour_model.dart';
import '../../../../../data/model/WageModel/wage_labour_model.dart';
import '../../../../../data/service/labour_service/get_wagelist.dart';
import '../../../../../data/service/labour_service/labourlist_service.dart';

class LabourListController extends GetxController {
  var argumentData = Get.arguments;
  var filteredData = <LabourData>[].obs; // the filtered list of data
  var controller = TextEditingController();
  var searchText = "".obs;
  List item = ['Fixed', 'Not Fixed'];

  // <---------  this function using to  listing labours
  LabourListModel? labourListModel;
  getLabourList() async {
    var result = await LabourListService().getLabourList();
    labourListModel = result;
    filteredData.value = labourListModel!.data!.toList();
    update();
  }

  // <---------   this api call for fetichg work type payament mode more like add lobour add section  -->
  WageListModel? wageListModel;
  getWageList() async {
    var result = await GetWageListService().getLabourList();
    wageListModel = result;
    // filteredData.value = labourListModel!.data!.toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLabourList();
    getWageList();
  }

  //   <---------  this funvtion using to filtering by labour name ---->
  filterData() {
    filteredData.clear();
    if (searchText.value.isEmpty) {
      filteredData.value = labourListModel!.data!.toList();
      update();
    } else {
      filteredData.value = labourListModel!.data!
          .where((data) =>
              data.labourName!.toString().toLowerCase().contains(searchText))
          .toList(); // filter the data based on search text
      update();
    }
  }

  TextEditingController fixedwage = TextEditingController();
  TextEditingController labourName = TextEditingController();
  TextEditingController wageperday = TextEditingController();
  TextEditingController aadhar_no = TextEditingController();
  TextEditingController workType = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController alternativeNumber = TextEditingController();
  TextEditingController aadharNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController balance = TextEditingController();
  TextEditingController wageType = TextEditingController();
  TextEditingController wageRate = TextEditingController();
  TextEditingController overtimeRate = TextEditingController();
  TextEditingController ta = TextEditingController();
  var isLoading = false.obs;
  addLabour(String fixdedWage) async {
    isLoading.value = true;
    var result = await GetWageListService().addLabour(
        aadhar_no: aadharNumber.text,
        name: labourName.text,
        contactNo: contactNumber.text,
        workType: wageType.text,
        dailyWage: wageperday.text,
        fixdedWage: fixdedWage,
        opBal: balance.text,
        alternativeNo: alternativeNumber.text,
        overtimeRate: wageRate.text,
        ta: ta.text,
        address: address.text);
    if (result.status) {
      isLoading.value = false;
      getLabourList();
      getWageList();
      clear();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  clear() {
    labourName.clear();
    workType.clear();
    contactNumber.clear();
    alternativeNumber.clear();
    aadharNumber.clear();
    address.clear();
    balance.clear();
    wageType.clear();
    wageRate.clear();
    overtimeRate.clear();
    ta.clear();
  }
}
