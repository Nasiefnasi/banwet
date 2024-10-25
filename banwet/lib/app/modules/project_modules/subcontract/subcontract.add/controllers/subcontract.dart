import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/data/model/subcontract_model/sub_contract_home_model.dart';
import 'package:banwet/app/modules/project_modules/subcontract/controllers/subcontract_controller.dart';

class SubcontractAddingController extends GetxController {
  SubcontractController controller = Get.find<SubcontractController>();

  var storage = GetStorage();
  List<UniteRate> uniteRate = <UniteRate>[].obs;
  List<FixedRate> fixedrate = <FixedRate>[].obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController work_name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController selectcontractor = TextEditingController();
  TextEditingController rate_per_unit = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController unitname = TextEditingController();
  TextEditingController totalqty = TextEditingController();
  TextEditingController openbalance = TextEditingController();
  TextEditingController Est_Amount = TextEditingController();
  RxString contractor = "".obs;
  RxString op_balance = "".obs;
  RxString contract_type = "".obs;
  RxString workid_type = "".obs;
  RxString unite = "".obs;
  RxString workidname = "".obs;
  RxDouble estimatedaount = 0.0.obs;
  RxDouble totalpayable = 0.0.obs;
  RxBool ispostsubcontractloading = false.obs;
  postsubcontract_create(work_id) async {
    ispostsubcontractloading.value = true;
    ispostsubcontractloading.refresh();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}subcontracts/create'));
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'work_id': work_id,
      'work_name': work_name.text,
      'contractor': contractor.value,
      'contract_type': contract_type.value,
      'description': description.text,
      'op_balance': openbalance.text,
      'items': jsonEncode(fixedrate),
      'remarks': remarks.text
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      controller.getList();
      Get.to(() => const SubmitDone());
      clears();
      ispostsubcontractloading.value = false;
      ispostsubcontractloading.refresh();
      update();
      // print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      ispostsubcontractloading.value = false;
      ispostsubcontractloading.refresh();
      update();
    }
  }

  clears() {
    fixedrate.clear();
    work_name.clear();
    quantity.clear();
    remarks.clear();
    description.clear();
    selectcontractor.clear();
    rate_per_unit.clear();
    unit.clear();
    totalqty.clear();
    openbalance.clear();
    Est_Amount.clear();
    contractor.value = "";
    op_balance.value = "";
    contract_type.value = "";
    workid_type.value = "";
    unite.value = "";
    workidname.value;
    estimatedaount.value = 0.0;
    totalpayable.value = 0.0;
  }

  totalvalue() {
    estimatedaount.value = 0;
    for (var i = 0; i < fixedrate.length; i++) {
      estimatedaount.value += double.parse(fixedrate[i].est_amount.toString());
    }
    totalpayables(); // Update total payable after calculating the total value
    return estimatedaount.value;
  }

  totalpayables() {
    try {
      double openBalanceValue = double.tryParse(openbalance.text) ?? 0.0;
      totalpayable.value = openBalanceValue + estimatedaount.value;
    } catch (e) {
      print("Error calculating total payable: $e");
      totalpayable.value = 0.0; // Default to 0 in case of error
    }
  }
}
