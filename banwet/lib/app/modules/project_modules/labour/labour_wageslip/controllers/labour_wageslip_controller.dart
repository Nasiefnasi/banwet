import 'dart:convert';
import 'dart:developer';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/data/api/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/data/model/WageModel/groupwageslip.dart';

import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/WageModel/quick_wage.dart';
import '../../../../../data/model/WageModel/wage_labour_model.dart';
import '../../../../../data/model/WageModel/wage_slip_model.dart';
import '../../../../../data/service/labour_service/labourlist_service.dart';
import '../../../../../data/service/wageslip/wageslip_service.dart';

class LabourWageslipController extends GetxController {
  TextEditingController groupwageadays = TextEditingController();
  TextEditingController groupwagenolabour = TextEditingController();
  TextEditingController groupwagebaseicwagge = TextEditingController();
  TextEditingController groupwageovertime = TextEditingController();
  TextEditingController groupwageextrawage = TextEditingController();
  TextEditingController groupwageTA = TextEditingController();
  Rx<DateTime> newregistercasedate = DateTime.now().obs;
  var argumentData = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isgroupwageerror = false.obs;
  RxBool isLoadingInduvitalAdding = false.obs;
  RxDouble preBalanceAmount = 0.0.obs;
  RxString groupwagelabour = "".obs;
  var totalAmounts = 0.0.obs;
  String labourId = '';
  RxBool day = false.obs;
  RxInt fullamount = 0.obs;
  var edit1 = false.obs;
  RxBool status = false.obs;
  Rx<Labour?> selectedLabour = Rx<Labour?>(null);
  String labourid = "";
  RxString GroupWageList = "".obs;
  TextEditingController groupwageremarks = TextEditingController();
  var dateFormat = DateFormat('dd-MM-yyyy');
  TextEditingController remarkController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();
  final GlobalKey<FormState> key2 = GlobalKey<FormState>();

  TextEditingController quickWageDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController titleController = TextEditingController();

  TextEditingController selectLabour = TextEditingController();
  TextEditingController overtimeWage = TextEditingController(text: "0");
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  var wagelist = <SlipData>[].obs;
  List<Labourss> quickWage = <Labourss>[].obs;
  var wageSlipModels = <WageSlipModel>[].obs;
  // Group wage List
  List<GrouLabourss> groupquickWage = <GrouLabourss>[].obs;

  WageSlipModel? wageSlipModel;
  getLabourWageList() async {
    var result = await WageSlipService().getWageSlip(argumentData["workid"]);
    wageSlipModel = result;
    // filterData();
    update();

    if (result.data != null) {
      filterAndCalculateTotalWage(result.data!.toList());
      update();
    } else {
      log("lllllllllllllllllllllllll");
    }
    update();
  }

  groupupdatevalue(value) async {
    groupwagelabour = await value;
  }

  final basicwagedays = 0.0.obs;
  dayscalculations(Value) {
    // Fetch the wage amount and days as doubles
    var datas = Value.wageamount.value == 0.0
        ? double.parse(Value.dailyWage.toString()).obs
        : double.parse(Value.wageamount.value).obs;
    var days = double.parse(Value.isdays.value ? "1.0" : "0.5").obs;

    // Perform the calculation and update the observable
    basicwagedays.value = (datas.value * days.value);

    // Print the updated value
    print(basicwagedays);
  }

  RxBool groupwagelaoding = false.obs;
  Future<void> groupwagesubmit(
    work_date,
    remarks,
    team_leader_id,
  ) async {
    groupwagelaoding.value = true;
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request('POST',
        Uri.parse('${storage.read("domain")}labours/create_labour_wage_group'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'work_id': argumentData["workid"].toString(),
      'work_date': work_date,
      'remarks': remarks,
      'labours': jsonEncode(groupquickWage),
      'team_leader_id': team_leader_id,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    // var responseBody = await response.stream.bytesToString();
    // var jsonResponse = json.decode(responseBody);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response);
        groupquickWage.clear();
        getLabourWageList();
        await getLabourlist();
        update();
        Get.back();
        Get.to(() => const SubmitDone(
            // time: 3500,
            // message: jsonResponse['message'],
            ));
        groupwagelaoding.value = false;
        update();
        // print(await response.stream.bytesToString());
      } else {
        // print(response.reasonPhrase);
        groupwagelaoding.value = false;
        update();
      }
    } catch (e) {
      print("group submit error $e");
      groupwagelaoding.value = false;
      update();
    }
  }

