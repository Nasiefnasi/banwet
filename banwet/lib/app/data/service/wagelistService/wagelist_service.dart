import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/RequestModel/request_cat_modele.dart';
import '../../model/RequestModel/request_detail_model.dart';
import '../../model/WageModel/wage_labour_model.dart';

class WageLisstServiceDart {
  var storage = GetStorage();
  Future<WageListModel> getWageList(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdowns?user_id=${storage.read('uid')}&work_id=${workid.toString()}",
        isHeaderRequired: true);

    log(response.toString());
    return WageListModel.fromJson(json.decode(response));
  }

  Future<RequestDetailModel> requestbilldetails(String request) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/order_details?user_id=${storage.read('uid')}&type=request&order_id=${request.toString()}",
        isHeaderRequired: true);

    log(response.toString());
    return RequestDetailModel.fromJson(json.decode(response));
  }

  Future<RequestCatModel> requestCategoryModel() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}purchase/select_material_categories?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    log(response.toString());
    return RequestCatModel.fromJson(json.decode(response));
  }
}
