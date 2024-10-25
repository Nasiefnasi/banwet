import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:banwet/app/common_widegt/submitpage.dart';
import 'package:banwet/app/modules/projecttask/controllers/modelclass/projectdetalismodel.dart';
import 'package:banwet/app/modules/projecttask/controllers/modelclass/projecttastmodel.dart';
import 'package:intl/intl.dart';

class ProjecttaskController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    projecttasklist();
  }

  // GlobalKey _formKey = GlobalKey<FormState>();
  var dateFormat = DateFormat('dd-MM-yyyy');
  final RxBool onpick = false.obs;
  var storage = GetStorage();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var arugumentData = Get.arguments;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController stratdate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController transferdate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController enddate =
      TextEditingController(text: DateTime.now().toString());
  // TextEditingController startDateController = TextEditingController(
  //     text:
  //         DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  // TextEditingController endDateController =
  //     TextEditingController(text: DateTime.now().toString());
// Projecttaskmodel projecttaskmodelFromJson
  RxBool projecttaskworking = false.obs;
  RxBool projectworking = false.obs;
  Projecttaskmodel? projecttaskmodel;
  projecttasklist() async {
    projectworking.value = true;
    projectworking.refresh();
    print(storage.read('uid'));
    print(arugumentData["workid"]);
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    try {
      var request = http.Request(
          'GET',
          Uri.parse(
              '${storage.read("domain")}project_tasks/select_tasks?user_id=${storage.read('uid')}&work_id=${arugumentData["workid"]}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseboady = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        projecttaskmodel = projecttaskmodelFromJson(responseboady);
        print(
            "new progess value  :- ${projecttaskmodel!.data.first.progress.toString()}");
        projectworking.value = false;
        projectworking.refresh();
        update();
      } else {
        print(response.reasonPhrase);
        projectworking.value = false;
        projectworking.refresh();
        update();
      }
    } catch (e) {
      print("project task find error-------------- ${e}");
      projectworking.value = false;
      projectworking.refresh();
    }
    // projectworking.value = false;
    // projectworking.refresh();
  }

  // var subtask = <ProjecttastListDetailsModel>[].obs;
  // var projectsubtsakactivity = <ProjectActivity>[].obs;
  // ProjecttastListDetailsModel? projectDetailsModel;
  // projecttaskdetails(task_id) async {
  //   projecttaskworking.value = true;
  //   var headers = {
  //     'x-api-key': '159753',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //   };
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           '${storage.read("domain")}project_tasks/select_task_details?user_id=${storage.read('uid')}&task_id=$task_id'));

  //   request.headers.addAll(headers);
  //   try {
  //     http.StreamedResponse response = await request.send();
  //     String responseboady = await response.stream.bytesToString();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       projectDetailsModel =
  //           projecttastListDetailsModelFromJson(responseboady);
  //       if (projectDetailsModel != null) {
  //         if (projectDetailsModel!.subtasks != null) {
  //           // subtask.value = projectDetailsModel!.subtasks!.toList();
  //           subtask.value.addAll(projectDetailsModel!.subtasks!.toList());
  //           subtask.refresh();
  //           update();
  //         }
  //         if (projectDetailsModel!.activities != null) {
  //           projectsubtsakactivity.value =
  //               projectDetailsModel!.activities!.toList();
  //           projectsubtsakactivity.refresh();
  //           update();
  //         }
  //       }
  //       update();
  //       projecttaskworking.value = false;
  //       projecttaskworking.refresh();
  //     } else {
  //       print(response.reasonPhrase);
  //       projecttaskworking.value = false;
  //       projecttaskworking.refresh();
  //     }
  //   } catch (e) {
  //     print("Project Task Detalis Issues-------------------$e");
  //     projecttaskworking.value = false;
  //     projecttaskworking.refresh();
  //   }
  //   projecttaskworking.value = false;
  // }
  var subtask = <ProjecttastListDetailsModel>[].obs;
  var projectsubtsakactivity = <ProjectActivity>[].obs;
  ProjecttastListDetailsModel? projectDetailsModel;
  RxString projectdetailstaskId = "".obs;
  projecttaskdetails() async {
    subtask.clear();
    projectsubtsakactivity.clear();
    projecttaskworking.value = true;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}project_tasks/select_task_details?user_id=${storage.read('uid')}&task_id=$projectdetailstaskId'));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      String responseboady = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        projectDetailsModel =
            projecttastListDetailsModelFromJson(responseboady);
        if (projectDetailsModel != null) {
          if (projectDetailsModel!.subtasks != null) {
            subtask.value = projectDetailsModel!.subtasks!.toList();
            subtask.refresh();
            update();
          }
          if (projectDetailsModel!.activities != null) {
            projectsubtsakactivity.value =
                projectDetailsModel!.activities!.toList();
            projectsubtsakactivity.refresh();
            update();
          }
        }
        update();
        projecttaskworking.value = false;
      } else {
        print(response.reasonPhrase);
        projecttaskworking.value = false;
      }
    } catch (e) {
      print("Project Task Detalis Issues-------------------$e");
      projecttaskworking.value = false;
    }
    projecttaskworking.value = false;
  }

  RxBool subtaskactivity = false.obs;
  // SubTaskActivitys? subtaskActivity;
  // var subtask = <ProjecttastListDetailsModel>[].obs;
  var SubActivitylist = <SubActivity>[].obs;
  SubTaskActivitys? subTaskActivitys;
  RxString subActivitytaskID = "".obs;
  getActivitydetails() async {
    // subtask.clear();
    SubActivitylist.clear();
    subtaskactivity.value = true;
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}project_tasks/select_task_details?user_id=${storage.read('uid')}&task_id=${subActivitytaskID.value.toString()}'));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      String responseboady = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        subTaskActivitys = SubTaskActivitysFromJson(responseboady);
        if (subTaskActivitys != null) {
          // if (subtaskActivity!.subtasks != null) {
          //   subtask.value = subtaskActivity!.subtasks!.toList();
          //   subtask.refresh();
          //   update();
          // }
          if (subTaskActivitys!.activities != null) {
            SubActivitylist.value = subTaskActivitys!.activities!.toList();
            SubActivitylist.refresh();
            projecttaskworking.value = false;
            update();
          }
          subtaskactivity.value = false;
          update();
        }
        update();
        subtaskactivity.value = false;
        update();
      } else {
        print(response.reasonPhrase);
        subtaskactivity.value = false;
        update();
      }
    } catch (e) {
      print("Project Task Detalis Issues-------------------$e");
      subtaskactivity.value = false;
      update();
    }
    subtaskactivity.value = false;
    update();
  }

  RxBool statusupdateLoading = false.obs;
  updateProgersStatus(task_id, progress) async {
    statusupdateLoading.value = true;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '${storage.read("domain")}project_tasks/update_task_progress'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'task_id': task_id,
      'progress': progress
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.back();
      statusupdateLoading.value = false;

      projecttaskdetails();
      projecttasklist();

      update();
    } else {
      print(response.reasonPhrase);
      statusupdateLoading.value = false;
      update();
    }
    statusupdateLoading.value = false;
    update();
  }

  clear() {
    title.clear();
    description.clear();
    stratdate.text = DateTime.now().toString();
    enddate.text = DateTime.now().toString();
  }

  RxDouble progressValue = 0.0.obs; // Initial progress value
