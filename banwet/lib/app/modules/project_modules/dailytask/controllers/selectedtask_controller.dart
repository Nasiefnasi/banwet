import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/taskmodel/selected_task_model.dart';
import 'package:banwet/app/data/service/dailytask.service/daily_task.service.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/modules/Dailytaskdetails/controllers/dailytaskdetails.dart';
import 'package:banwet/app/modules/notification/controllers/notification_controller.dart';

// class SelectedtaskController extends GetxController {
//   var argumnetData = Get.arguments;

//   @override
//   void onInit() {
//     super.onInit();
//     getDetails("");
//   }

//   SelectedTaskModel? selectedTaskModel;

//   getDetails(data) async {
//     selectedTaskModel = null;
//     // argumnetData["taskid"]
//     var result = await DailyTaskService().getSelectedTask(data.toString());
//     if (result.status!) {
//       selectedTaskModel = result;
//       // filteringData();
//       update();
//       // isShow.value = false;
//     } else {
//       // isShow.value = false;
//     }
//   }
// }
// class SelectedtaskController extends GetxController {
//   var argumnetData = Get.arguments;
//   SelectedTaskModel? selectedTaskModel;

//   @override
//   void onInit() {
//     super.onInit();
//     getDetails("");
//   }

//   getDetails(String taskId) async {
//     // selectedTaskModel = null;
//     // update(); // This ensures the UI shows a loading state if needed

//     var result = await DailyTaskService().getSelectedTask(taskId);

//     if (result.status!) {
//      selectedTaskModel = result;
//       update();
//       return  selectedTaskModel;
//     } else {
//       // Handle error if needed
//     }
//   }
// }
class SelectedTaskController extends GetxController {
  var storage = GetStorage();
  RxString? taskid = "".obs;
  var argumentData = Get.arguments;
  // Rx<SelectedTaskModel?> selectedTaskModel = Rx<SelectedTaskModel?>(null);
  NotificationController controller2 = Get.put(NotificationController());
  DailytaskDatailsController controlless =
      Get.put(DailytaskDatailsController());
  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  SelectedTaskModel? selectedTaskModel;

  getDetails() async {
    selectedTaskModel = null;

    var result = await DailyTaskService().getSelectedTask(taskid!.value);

    if (result.status!) {
      selectedTaskModel = result;
      update();
    } else {
      selectedTaskModel = null;
    }
  }

  postdailytask(values, taskid) async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}/daily_task/update_status'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'task_id': taskid,
      'status': values.toString()
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      getDetails();
      NotificationController().getNotifications();
      DailytaskDatailsController().getDetail();
      controlless.getDetail();
      controller2.getNotifications();
      update();
      // controller2.getDetail();
      // controller2.gettaskDetails();
    } else {
      print(response.reasonPhrase);
    }
  }
}
