import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/WageModel/wage_labour_model.dart';
import '../dailynote/get_dailynote.dart';

class GetWageListService {
  var storage = GetStorage();
  Future<WageListModel> getLabourList() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}data/select_dropdowns?user_id=${storage.read('uid')}",
        isHeaderRequired: true);

    print(response.toString());
    return WageListModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addLabour({
    required String name,
    required String contactNo,
    required String workType,
    required String dailyWage,
    required String fixdedWage,
    required String opBal,
    required String alternativeNo,
    required String overtimeRate,
    required String ta,
    required String address,
    required String aadhar_no,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/create_labour",
        {
          'user_id': storage.read('uid').toString(),
          'name': name,
          'contact_no': contactNo,
          'fixed_wage': fixdedWage,
          "work_type": workType.toString(),
          'daily_wage': dailyWage,
          'op_balance': opBal,
          'address': address,
          'aadhar_no': aadhar_no,
          'contact_no_2': alternativeNo,
          'image': "",
          'overtime_rate': overtimeRate,
          'ta_per_day': ta
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }
}
