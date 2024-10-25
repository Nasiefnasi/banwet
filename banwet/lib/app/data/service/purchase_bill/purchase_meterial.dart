import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/RequestModel/request_model.dart';

class PurchaseMeterialService {
  var storage = GetStorage();

  Future<RequestModel> getPurchaseMeterialList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/select_materials?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return RequestModel.fromJson(json.decode(response));
  }
}
