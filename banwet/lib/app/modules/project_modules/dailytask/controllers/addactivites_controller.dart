import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';

// class AddactivitesControllers extends GetxController {
//   TextEditingController description = TextEditingController();
//   TextEditingController title = TextEditingController();

//   SelectedtaskController controller = SelectedtaskController();
//   var storage = GetStorage();
//   var argumnetData = Get.arguments;
//   RxBool loading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // getDetails("");
//   }

//   // postaddactivites(taskid) async {
//   //   loading.value = true;
//   //   var now = DateTime.now();
//   //   var formatter = DateFormat("dd-MM-yyyy");
//   //   String formattedDate = formatter.format(now);
//   //   print(formattedDate);
//   //   var headers = {
//   //     'x-api-key': '159753',
//   //     'Content-Type': 'application/x-www-form-urlencoded',
//   //   };
//   //   var request = http.Request(
//   //       'POST', Uri.parse('${storage.read("domain")}daily_task/add_activity'));
//   //   request.bodyFields = {
//   //     'user_id': storage.read('uid'),
//   //     'task_id': taskid.toString(),
//   //     'activity_date': formattedDate,
//   //     'description': description.text,
//   //     'address': title.text,
//   //     'latitude': '',
//   //     'longitude': ''
//   //   };
//   //   request.headers.addAll(headers);
//   //   loading.value = true;
//   //   http.StreamedResponse response = await request.send();

//   //   if (response.statusCode == 200 || response.statusCode == 201) {
//   //    await controller.getDetails(taskid);
//   //    refresh();
//   //    update();
//   //     Get.to(() => const SubmitDone());
//   //     loading.value = false;
//   //     description.clear();
//   //     title.clear();
//   //   } else {
//   //     print(response.reasonPhrase);
//   //     loading.value = false;
//   //   }
//   //   loading.value = false;
//   // }
//   postaddactivites(String taskid) async {
//     loading.value = true;
//     var now = DateTime.now();
//     var formatter = DateFormat("dd-MM-yyyy");
//     String formattedDate = formatter.format(now);

//     var headers = {
//       'x-api-key': '159753',
//       'Content-Type': 'application/x-www-form-urlencoded',
//     };

//     var request = http.Request(
//         'POST', Uri.parse('${storage.read("domain")}daily_task/add_activity'));

//     request.bodyFields = {
//       'user_id': storage.read('uid'),
//       'task_id': taskid.toString(),
//       'activity_date': formattedDate,
//       'description': description.text,
//       'address': title.text,
//       'latitude': '',
//       'longitude': ''
//     };
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       await controller
//           .getDetails(taskid); // Make sure taskid is passed correctly
//       controller.update(); // Trigger UI update in the controller
//       Get.to(() => const SubmitDone()); // Navigate to the success screen
//       description.clear(); // Clear the text fields
//       title.clear();
//     } else {
//       print(response.reasonPhrase);
//     }

//     loading.value = false;
//   }
// }
class AddActivitiesController extends GetxController {
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final SelectedTaskController selectedTaskController =
      Get.find<SelectedTaskController>();
  var storage = GetStorage();
  var argumentData = Get.arguments;
  RxBool loading = false.obs;

  clear() {
    title.clear();
    description.clear();
  }

  postAddActivities(String taskId) async {
    loading.value = true;
    var now = DateTime.now();
    var formatter = DateFormat("dd-MM-yyyy");
    String formattedDate = formatter.format(now);

    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}daily_task/add_activity'));

    request.bodyFields = {
      'user_id': storage.read('uid'),
      'task_id': taskId,
      'activity_date': formattedDate,
      'description': description.text,
      'address': title.text,
      'latitude': '',
      'longitude': '',
      'title': title.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      selectedTaskController.selectedTaskModel = null;
      selectedTaskController.taskid!.value = taskId;
      selectedTaskController.getDetails();
      Get.to(() => const SubmitDone());

      // await SelectedTaskController();

      // Navigate to the success screen
      description.clear(); // Clear the text fields
      title.clear();

      // Get.to(SelectedTaskScreen());
    } else {
      print(response.reasonPhrase);
    }

    loading.value = false;
  }

  posteditactivites(activityid) async {
    loading.value = true;
    var now = DateTime.now();
    var formatter = DateFormat("dd-MM-yyyy");
    String formattedDate = formatter.format(now);
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}daily_task/update_activity'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'activity_id': activityid,
      'activity_date': formattedDate,
      'description': description.text,
      'title': title.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      selectedTaskController.getDetails();
      update();
      Get.to(() => const SubmitDone());
      update();
      description.clear(); // Clear the text fields
      title.clear();
    } else {
      print(response.reasonPhrase);
    }
  }
}
