import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/labour_activity.dart/labour_activity_model.dart';
import '../dailynote/get_dailynote.dart';

class LabourActivityService {
  var storage = GetStorage();
  Future<LabourActivityModel> getLabourActivity(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}labours/select_activities?user_id=${storage.read('uid')}&work_id=${workid.toString()}",
        isHeaderRequired: true);
    var a = json.decode(response);

    if (a["status"]) {
      log("========");
      return LabourActivityModel.fromJson(json.decode(response));
    } else {
      LabourActivityModel labourActivityModel =
          LabourActivityModel(data: [], status: false);
      return labourActivityModel;
    }
  }

  Future<StatusModel> addActivity({
    required String labourId,
    required String work_id,
    required String title,
    required String description,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/create_activity",
        {
          'user_id': storage.read('uid').toString(),
          'labour_id': labourId,
          'work_id': work_id.toString(),
          'title': title,
          'description': description,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> updateActivity({
    required String workid,
    required String reportId,
    required String title,
    required String description,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/update_activity",
        {
          'user_id': storage.read('uid').toString(),
          "work_id": workid.toString(),
          "report_id": reportId,
          'title': title,
          'description': description,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> deleteActivity({
    required String reportId,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/delete_activity",
        {
          "report_id": reportId, // 'user_id': storage.read('uid').toString(),
          // 'note_id': reportId.toString()
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }
}
