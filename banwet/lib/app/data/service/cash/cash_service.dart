import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/leadger.model/ledger_model.dart';

import '../../api/apibasehelper.dart';
import '../../model/cash_model.dart';

class CashService {
  var storage = GetStorage();
  Future<CashModel> getPayemntDatails() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}/user/transaction_summary?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    return CashModel.fromJson(json.decode(response));
  }

  Future<LedgerModel> getLeadgerDeatils() async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}/accounts/select_ledger",
        {
          "user_id": storage.read('uid').toString(),
          // "start_date": "24-01-2003",
          // "end_date": "24-01-2024"
        },
        isHeaderRequired: true);
    log(response + "0000000000");
    return LedgerModel.fromJson(json.decode(response));
  }
}
