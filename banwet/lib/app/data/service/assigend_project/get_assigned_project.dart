import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/ProjectModel/project_assign.dart';

class AssignedProject {
  var storage = GetStorage();

  Future<AssignProjectModel> getAssignedProject() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}/projects?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return AssignProjectModel.fromJson(json.decode(response));
  }
}
