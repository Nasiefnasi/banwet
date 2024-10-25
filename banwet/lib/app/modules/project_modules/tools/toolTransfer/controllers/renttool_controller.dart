import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../../common_widegt/submitpage.dart';
import '../../../../../data/model/ToolsModel/tools_home_model.dart';
import '../../../../../data/service/tools/renttools_service.dart';
import 'package:intl/intl.dart';

class RenttoolController extends GetxController
    with GetSingleTickerProviderStateMixin {
  String workid = '';
  final List<String> tabNames = [
    'Transfer In',
    'Transfer Out',
    'Rented In',
    'Rental Returns'
  ];
  RxInt index = 0.obs;
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

  TextEditingController transferdate =
      TextEditingController(text: DateTime.now().toString());
  var storage = GetStorage();
  var count = 0.obs;
  var argumentData = Get.arguments;
  final RxDouble balancereturn = 0.0.obs;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  RxBool iserror = false.obs;
  var filteredData = <ToolsData>[].obs; // the filtered list of data
  String categoryid = "";
  var argumnetData = Get.arguments;
  var searchText = "".obs;

  ToolsHomeModel? toolsHomeModel;
  late TabController tabBarcontoller;
  // <---------- this function using to fetch to owntools ---->
  getDetails() async {
    var result =
        await RentToolsService().getrenttoolDetails(argumnetData["workid"]);
    toolsHomeModel = result;
    filteredData.value = toolsHomeModel!.data!.toList();
    update();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  // SubContractTypesModel? subContractTypesModel;
  // // <---------- this function using to fetch to SubContractTypesModel ---->
  // // <------- this using add owntools screen ----->
  // getSubContractTypesModel() async {
  //   var result = await OwnToolsService().getSubContractTypesModel();
  //   subContractTypesModel = result;
  //   update();
  // }

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

  addRenttools() async {
    var result = await RentToolsService().addRenttools(
        workid: argumnetData["workid"],
        quantity: quantity.text,
        rentid: "",
        date: "date");

    if (result.status) {
      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    }
  }

  TextEditingController returnedquantity = TextEditingController();
  TextEditingController toolName = TextEditingController();
  TextEditingController toolCategory = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController priceperDay = TextEditingController();
  clear() {
    toolCategory.clear();
    quantity.clear();
    priceperDay.clear();
  }

  @override
  void onInit() {
    super.onInit();
    tabBarcontoller = TabController(length: 4, vsync: this);
    toolName.text = argumnetData["toolname"] ?? "";
    getDetails();
    indexchange();
    toolstransfer();
    // getSubContractTypesModel();
  }

  TooltransferiteamModel? tooltransferiteamModel;
  toolstransfer() async {
    // var workids = workid == '' ? argumnetData["workid"] : workid;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}tools/select_transfer_report?user_id=${storage.read('uid').toString()}&work_id=${argumnetData["workid"]}'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      tooltransferiteamModel = tooltransferiteamModelFromJson(responsebody);
      tertransfer();
      update();
    } else {
      print(response.reasonPhrase);
    }
  }

  returntransferquantity(total, returenvalu) {
    balancereturn.value =
        double.parse(total.toString()) - double.parse(returenvalu.toString());
    update();
    return balancereturn.value;
  }

  var transferin = <Datatype>[].obs;
  var transferout = <Datatype>[].obs;
  var rentedin = <Datatype>[].obs;
  var rentedreturns = <Datatype>[].obs;
  tertransfer() {
    transferin.clear();
    transferout.clear();
    rentedin.clear();
    rentedreturns.clear();
    for (var i = 0; i < tooltransferiteamModel!.data.length; i++) {
      if (tooltransferiteamModel!.data[i].type == "Transfer In") {
        transferin.add(tooltransferiteamModel!.data[i]);
      } else if (tooltransferiteamModel!.data[i].type == "Transfer out") {
        transferout.add(tooltransferiteamModel!.data[i]);
      } else if (tooltransferiteamModel!.data[i].type == "Rental") {
        rentedin.add(tooltransferiteamModel!.data[i]);
      } else if (tooltransferiteamModel!.data[i].type == "Rental Return") {
        rentedreturns.add(tooltransferiteamModel!.data[i]);
      }
    }
    update();
  }

  tooltransferrented(rentid, quantity, date) async {
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

    if (response.statusCode == 200) {
      Get.to(() => const SubmitDone());
    } else {
      print(response.reasonPhrase);
    }
  }
}

// To parse this JSON data, do
//
//     final tooltransferiteamModel = tooltransferiteamModelFromJson(jsonString);

// import 'dart:convert';

TooltransferiteamModel tooltransferiteamModelFromJson(String str) =>
    TooltransferiteamModel.fromJson(json.decode(str));

String tooltransferiteamModelToJson(TooltransferiteamModel data) =>
    json.encode(data.toJson());

class TooltransferiteamModel {
  final bool status;
  final List<Datatype> data;

  TooltransferiteamModel({
    required this.status,
    required this.data,
  });

  factory TooltransferiteamModel.fromJson(Map<String, dynamic> json) =>
      TooltransferiteamModel(
        status: json["status"],
        data:
            List<Datatype>.from(json["data"].map((x) => Datatype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datatype {
  final String type;
  final String id;
  final String date;
  final String fromLocation;
  final String toLocation;
  final String toolName;
  final String category;
  final String quantity;
  final String remarks;

  Datatype({
    required this.type,
    required this.id,
    required this.category,
    required this.date,
    required this.fromLocation,
    required this.toLocation,
    required this.toolName,
    required this.quantity,
    required this.remarks,
  });

  factory Datatype.fromJson(Map<String, dynamic> json) => Datatype(
        id: json["id"],
        category: json["category"],
        type: json["type"],
        date: json["date"],
        fromLocation: json["from_location"],
        toLocation: json["to_location"],
        toolName: json["tool_name"],
        quantity: json["quantity"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "type": type,
        "date": date,
        "from_location": fromLocation,
        "to_location": toLocation,
        "tool_name": toolName,
        "quantity": quantity,
        "remarks": remarks,
      };
}
