import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/RequestModel/request_cat_modele.dart';
import '../../model/RequestModel/request_detail_model.dart';
import '../../model/purchase/request_home_model.dart';
import '../dailynote/get_dailynote.dart';

class PurchaseRequestService {
  var storage = GetStorage();
  Future<RequestHomeModel> getPurchaseRequest(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/orders?user_id=${storage.read('uid')}&work_id=${workid.toString()}&type=request",
        isHeaderRequired: true);

    var result = json.decode(response);
    if (result["status"]) {
      return RequestHomeModel.fromJson(json.decode(response));
    } else {
      RequestHomeModel emptyModelList =
          RequestHomeModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<RequestCatModel> getRequestCategory() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/select_material_categories?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return RequestCatModel.fromJson(json.decode(response));
  }

  Future<StatusModel> creatPurchaseRequest(
      String workid, List requstList) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}purchase/create_order",
        {
          'user_id': storage.read('uid').toString(),
          'type': 'request',
          'work_id': workid.toString(),
          'items': jsonEncode(requstList)
        },
        isHeaderRequired: true);

    return StatusModel.fromJson(json.decode(response));
  }

  Future<RequestDetailModel> showPurchaseRequestDetails(String id) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/order_details?user_id=${storage.read('uid')}&type=request&order_id=${id.toString()}",
        isHeaderRequired: true);

    print(response.toString());
    return RequestDetailModel.fromJson(json.decode(response));
  }
}
