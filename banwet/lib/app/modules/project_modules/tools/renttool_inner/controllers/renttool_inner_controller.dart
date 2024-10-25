import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/ToolsModel/tool_detail_model.dart';
import '../../../../../data/service/tools/owntools_service.dart';
import '../../../../../data/service/tools/renttools_service.dart';

class RenttoolInnerController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var isLoading = false.obs;
  late TabController tabBarcontoller;
  var count = 0.obs;
  TextEditingController toolName = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController transferQunatity = TextEditingController();
  TextEditingController transferDate = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController priceperday = TextEditingController();
  var argumnetData = Get.arguments;
  List name = [
    ['TransferIn'],
    ['TransferOut']
  ];

  @override
  void onInit() {
    super.onInit();
    toolName.text = argumnetData["toolname"];
    getDtetails();
  }

  clear() {
    toolName.clear();
    from.clear();
    to.clear();
    transferQunatity.clear();
    transferDate.clear();
    remarks.clear();
    priceperday.clear();
  }

  RxBool isOption1Selected = true.obs;
  String type = "in";
  void selectOption1() {
    isOption1Selected.value = true;
    type = "in";
  }

  void selectOption2() {
    isOption1Selected.value = false;
    type = "out";
  }

  ToolDetailsModel? toolDetailsModel;
  getDtetails() async {
    var result = await OwnToolsService()
        .getRenttoolTransfers(argumnetData["workid"], argumnetData["toolid"]);
    toolDetailsModel = result;
    update();
  }

  addRenttools(
    String toolid,
  ) async {
    var result = await RentToolsService().addRenttoolsTransfer(
        workid: argumnetData["workid"],
        quantity: transferQunatity.text,
        from: from.text,
        type: type,
        toolid: toolid,
        transferDate: transferDate.text,
        remarks: remarks.text);
    if (result.status) {
      clear();
      getDtetails();
      Get.to(() => const SubmitDone());
    }
  }
}
