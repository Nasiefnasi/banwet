// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/modules/project_modules/subcontract/subcontract.add/model/drowpdownmodel.dart';

import '../../../../data/model/subcontract_model/sub_contract_home_model.dart';
import '../../../../data/service/subcontract/subcontract_service.dart';
import 'package:http/http.dart' as http;

class SubcontractController extends GetxController {
  var storage = GetStorage();

  var argumentData = Get.arguments;
  SubContractHomeModel? subContractHomeModel;
  getList() async {
    var result = await SubContractListService()
        .getSubcontractList(argumentData["workid"]);
    subContractHomeModel = result;
    update();
  }

  SelectedDropdowndataModel? selectedDropdowndataModel;

  dropdownworktype() async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid')}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      selectedDropdowndataModel =
          selectedDropdowndataModelFromJson(responseBody);
      print(responseBody);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onInit() {
    super.onInit();
    dropdownworktype();
    getList();
  }

  var subWorkName;
  var subContr;
  var subDes;
  var subConrType;
  var subStatus;
}
