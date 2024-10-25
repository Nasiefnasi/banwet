import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/ToolsModel/tools_home_model.dart';
import '../../../../../data/model/subcontract_model/sub_ctract_types_model.dart';
import '../../../../../data/service/tools/owntools_service.dart';

class OwnToolsController extends GetxController {
  final RxDouble balancereturn = 0.0.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  RxList addtooltransfer = <ToolsData>[].obs;
  var filteredData = <ToolsData>[].obs; // the filtered list of data
  String categoryid = "";
  var argumnetData = Get.arguments;
  var searchText = "".obs;

  ToolsHomeModel? toolsHomeModel;
  // <---------- this function using to fetch to owntools ---->
  getDetails() async {
    var result =
        await OwnToolsService().getowntoolDetails(argumnetData["workid"]);
    toolsHomeModel = result;
    filteredData.value = toolsHomeModel!.data!.toList();
    filterData();
    update();
  }

  SubContractTypesModel? subContractTypesModel;
  // <---------- this function using to fetch to SubContractTypesModel ---->
  // <------- this using add owntools screen ----->
  getSubContractTypesModel() async {
    var result = await OwnToolsService().getSubContractTypesModel();
    subContractTypesModel = result;
    update();
  }

  filterData() {
    filteredData.clear();
    if (searchText.value.isEmpty) {
      filteredData.value = toolsHomeModel!.data!.toList();
      update();
    } else {
      filteredData.value = toolsHomeModel!.data!
          .where((data) =>
              data.name!.toString().toLowerCase().contains(searchText))
          .toList(); // filter the data based on search text
      update();
    }
  }

  addOwntool() async {
    var result = await OwnToolsService().addOwntools(
        description: description.text,
        toolName: toolName.text,
        categoryid: categoryid,
        quantity: quantity.text,
        price: priceperDay.text);
    if (result.status) {
      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    }
  }

  TextEditingController toolCategory = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController priceperDay = TextEditingController();
  TextEditingController toolName = TextEditingController();
  TextEditingController description = TextEditingController();
  clear() {
    toolCategory.clear();
    quantity.clear();
    priceperDay.clear();
    toolName.clear();
    description.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getSubContractTypesModel();
  }
}
