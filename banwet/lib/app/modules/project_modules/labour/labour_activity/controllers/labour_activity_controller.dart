import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/WageModel/wage_labour_model.dart';
import '../../../../../data/model/labour_activity.dart/labour_activity_model.dart';
import '../../../../../data/service/labour_service/get_wagelist.dart';
import '../../../../../data/service/labour_service/labor_activity.dart';

class LabourActivityController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDetails();
    getWageList();
  }

  var dateFormat = DateFormat('dd-MM-yyyy');

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var isLoading = false.obs;
  var argumentData = Get.arguments;
  String labourid = "";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController selectLabour = TextEditingController();

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  LabourActivityModel? labourActivityModel;

  //  <----------- fetching labor activity note from api ------------>

  getDetails() async {
    log("---------");
    var result =
        await LabourActivityService().getLabourActivity(argumentData["workid"]);
    labourActivityModel = result;
    log(labourActivityModel.toString());
    filterdate();
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

  clear() {
    titleController.clear();
    selectLabour.clear();
    descriptionController.clear();
  }

  // <------------  post or add labour activity in server-  ------>
  postActivity() async {
    isLoading.value = true;

    var result = await LabourActivityService().addActivity(
        labourId: labourid,
        work_id: argumentData["workid"],
        title: titleController.text,
        description: descriptionController.text);
    if (result.status) {
      isLoading.value = false;

      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  updateActivity(String reportId) async {
    isLoading.value = true;

    var result = await LabourActivityService().updateActivity(
        reportId: reportId,
        workid: argumentData["workid"],
        title: titleController.text,
        description: descriptionController.text);
    if (result.status) {
      clear();
      getDetails();
      Get.to(() => const SubmitDone());
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  deleteActivity(String reportId) async {
    var result = await LabourActivityService().deleteActivity(
      reportId: reportId,
    );
    if (result.status) {
      clear();
      getDetails();
      // Get.to(() => const SubmitDone());
      // Get.back();
    }
  }

  var filterlist = <LabourActData>[].obs;
  filterdate() {
    filterlist.clear();
    for (var i = 0; i < labourActivityModel!.data!.length; i++) {
      if (dateFormat
                  .parse(labourActivityModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(labourActivityModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filterlist.add(labourActivityModel!.data![i]);
        update();
      }
    }
  }
}
