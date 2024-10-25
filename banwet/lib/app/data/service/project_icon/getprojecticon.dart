import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/project_icon_model.dart/project_icon.dart';

class GetProjectIconService {
  var storage = GetStorage();
  Future<ProjectIconss> getDashIcons() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}projects/dash_icons?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    log(response.toString());
    return ProjectIconss.fromJson(json.decode(response));
  }
}
