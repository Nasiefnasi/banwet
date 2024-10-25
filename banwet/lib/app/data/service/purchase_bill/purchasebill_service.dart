import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/RequestModel/request_detail_model.dart';
import '../../model/purchase/request_home_model.dart';
import '../../model/purchase/supplier_list.dart';
import '../dailynote/get_dailynote.dart';

class PurchasebillService {
  var storage = GetStorage();
  Future<RequestHomeModel> getPurchaseBill(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/orders?user_id=${storage.read('uid')}&work_id=${workid.toString()}&type=bill",
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

  Future<SupplierList> getSupplierList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/select_suppliers?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return SupplierList.fromJson(json.decode(response));
  }

  Future<StatusModel> creatPurchaseBill(
      {required String workid,
      required String supplier,
      required String vehicle,
      required String invoice,
      required String paidAmount,
      required String paidDate,
      required String paymentMode,
      required String debitAc,
      required List itemList}) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}purchase/create_order",
        {
          "user_id": storage.read('uid').toString(),
          "type": "bill",
          "work_id": workid.toString(),
          "supplier": supplier,
          "vehicle_number": vehicle,
          "invoice_number": invoice,
          "paid_amount": paidAmount,
          "paid_date": paidDate,
          "debit_acc": debitAc,
          "payment_mode": paymentMode,
          "items": jsonEncode(itemList)
        },
        isHeaderRequired: true);
    log(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<RequestDetailModel> showPurchaseBillDetails(String id) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/order_details?user_id=${storage.read('uid')}&type=bill&order_id=${id.toString()}",
        isHeaderRequired: true);

    print(response.toString());
    return RequestDetailModel.fromJson(json.decode(response));
  }
}
