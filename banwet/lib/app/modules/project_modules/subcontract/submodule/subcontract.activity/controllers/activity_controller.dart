import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../common_widegt/submitpage.dart';
import '../../../../../../data/model/subcontract_model/sub_activity_model.dart';
import '../../../../../../data/service/subcontract/subcontract_activity.dart';

class ActivityController extends GetxController {
  var dateFormat = DateFormat('dd-MM-yyyy');
  var argumentData = Get.arguments;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var isLoading = false.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  SubActivityModel? activityModel;
  getDetails() async {
    var result = await SubContractActivity().getSubcontractActivity(
        argumentData["workid"], argumentData["contractId"]);
    activityModel = result;
    await filteringData();
    update();
  }

  var filterList = <SubActivityData>[].obs;
  filteringData() async {
    filterList.clear();
    for (int i = 0; i < activityModel!.data!.length; i++) {
      if (dateFormat
                  .parse(activityModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(activityModel!.data![i].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filterList.add(activityModel!.data![i]);
        update();
        // filterList.value.add(activityModel!.data[i]);
        // log("${filterList.length}hgbfvd");
      }
    }
  }

  addSubContactActivity() async {
    isLoading.value = true;

    var result = await SubContractActivity().addSubContactActivity(
        contractId: argumentData["contractId"],
        workid: argumentData["workid"],
        title: titleController.text,
        description: descriptionController.text);
    if (result.status) {
      isLoading.value = false;
      clear();
      Get.to(() => const SubmitDone());
      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  clear() {
    titleController.clear();

    descriptionController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  updateSubActivity(String reportId) async {
    isLoading.value = true;

    var result = await SubContractActivity().updateSubctivity(
        reportId: reportId.toString(),
        contractId: argumentData["contractId"],
        workid: argumentData["workid"],
        title: titleController.text,
        description: descriptionController.text);
    if (result.status) {
      isLoading.value = false;
      clear();
      Get.to(() => const SubmitDone());
      getDetails();
    } else {
      isLoading.value = false;
    }
  }
}