// RxString progerss
  void updateProgress(double newValue) {
    progressValue.value = newValue;
    progressValue.refresh();
    update();
  }

  RxBool createprojectloading = false.obs;
  createproject() async {
    createprojectloading.value = true;

    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    try {
      var request = http.Request('POST',
          Uri.parse('${storage.read("domain")}project_tasks/create_task'));
      request.bodyFields = {
        'user_id': storage.read('uid'),
        'parent_id': projectdetailstaskId.value,
        'title': title.text,
        'start_date': stratdate.text,
        'end_date': enddate.text,
        'description': description.text,
        'work_id': arugumentData["workid"],
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        projecttaskdetails();
        projecttasklist();

        Get.to(() => const SubmitDone());

        update();
        clear();
        createprojectloading.value = false;
        createprojectloading.refresh();
      } else {
        print(response.reasonPhrase);
        createprojectloading.value = false;
        createprojectloading.refresh();
      }
    } catch (e) {
      print("This is Project sub Task Create add part -------------$e");
      createprojectloading.value = false;
      createprojectloading.refresh();
    }
    createprojectloading.value = false;
    createprojectloading.refresh();
  }

  RxBool taskactivityloading = false.obs;

  createsubtaskactivitiy(taskid) async {
    taskactivityloading.value = true;
    taskactivityloading.refresh();
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=5a926925f8fb4c210f519ea90add39dc730a9558'
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}project_tasks/create_activity'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'task_id': taskid,
      'title': title.text,
      'description': description.text,
      'date': transferdate.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      // projecttaskdetails();
      getActivitydetails();
      update();
      // projecttasklist();

      taskactivityloading.value = false;
      taskactivityloading.refresh();
      update();
      Get.to(() => const SubmitDone());
      clear();
    } else {
      taskactivityloading.value = false;
      taskactivityloading.refresh();
      update();
    }
    taskactivityloading.value = false;
    taskactivityloading.refresh();
    update();
  }

  RxBool editloading = false.obs;
  eitactivivty(activity_id) async {
    taskactivityloading.value = true;
    taskactivityloading.refresh();
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}project_tasks/update_activity'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'activity_id': activity_id,
      'title': title.text,
      'description': description.text,
      'date': transferdate.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      // projecttaskdetails();
      getActivitydetails();
      // projecttasklist();
      Get.to(() => const SubmitDone());
      taskactivityloading.value = false;
      taskactivityloading.refresh();
      update();
      clear();
    } else {
      taskactivityloading.value = false;
      taskactivityloading.refresh();
      print(response.reasonPhrase);
    }
    taskactivityloading.value = false;
    taskactivityloading.refresh();
    update();
  }

  activtydelete(activity_id) async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}project_tasks/delete_activity'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'activity_id': activity_id
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      // projecttaskdetails();
      getActivitydetails();
      // projecttasklist();
      update();
      Get.back();
    } else {
      print(response.reasonPhrase);
    }
  }
}
