import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/taskmodel/selected_task_model.dart';
import 'package:banwet/app/index.dart';
// import 'package:http/http.dart' as http;
import '../../model/taskmodel/taskmodel.dart';

class DailyTaskService {
  var storage = GetStorage();
  Future<TaskModel> getTaskList(String projectid) async {
    print(storage.read('uid').toString());
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}daily_task/tasks?user_id=${storage.read('uid').toString()}&project_id=${projectid.toString()}",
        isHeaderRequired: true);
    var result = json.decode(response);

    // if (result["status"]) {
    return TaskModel.fromJson(json.decode(response));
    // } else {
    //   TaskModel emptyModelList = TaskModel(data: [], status: false);
    //   return emptyModelList;
    // }
  }

  HomepageTaskModel? homepageTaskModel;

  Future<HomepageTaskModel> gethomeTasksList() async {
    print(storage.read('uid').toString());
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}daily_task/tasks?user_id=${storage.read('uid').toString()}&project_id",
        isHeaderRequired: true);
    var result = json.decode(response);

    if (result["status"]) {
      return HomepageTaskModel.fromJson(json.decode(response));
    } else {
      HomepageTaskModel emptyModelList =
          HomepageTaskModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<SelectedTaskModel> getSelectedTask(String taskId) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}daily_task/task_details?user_id=${storage.read('uid')}&task_id=${taskId.toString()}",
        isHeaderRequired: true);
    var result = json.decode(response);
    if (result["status"]) {
      return SelectedTaskModel.fromJson(json.decode(response));
    } else {
      SelectedTaskModel emptyModelList = SelectedTaskModel();
      return emptyModelList;
    }
  }
}
