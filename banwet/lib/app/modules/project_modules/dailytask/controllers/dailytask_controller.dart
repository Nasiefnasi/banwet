import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:banwet/app/data/model/taskmodel/taskmodel.dart';
import 'package:banwet/app/data/service/dailytask.service/daily_task.service.dart';

class DailytaskController extends GetxController {
  // DailytaskController controllerx = Get.find<DailytaskController>();
  var argumnetData = Get.arguments;
  var dateFormat = DateFormat('dd-MM-yyyy');
  int inProgressCount = 0;
  int completedCount = 0;
  int pendingCount = 0;
  int homeinProgressCount = 0;
  int homecompletedCount = 0;
  int homependingCount = 0;
  String? projectid;
  @override
  void onInit() {
    super.onInit();
    gettaskDetails();
  }

  // TaskModel? taskModel;

  // getDetail() async {
  //   print(
  //       "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii${argumnetData["workid"].toString()}");
  //   var result = await DailyTaskService().getTaskList(argumnetData["workid"]);
  //   log(result.data.toString());
  //   if (result.status!) {
  //     taskModel = result;
  //     print(
  //         "result.data!.lengt             zzzzzzzzzzzzzzzzzzzzzzh${result.data!.length}");
  //     print(
  //         "workid           zzzzzzzzzzzzzzzzzzzzzzh${argumnetData["workid"].toString()}");

  //     update();
  //     // isShow.value = false;
  //   } else {
  //     // isShow.value = false;
  //   }
  //   update();
  // }

  HomepageTaskModel? homepageTaskModel;
  gettaskDetails() async {
    // print(
    //     "workid           zzzzzzzzzzzzzzzzzzzzzzh${argumnetData["workid"].toString()}");
    var result = await DailyTaskService().gethomeTasksList();
    log(result.data.toString());
    if (result.status!) {
      homepageTaskModel = result;
      print(
          "result.data!.lengt             zzzzzzzzzzzzzzzzzzzzzzh${result.data!.length}");
      // print(
      //     "workid           zzzzzzzzzzzzzzzzzzzzzzh${argumnetData["workid"].toString()}");
      filteringHometaskData();
      update();
      // isShow.value = false;
    } else {
      // isShow.value = false;
    }
  }

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  // var filterList = <TaskData>[].obs;

  // filteringData() {
  //   pendingCount = 0;
  //   inProgressCount = 0;
  //   completedCount = 0;
  //   filterList.clear();
  //   for (int i = 0; i < taskModel!.data!.length; i++) {
  //     log(taskModel!.data![i].dueDate ?? "");
  //     if (dateFormat
  //                 .parse(taskModel!.data![i].dueDate ?? "")
  //                 .compareTo(DateTime.parse(startDateController.text)) >=
  //             0 &&
  //         dateFormat
  //                 .parse(taskModel!.data?[i].dueDate ?? "")
  //                 .compareTo(DateTime.parse(endDateController.text)) <=
  //             0) {
  //       filterList.add(taskModel!.data![i]);
  //       log("${filterList.length}");
  //       update();
  //     }
  //   }

  //   for (var task in filterList) {
  //     String status = task.taskStatus ?? "";
  //     if (status == "Pending") {
  //       pendingCount++;
  //       update();
  //     } else if (status == "InProgress") {
  //       inProgressCount++;
  //       update();
  //     } else if (status == "Completed") {
  //       completedCount++;
  //       update();
  //     }
  //   }
  //   // Define a reducer function to update counts
  // }

  var filterhomepagetaskList = <TaskDetails>[].obs;

  filteringHometaskData() {
    // pendingCount = 0;
    homeinProgressCount = 0;
    homecompletedCount = 0;
    homependingCount = 0;
    // pendingCount = 0;
    // inProgressCount = 0;
    // completedCount = 0;
    filterhomepagetaskList.clear();
    for (int i = 0; i < homepageTaskModel!.data!.length; i++) {
      log(homepageTaskModel!.data![i].dueDate ?? "");
      if (dateFormat
                  .parse(homepageTaskModel!.data![i].dueDate ?? "")
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(homepageTaskModel!.data?[i].dueDate ?? "")
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filterhomepagetaskList.add(homepageTaskModel!.data![i]);
        log("${filterhomepagetaskList.length}");
      }
    }

    for (var task in filterhomepagetaskList) {
      String status = task.taskStatus ?? "";
      if (status == "Pending") {
        homependingCount++;
        update();
      } else if (status == "InProgress") {
        homeinProgressCount++;
        update();
      } else if (status == "Completed") {
        homecompletedCount++;
        update();
      }
    }
    // Define a reducer function to update counts
  }
}
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:banwet/app/data/model/taskmodel/taskmodel.dart';
// import 'package:banwet/app/data/service/dailytask.service/daily_task.service.dart';

