import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/subcontract_model/sub_contract_home_model.dart';

class SubContractListService {
  var storage = GetStorage();
  Future<SubContractHomeModel> getSubcontractList(String workId) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}subcontracts/select?user_id=${storage.read('uid')}&work_id=$workId",
        isHeaderRequired: true);

    var result = json.decode(response);

    if (result["status"]) {
      return SubContractHomeModel.fromJson(json.decode(response));
    } else {
      SubContractHomeModel emptyModelList =
          SubContractHomeModel(data: [], status: false);
      return emptyModelList;
    }
  }
}
