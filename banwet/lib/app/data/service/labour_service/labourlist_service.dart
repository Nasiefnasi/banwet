import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/LabourModel/labour_model.dart';
import '../../model/WageModel/wage_labour_model.dart';

class LabourListService {
  var storage = GetStorage();
  Future<LabourListModel> getLabourList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}labours/select_labours?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return LabourListModel.fromJson(json.decode(response));
  }

  Future<WageListModel> getLoburs(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdowns?user_id=${storage.read('uid')}&work_id=${workid.toString()}",
        isHeaderRequired: true);

    log("$response---------------");
    return WageListModel.fromJson(json.decode(response));
  }
}
