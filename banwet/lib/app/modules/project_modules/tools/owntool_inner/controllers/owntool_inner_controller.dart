import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/modules/project_modules/tools/own_tools/controllers/own_tools_controller.dart';
import 'package:banwet/app/modules/project_modules/tools/toolTransfer/controllers/renttool_controller.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/ToolsModel/tool_detail_model2.dart';
import '../../../../../data/service/tools/owntools_service.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class OwntoolInnerController extends GetxController
    with GetTickerProviderStateMixin {
  // RxString toolid = "".obs;
  OwnToolsController controllerss = Get.find<OwnToolsController>();
  RxBool iserror = false.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var storage = GetStorage();
  late TabController tabBarcontoller;
  var count = 0.obs;
  TextEditingController transferdate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController toolName = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController selectaddform = TextEditingController();
  TextEditingController to = TextEditingController();
  TextEditingController transferQunatity = TextEditingController();
  TextEditingController priceperday = TextEditingController();
  TextEditingController transferDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController remarks = TextEditingController();
  TextEditingController returnedqut = TextEditingController();
  final RxString officecount = '0'.obs;
  final RxString worksitecount = '0'.obs;
  final RxString otherworksitecount = '0'.obs;
  final RxString rentalscount = '0'.obs;

  updatevaluecount(
    office,
    worksite,
    otherworksite,
    rental,
  ) {
    officecount.value = office.toString();
    worksitecount.value = worksite.toString();
    otherworksitecount.value = otherworksite.toString();
    rentalscount.value = rental.toString();
    // toolid.value= ;
    update();
  }

  var argumnetData = Get.arguments;
  RxInt availableqty = 0.obs;
  RxInt index = 0.obs;
  RxString addfile = 'TransferIn'.obs;
  List<dynamic> name = [
    'TransferIn',
    'TransferOut',
    'Rented in',
  ];
  RxString addfileerrorfinder = ''.obs;
  RxString toolid = ''.obs;
  final List<String> tabNames = [
    'Transfer In',
    'Transfer Out',
    'Rented In',
    'Rental Returns'
  ];
  final RxDouble balancereturn = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    tabBarcontoller = TabController(
        length: 4, vsync: this); // Using vsync with GetTickerProviderStateMixin
    toolName.text = argumnetData["toolname"] ?? "";
    // argumnetData["toolname"]
    updatevaluecount(argumnetData["Office"], argumnetData["Worksite"],
        argumnetData["Other Worksite"], argumnetData["Rentals"]);
    getDtetails(argumnetData["workid"], argumnetData["toolid"]);
  }

  indexchange() {
    tabBarcontoller.addListener(() {
      if (!tabBarcontoller.indexIsChanging) {
        // Get the current index and tab name
        index.value = tabBarcontoller.index;
        update();
        index.refresh();
        String tabName = tabNames[index.value];

        // You can now use this tabName or index as needed
        print('Current Tab: $tabName, Index: ${index.value}');
      }
    });
  }
  // stockfilter.value.forEach(
  //     (cases) {
  //       if (cases.availableQty
  //           .toString()
  //           .toLowerCase()
  //           .contains(searchText.toLowerCase())) {
  //         if (!stockData.contains(cases)) {
  //           stockData.add(cases);
  //           stockData.refresh();
  //           update();
  //         }
  //       }
  //     },

  findToolDetails() {
    for (var element in controllerss.toolsHomeModel!.data!) {
      if (element.toolId
          .toString()
          .toLowerCase()
          .contains(argumnetData["toolid"].toString().toLowerCase())) {
        updatevaluecount(element.totalatoffice ?? 0, element.totalatsite ?? 0,
            element.total_at_other_sites ?? 0, element.totalrentedatsite ?? 0);
        update();
      }
      update();
    }
  }

  clearss() {
    toolName.clear();
    from.clear();
    to.clear();
    transferQunatity.clear();
    // transferDate.clear();
    remarks.clear();
    priceperday.clear();
  }

  returntransferquantity(total, returenvalu) {
    balancereturn.value =
        double.parse(total.toString()) - double.parse(returenvalu.toString());
    update();
    return balancereturn.value;
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

  ToolDetailsModel2? toolDetailsModel2;

  getDtetails(workid, toolid) async {
    // updatevaluecount(argumnetData["Office"], argumnetData["Worksite"],
    //     argumnetData["Other Worksite"], argumnetData["Rentals"]);
    var result = await OwnToolsService().getOwntollTransfers(
        workid ?? argumnetData["workid"],
        toolid ?? argumnetData["toolid"] ?? "");
    toolDetailsModel2 = result;
    // updatevaluecount(argumnetData["Office"], argumnetData["Worksite"],
    //     argumnetData["Other Worksite"], argumnetData["Rentals"]);
    update();
  }

  RxBool addtoolloading = false.obs;
  addOwntoolTransfer(
    String toolid,
  ) async {
    addtoolloading.value = true;
    var result = await OwnToolsService().addOwntoolsTransfer(
        workid: argumnetData["workid"],
        quantity: transferQunatity.text,
        from: from.text,
        type: addfile.value == 'TransferIn'
            ? "in"
            : addfile.value == 'TransferOut'
                ? 'out'
                : "in",
        toolid: toolid,
        to: to.text,
        transferDate: transferDate.text,
        remarks: remarks.text);

    if (result.status) {
      addtoolloading.value = false;
      clearss();
      getDtetails(argumnetData["workid"], argumnetData["toolid"]);

      Get.to(() => const SubmitDone());
      await controllerss.getDetails();
      findToolDetails();
      update();
    }
    addtoolloading.value = false;
  }

  addOwntoolrentedin(
    String toolid,
  ) async {
    addtoolloading.value = true;
    var result = await OwnToolsService().addOwntoolsRentedIn(
      from: from.text,
      price: priceperday.text,
      quantity: transferQunatity.text,
      remarks: remarks.text,
      toolid: toolid,
      transferDate: transferDate.text,
      workid: argumnetData["workid"],
    );

    if (result.status) {
      addtoolloading.value = false;
      clearss();
      getDtetails(argumnetData["workid"], argumnetData["toolid"]);
      controllerss.getDetails();
      Get.to(() => const SubmitDone());
    }
    addtoolloading.value = false;
  }

  addtooltransfer(
    String toolid,
  ) async {
    addtoolloading.value = true;
    var result = await OwnToolsService().addOwntoolsRentedIn(
      from: from.text,
      price: priceperday.text,
      quantity: transferQunatity.text,
      remarks: remarks.text,
      toolid: toolid,
      transferDate: transferDate.text,
      workid: argumnetData["workid"],
    );

    if (result.status) {
      addtoolloading.value = false;
      clearss();

      RenttoolController().workid = argumnetData["workid"];
      RenttoolController().toolstransfer();
      getDtetails(argumnetData["workid"], argumnetData["toolid"]);
      Get.to(() => const SubmitDone());
    }
    addtoolloading.value = false;
  }

  // RxBool l;
  owntoolrentalreturns(rentid, quantity, date) async {
    print("hhhhhhhhhhhooooooo${argumnetData["workid"]}");
    DateTime parsedDate =
        DateTime.parse(date.toString().replaceAll("00:00:00.000", ""));

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd-MM-yyyy')
        .format(parsedDate); // // DateTime date = new DateTime(
    //     DateTime.now().year, DateTime.now().month, DateTime.now().day);
    print(formattedDate.toString());
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=5db190590a61b4124a71e8f1e02c80b38639d57e'
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}tools/rent_return_create'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'rent_id': rentid,
      'work_id': argumnetData["workid"],
      'quantity': quantity,
      'date': formattedDate,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      await getDtetails(argumnetData["workid"], argumnetData["toolid"]);
      await controllerss.getDetails();
      Get.to(() => const SubmitDone());
      update();
    } else {
      print(response.reasonPhrase);
    }
  }
}
