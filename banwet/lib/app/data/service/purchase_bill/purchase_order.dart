import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/RequestModel/request_detail_model.dart';
import '../../model/purchase/request_home_model.dart';
import '../dailynote/get_dailynote.dart';

class PurchaseOrderService {
  var storage = GetStorage();
  Future<RequestHomeModel> getPurchaseOrder(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/orders?user_id=${storage.read('uid')}&work_id=${workid.toString()}&type=order",
        isHeaderRequired: true);
    var result = json.decode(response);
    log(response);
    if (result["status"]) {
      return RequestHomeModel.fromJson(json.decode(response));
    } else {
      RequestHomeModel emptyModelList =
          RequestHomeModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<StatusModel> creatPurchaseOrder(String workid, String supplier,
      String vechile, String invoice, List orderList, date) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}purchase/create_order",
        {
          'user_id': storage.read('uid').toString(),
          'type': "order",
          'work_id': workid.toString(),
          "supplier": supplier,
          "vehicle_number": vechile,
          "delivery_date": date.toString(),
          "invoice_number": invoice,
          "total_billed_amount": "",
          'items': jsonEncode(orderList)
        },
        isHeaderRequired: true);

    return StatusModel.fromJson(json.decode(response));
  }

  Future<RequestDetailModel> showPurchaseBillDetails(String id) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/order_details?user_id=${storage.read('uid')}&type=order&order_id=$id",
        isHeaderRequired: true);

    print(response.toString());
    return RequestDetailModel.fromJson(json.decode(response));
  }
}
