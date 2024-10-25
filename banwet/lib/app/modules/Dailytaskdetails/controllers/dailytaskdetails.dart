import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banwet/app/data/model/taskmodel/taskmodel.dart';
import 'package:banwet/app/data/service/dailytask.service/daily_task.service.dart';
import 'package:intl/intl.dart';

class DailytaskDatailsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getDetail();
  }

  var argumnetData = Get.arguments;
  var dateFormat = DateFormat('dd-MM-yyyy');
  TaskModel? taskModel;
  int pendingCount = 0;
  int inProgressCount = 0;
  int completedCount = 0;
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  RxBool dailytaskloading = false.obs;
  getDetail() async {
    dailytaskloading.value = true;
    dailytaskloading.refresh();
    update();
    print(
        "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii${argumnetData["workid"].toString()}");
    var result = await DailyTaskService().getTaskList(argumnetData["workid"]);
    if (result.status == false) {
      taskModel = null;
      print(
          "result.data!.lengt             zzzzzzzzzzzzzzzzzzzzzzh${result.data!.length}");
      print(
          "workid           zzzzzzzzzzzzzzzzzzzzzzh${argumnetData["workid"].toString()}");

      dailytaskloading.value = false;
      dailytaskloading.refresh();
      filteringData();

      update();
      // isShow.value = false;
    } else {
      taskModel = result;
      filteringData();
      dailytaskloading.value = false;
      dailytaskloading.refresh();
      update();
      // isShow.value = false;
    }
    dailytaskloading.value = false;
    dailytaskloading.refresh();
    update();
  }

  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  var filterList = <TaskData>[].obs;
  filteringData() {
    dailytaskloading.value = true;
    dailytaskloading.refresh();
    update();
    pendingCount = 0;
    inProgressCount = 0;
    completedCount = 0;
    filterList.clear();
    if (taskModel != null || taskModel!.data != null) {
      for (int i = 0; i < taskModel!.data!.length; i++) {
        log(taskModel!.data![i].dueDate ?? "");
        if (dateFormat
                    .parse(taskModel!.data![i].dueDate ?? "")
                    .compareTo(DateTime.parse(startDateController.text)) >=
                0 &&
            dateFormat
                    .parse(taskModel!.data?[i].dueDate ?? "")
                    .compareTo(DateTime.parse(endDateController.text)) <=
                0) {
          filterList.add(taskModel!.data![i]);
          filterList.refresh();
          update();
          dailytaskloading.value = false;
          dailytaskloading.refresh();
          update();
          log("${filterList.length}");
        }
      }
      dailytaskloading.value = false;
      dailytaskloading.refresh();
      update();
      for (var task in filterList) {
        String status = task.taskStatus ?? "";
        if (status == "Pending") {
          pendingCount++;
          update();
        } else if (status == "In Progress") {
          inProgressCount++;
          update();
        } else if (status == "Completed") {
          completedCount++;
          update();
        }
      }
    } else {
      filterList.clear();
      dailytaskloading.value = false;
      dailytaskloading.refresh();
      update();
    }
    dailytaskloading.value = false;
    dailytaskloading.refresh();
    update();
    // Define a reducer function to update counts
  }
}