  Future<void> wageslipdelet(String wageid) async {
    var url = Uri.parse('${storage.read("domain")}/labours/delete_labour_wage');
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var body = {
      'user_id': storage.read('uid').toString(),
      'wage_id': wageid.toString()
    };

    try {
      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        getLabourWageList();
        print("Successfully deleted wage slip.");
      } else {
        print("Failed to delete wage slip: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  RxBool addlaboursLoading = false.obs;
  GroupWageLabour? groupWageLabours;
  GroupWageLabourfilterlist? groupWageLabourfilterlist;
  Future<void> addLabourList(team_leader, labour_group) async {
    addlaboursLoading.value = true;
    update();
    groupWageLabourfilterlist = null;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}/data/select_labours?user_id=${storage.read('uid').toString()}&list_type=${team_leader}&labour_group=${labour_group}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      update();

      if (team_leader == "") {
        groupWageLabourfilterlist =
            groupWageLabourfilterlistFromJson(responseBody);
        groupWagetotalpresent(groupquickWage.toList(), "");
        addlaboursLoading.value = false;
        update();
      } else {
        groupWageLabours = groupWageLabourFromJson(responseBody);
        print(groupWageLabours!.labours.length);
        addlaboursLoading.value = false;
        update();
      }

      // print(await response.stream.bytesToString());
      addlaboursLoading.value = false;
      update();
    } else {
      print(response.reasonPhrase);
      addlaboursLoading.value = false;
      update();
    }
  }

  Future<void> newcasedate(BuildContext context) async {
    var storage = GetStorage();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: newregistercasedate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030, 12, 31), // Allow selection up to Dec 31, 2030
      selectableDayPredicate: (DateTime date) {
        // Only enable dates up to today
        return date.isBefore(DateTime.now()) ||
            date.isAtSameMomentAs(DateTime.now());
      },
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  Color.fromARGB(251, 4, 148, 188), // Header background color
              onPrimary: Colors.white, // Header text color
              surface: Colors.white, // Background color
              onSurface: Colors.black, // Text color
            ),
            dialogBackgroundColor: Colors.white, // Background color
          ),
          child: Builder(
            builder: (BuildContext context) {
              return child!;
            },
          ),
        );
      },
    );

    if (picked != null && picked != newregistercasedate.value) {
      newregistercasedate.value = picked;
    }
  }

  WageListModel? wageListModel;
  getLabourlist() async {
    var result = await LabourListService().getLoburs(argumentData["workid"]);
    wageListModel = result;
    filteredData.value = wageListModel!.labours!.toList();
    filterData();
    //  filterData();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    getLabourWageList();
    getLabourlist();
    addLabourList("team_leader", "");
  }

  var filteredgroupwageList = [].obs;
  var groupwagetotalAmount = 0.0.obs;
  var grouptotalpayamount = 0.0.obs;
  // groupWagetotalpresent(
  //   List<GrouLabourss> groupwagemodel,
  // ) {
  //   filteredgroupwageList.value.clear();
  //   groupwagetotalAmount.value = 0;

  //   for (int i = 0; i < groupwagemodel.length; i++) {

  //     if (groupwagemodel[i].isSelected == false) {
  //       filteredgroupwageList.remove(groupwagemodel[i]);
  //       groupwagetotalAmount.value -=
  //           int.parse(groupwagemodel[i].basicWage.toString());
  //     } else if (groupwagemodel[i].isSelected == true) {
  //       filteredgroupwageList.add(groupwagemodel[i]);
  //       groupwagetotalAmount.value +=
  //           int.parse(groupwagemodel[i].basicWage.toString());
  //     }
  //     //

  //     print("total day wage  ${groupwagetotalAmount}");
  //     print("total day wage  ${groupwagetotalAmount}");
  //   }
  // }
  groupWagetotalpresent(List<GrouLabourss> groupwagemodel, previousbalance) {
    filteredgroupwageList.value.clear();
    groupwagetotalAmount.value = 0;
    grouptotalpayamount.value = 0;

    for (int i = 0; i < groupwagemodel.length; i++) {
      if (groupwagemodel[i].isSelected == true) {
        filteredgroupwageList.add(groupwagemodel[i]);
        groupwagetotalAmount.value +=
            double.parse(groupwagemodel[i].basicWage.toString());

        grouptotalpayamount.value =
            (double.parse(groupwagetotalAmount.value.toString()) +
                double.parse(previousbalance.toString()));
        update();
      } else {
        // Ensure the item is removed from the list and update the total amount
        filteredgroupwageList.removeWhere((item) => item == groupwagemodel[i]);
        groupwagetotalAmount.value -=
            int.parse(groupwagemodel[i].basicWage.toString());
        grouptotalpayamount.value =
            (double.parse(groupwagetotalAmount.value.toString()) -
                double.parse(previousbalance.toString()));
      }
    }

    // Print statements for debugging
    print("total day wage  ${groupwagetotalAmount.value}");
  }

  // grouptotalpay() {
  //    groupwagetotalAmount.value +
  // }

  var totalAmount = 0.0.obs;

  // addQuickWageSlip() async {
  //   var headers = {
  //     'x-api-key': '159753',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //     // 'Cookie': 'ci_session=8f9f203a6d1a926b54086b6a126f6a8e53a50f00'
  //   };
  //   var request = http.Request(
  //       'POST',
  //       Uri.parse(
  //           '${storage.read("domain")}/labours/create_labour_wage_quick'));
  //   request.bodyFields = {
  //     'user_id': storage.read('uid').toString(),
  //     'work_id': argumentData["workid"].toString(),
  //     'work_date': quickWageDateController.text,
  //     'labours': jsonEncode(quickWage)
  //     //     '[{"labour_id":"1","basic_wage":"210","overtime_duration":"2","overtime_rate":"50","overtime_wage":"100"},{"labour_id":"1","basic_wage":"210","overtime_duration":"2","overtime_rate":"50","overtime_wage":"100"}]',
  //     // 'remarks': 'sdc ds.l'
  //   };
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     print("addQuickWageSlip work ayi monee");
  //     getLabourWageList();
  //     getLabourlist();
  //     quickWage.clear();

  //     isLoading.value = false;
  //     status.value = false;

  //     Get.to(() => const SubmitDone());
  //     // print(await response.stream.bytesToString());
  //   } else {
  //     print(response.statusCode);
  //     print(response.reasonPhrase);
  //   }
  Future<void> addQuickWageSlip() async {
    isLoading.value = true;
    isLoading.refresh();
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
        'POST',
        Uri.parse(
            '${storage.read("domain")}/labours/create_labour_wage_quick'));

    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'work_id': argumentData["workid"].toString(),
      'work_date': quickWageDateController.text,
      'labours': jsonEncode(quickWage),
    };
    request.headers.addAll(headers);

    try {
      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        var jsonresponsbody = json.decode(responseBody);

        print("Response Body: $responseBody");

        // Execute sequentially
        await getLabourWageList();
        await getLabourlist();

        quickWage.clear();
        isLoading.value = false;
        isLoading.refresh();
        update();

        status.value = false;
        Get.to(() => SubmitDone(
              time: 3500,
              message: jsonresponsbody['message'],
            ));
      } else {
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
        isLoading.value = false;
        isLoading.refresh();
        update();
      }
    } catch (e) {
      print("Exception occurred: $e");
      isLoading.value = false;
      isLoading.refresh();
      update();
    }
  }

  //   // print(
  //   //     "${storage.read('uid').toString()}  ,${quickWageDateController.text}");
  //   // var result = await WageSlipService().addWageSlip(
  //   //     argumentData["workid"].toString(),
  //   //     quickWageDateController.text,
  //   //     remarkController.text,
  //   //     quickWage);

  //   // if (result.status) {
  //   //   if (result.status) {
  //   //     getLabourWageList();
  //   //     getLabourlist();
  //   //     quickWage.clear();

  //   //     isLoading.value = false;
  //   //     status.value = false;
  //   //     Get.to(() => const SubmitDone());
  //   //   } else {
  //   //     isLoading.value = false;
  //   //     status.value = false;
  //   //   }
  //   // }
  // }

  //< ----------------   add indivitual wage related function ansd variables ----->
  TextEditingController groupWagedate = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController workDate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController nolabourworked = TextEditingController(text: "1");
  TextEditingController noDays = TextEditingController(text: "1");
  TextEditingController overtimeDuration = TextEditingController(text: "0");
  TextEditingController overtimeRateController =
      TextEditingController(text: "0");
  TextEditingController extraWage = TextEditingController(text: "0");
  TextEditingController ta = TextEditingController(text: "0");
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController paymentMode = TextEditingController();
  TextEditingController paidDate = TextEditingController();
  TextEditingController wageSlipRemarks = TextEditingController();
  TextEditingController referenceNo = TextEditingController();
  TextEditingController referenceDate = TextEditingController();
  TextEditingController remarks = TextEditingController();
  clears() {}
  var basicWage = 0.0.obs;
  var overtimeWages = 0.0.obs;
  var overtimeRatevalue = 0.0.obs;
  var overtimeDurationValue = 0.0.obs;
  var numberofDays = 0.0.obs;
  var numberofLabours = 0.0.obs;
  calculateAmountoflabousanddays() {
    tottalAmountoflabousanddays.value =
        numberofLabours.value * numberofDays.value;
    update();
    calculateTotalWage();
    print(overtimeWages.value.toString());
  }

  calculateOvetimeWage() {
    overtimeWages.value = overtimeDurationValue.value * overtimeRatevalue.value;
    update();
    calculateTotalWage();
    print(overtimeWages.value.toString());
  }

  var totalWage = 0.0.obs;
  var balanceAmount = 0.0.obs;
  var tottalAmountoflabousanddays = 1.0.obs;
  calculateTotalWage() {
    totalWage.value = basicWage.value * tottalAmountoflabousanddays.value +
        overtimeWages.value +
        double.parse(extraWage.text) +
        double.parse(ta.text);
  }

  // addIndivitualWage() async {
  //   var result = await WageSlipService().addIndivitualWageSlip(

  //     debitAccount: "",
  //       workid: argumentData["workid"],
  //       workdate: workDate.text,
  //       basicWage: basicWage.value.toString(),
  //       overTime: overtimeDuration.text,
  //       overRate: overtimeRatevalue.value.toString(),
  //       overTimeWage: overtimeWages.value.toString(),
  //       extraWage: extraWage.text,
  //       noLabours: nolabourworked.text,
  //       remarks: remarks.text,
  //       totalWage: "5678",
  //       paidAmt: paidAmountController.text,
  //       paidMode: paymentMode.text,
  //       paidDate: paidDate.text,
  //       labourId: labourId);

  //   if (result.status) {
  //     getLabourWageList();
  //     quickWage.clear();
  //     isLoadingInduvitalAdding.value = false;
  //     Get.to(() => const SubmitDone());
  //   } else {
  //     isLoadingInduvitalAdding.value = false;
  //   }
  // }

  var filteredData = <Labours>[].obs; // the filtered list of data
  var searchText = "".obs;

  filterData() {
    filteredData.clear();
    if (searchText.value.isEmpty) {
      filteredData.value = wageListModel!.labours!.toList();
      update();
    } else {
      filteredData.value = wageListModel!.labours!
          .where((data) =>
              data.labourName!.toString().toLowerCase().contains(searchText))
          .toList(); // filter the data based on search text
      update();
    }
  }

  var filteredList = [].obs;
  // var totalWage = 0.0.obs;

  void filterAndCalculateTotalWage(
    List<SlipData> dataList,
  ) {
    log("[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]");
    filteredList.clear();
    totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < dataList.length; index++) {
      if (dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredList.add(dataList[index]);

        totalAmount.value += dataList[index].totalWage;
        filteredList.refresh();
        update();
        log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
  }

  void filteractiTotalWage(
    List<SlipData> dataList,
  ) {
    log("[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]");
    filteredList.clear();
    totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < dataList.length; index++) {
      if (dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(dataList[index].createdDate!)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredList.add(dataList[index]);
        totalAmount.value += dataList[index].totalWage;
        log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
  }
}
