import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';

class ActivitesDelete extends GetxController {
  final SelectedTaskController selectedTaskController =
      Get.find<SelectedTaskController>();
  var storage = GetStorage();

  // Method to post a delete request for an activity
  postdeleteactivities(activityid) async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}daily_task/delete_activity'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'activity_id': activityid.toString(),
    };
    request.headers.addAll(headers);

    // Sending the request and awaiting the response
    http.StreamedResponse response = await request.send();

    // Handling the response
    if (response.statusCode == 200 || response.statusCode == 201) {
      selectedTaskController.getDetails();
      update();
    } else {
      // Handle error scenario
    }
  }
}
