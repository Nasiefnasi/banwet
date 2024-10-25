import 'dart:convert';

import 'package:banwet/app/index.dart';

class ClientPaymentService {
  Future<void> getTaskList(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}accounts/transaction_select/client_payment?user_id=${storage.read('uid')}&project_id=${workid.toString()}",
        isHeaderRequired: true);
    var result = json.decode(response);

    if (result["status"]) {
      // return TaskModel.fromJson(json.decode(response));
    } else {
      // TaskModel emptyModelList = TaskModel(data: [], status: false);
      // return emptyModelList;
    }
  }
}