// class DailytaskController extends GetxController {
//   var argumentData = Get.arguments;
//   var dateFormat = DateFormat('dd-MM-yyyy');
//   int inProgressCount = 0;
//   int completedCount = 0;
//   int pendingCount = 0;
//   int homeinProgressCount = 0;
//   int homecompletedCount = 0;
//   int homependingCount = 0;
//   String? projectid;

//   @override
//   void onInit() {
//     super.onInit();
//     getDetail();
//     gettaskDetails();
//   }

//   TaskModel? taskModel;

//   getDetail() async {
//     print("hello data this item is not working");
//     print("workid: ${argumentData["workid"].toString()}");
//     var result =
//         await DailyTaskService().getTaskList(argumentData["workid"].toString());
//     log(result.data.toString());
//     if (result.status!) {
//       taskModel = result;
//       filteringData();
//       update();
//     }
//     update();
//   }

//   HomepageTaskModel? homepageTaskModel;
//   gettaskDetails() async {
//     var result = await DailyTaskService().gethomeTasksList("");
//     log(result.data.toString());
//     if (result.status!) {
//       homepageTaskModel = result;
//       filteringHometaskData();
//       update();
//     }
//   }

//   TextEditingController startDateController = TextEditingController(
//     text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
//   );
//   TextEditingController endDateController = TextEditingController(
//     text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
//   );
//   var endDate = DateTime.now();
//   var startDate = DateTime.now();

//   change() {
//     endDate = DateTime.parse(endDateController.text);
//     startDate = DateTime.parse(startDateController.text);
//     update();
//   }

//   var filterList = <TaskData>[].obs;

//   filteringData() {
//     pendingCount = 0;
//     inProgressCount = 0;
//     completedCount = 0;
//     filterList.clear();
//     for (int i = 0; i < taskModel!.data!.length; i++) {
//       if (taskModel?.data?[i].dueDate != null) {
//         var dueDate = dateFormat.parse(taskModel!.data![i].dueDate!);
//         if (dueDate.compareTo(DateTime.parse(startDateController.text)) >= 0 &&
//             dueDate.compareTo(DateTime.parse(endDateController.text)) <= 0) {
//           filterList.add(taskModel!.data![i]);
//         }
//       }
//     }
//     filterList.refresh();
//     update();

//     for (var task in filterList) {
//       String status = task.taskStatus ?? "";
//       if (status == "Pending") {
//         pendingCount++;
//       } else if (status == "InProgress") {
//         inProgressCount++;
//       } else if (status == "Completed") {
//         completedCount++;
//       }
//     }
//     update();
//   }

//   var filterhomepagetaskList = <TaskDetails>[].obs;

//   filteringHometaskData() {
//     homeinProgressCount = 0;
//     homecompletedCount = 0;
//     homependingCount = 0;
//     filterhomepagetaskList.clear();
//     for (int i = 0; i < homepageTaskModel!.data!.length; i++) {
//       if (homepageTaskModel?.data?[i].dueDate != null) {
//         var dueDate = dateFormat.parse(homepageTaskModel!.data![i].dueDate!);
//         if (dueDate.compareTo(DateTime.parse(startDateController.text)) >= 0 &&
//             dueDate.compareTo(DateTime.parse(endDateController.text)) <= 0) {
//           filterhomepagetaskList.add(homepageTaskModel!.data![i]);
//         }
//       }
//     }
//     update();

//     for (var task in filterhomepagetaskList) {
//       String status = task.taskStatus ?? "";
//       if (status == "Pending") {
//         homependingCount++;
//       } else if (status == "InProgress") {
//         homeinProgressCount++;
//       } else if (status == "Completed") {
//         homecompletedCount++;
//       }
//     }
//     update();
//   }
// }
