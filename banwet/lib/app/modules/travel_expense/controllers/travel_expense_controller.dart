import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/utils/image.compress.dart';

import '../../../common_widegt/submitpage.dart';
import '../../../data/model/travelexpense/travel_head_model.dart';
import '../../../data/model/travelexpense/travel_model.dart';
import '../../../data/service/travelexpense/travel_expense.dart';

class TravelExpenseController extends GetxController {
  var isLoading = false.obs;
  var isfiexd = 0.obs;
  var iseditable = "".obs;
  var isShow = false.obs;
  var travelExpenseList = <TravelData>[].obs;
  List<String> dateList = [];
  List<TravelData> itemlist = [];
  RxString backendimages = "".obs;
  // RxString? backendimage = "".obs;
  @override
  void onInit() {
    super.onInit();
    getDetails();
    getTravelHeadDetails();
  }

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController vehicleTypeCtrle = TextEditingController();
  TextEditingController fromCtrl = TextEditingController();
  TextEditingController toCtrl = TextEditingController();
  TextEditingController distanseCtrl = TextEditingController(text: "1");
  TextEditingController amtCtrl = TextEditingController();
  TextEditingController remarks = TextEditingController();
  // var endDate = DateTime.parse(DateTime.now().toString());
  // var startDate = DateTime.parse(DateTime.now().toString());

  TavelExpenseModel? travelExpenseModel;

  //  <----------- fetching daily note from api ------------>

  getDetails() async {
    isShow.value = true;
    update();
    var result = await TravelExpenseService().getTravelExpensiveList();
    travelExpenseModel = result;
    await filteringData();
    dateList = travelExpenseModel!.data!.map((e) => e.createdDate!).toList();
    itemlist = travelExpenseModel!.data!.toList();
    // filteringData();

    isShow.value = false;
    update();
    // } else {
    //   isShow.value = false;
    // }
  }

  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  TaHeadModel? travelHeadModel;

  getTravelHeadDetails() async {
    var result = await TravelExpenseService().getTravelHead();
    travelHeadModel = result;
    update();
  }

  var dateFormat = DateFormat('dd-MM-yyyy');

  // this function is update the enddate and start date
  // change() {
  //   travelExpenseList.clear();
  //   endDate = DateTime.parse(endDateController.text);
  //   startDate = DateTime.parse(startDateController.text);
  //   update();
  // }

  // <---------- this function using to filtering items from two dates  ---->

  // filteringDates() {
  //   for (var i = 0; i < dateList.length; i++) {
  //     var date = dateFormat.parse(dateList[i], true);
  //     if (date.compareTo(startDate) >= 0 && date.compareTo(endDate) <= 0) {
  //       travelExpenseList.add(itemlist[i]);
  //       update();
  //     } else {
  //       log(dateList[i]);
  //     }
  //   }
  // }

  filteringtravel() {
    for (var i = 0; i < travelExpenseModel!.data!.length; i++) {
      if (dateFormat
                  .parse(
                      travelExpenseModel!.data![i].createdDate!.split(" ")[0])
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(
                      travelExpenseModel!.data![i].createdDate!.split(" ")[0])
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {}
    }
  }
  //< ---------------  add travel expense dunction ---------->

  void addTravelAlevences() async {
    isLoading.value = true;

    var result = await TravelExpenseService().addTravelAlavence(
        endimage: byte2,
        taVehicle: vehicleTypeCtrle.text.toString(),
        taFrom: fromCtrl.text.toString(),
        taTo: toCtrl.text.toString(),
        taKm: distanseCtrl.text.toString(),
        taAmount: amtCtrl.text.toString(),
        byte: byte,
        remarks: remarks.text.toString());
    if (result.status) {
      isLoading.value = false;

      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  clear() {
    remarks.clear();
    fileValue.value = 0;
    fileValue2.value = 0;
    pic = null;
    pic2 = null;
    vehicleTypeCtrle.clear();
    fromCtrl.clear();
    isfiexd.value == 0;
    toCtrl.clear();
    distanseCtrl.clear();
    amtCtrl.clear();
    totalamount.value = 0;
    distance = 0;
    remarks.clear();
    // backendimage!.value = "";
  }

  //< ---------------  add travel edit  dunction ---------->

  void editTravelAlevence(String id) async {
    isLoading.value = true;
    var result = await TravelExpenseService().editTravelAlavence(
        endimage: byte2,
        taId: id,
        taVehicle: vehicleTypeCtrle.text.toString(),
        taFrom: fromCtrl.text.toString(),
        taTo: toCtrl.text.toString(),
        taKm: distanseCtrl.text.toString(),
        taAmount: amtCtrl.text.toString(),
        remarks: remarks.text.toString());
    if (result.status) {
      isLoading.value = false;

      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  // < -------------   delete  travel exppennse ------->
  void deleteTravelbill(String id) async {
    var result = await TravelExpenseService().deleteTravelbill(id);
    if (result.status) {
      travelExpenseModel = TavelExpenseModel();
      update();
      isLoading.value = false;

      clear();
      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  //< ------- picking images -------------------->

  XFile? img;
  File? pic;
  var byte;

  var fileValue = 0.obs;
  void pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      var compressFile =
          await testCompressAndGetFile(File(file.path), file.path);

      if (compressFile != null) {
        log("-------------------------------------/....");

        fileValue.value = 1;
        byte = File(compressFile.path).readAsBytesSync();
        img = file;
        pic = File(compressFile.path);
        int fileSize = await pic!.length();

        log('File Size: $fileSize bytes');
        log('File Size (KB): ${fileSize / 1024} KB');
        log('File Size (MB): ${fileSize / (1024 * 1024)} MB');
      }

      // Get.snackbar("Bill", "Uploaded");
    }
    // Get.snackbar("sorry","Boys");
  }

  XFile? img2;
  File? pic2;
  var byte2;

  var fileValue2 = 0.obs;
  void pickImage2(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      var compressFile =
          await testCompressAndGetFile(File(file.path), file.path);

      if (compressFile != null) {
        log("-------------------------------------/....");

        fileValue2.value = 1;
        byte2 = File(compressFile.path).readAsBytesSync();
        img2 = file;
        pic2 = File(compressFile.path);
        int fileSize2 = await pic!.length();

        log('File Size: $fileSize2 bytes');
        log('File Size (KB): ${fileSize2 / 1024} KB');
        log('File Size (MB): ${fileSize2 / (1024 * 1024)} MB');
      }

      // Get.snackbar("Bill", "Uploaded");
    }
    // Get.snackbar("sorry","Boys");
  }
  //  var fileValue = 0.obs;
  // var byte;
  // var img;
  // File? pic;

  // Method to pick an image from the specified source (camera or gallery)
  // void pickImage(ImageSource source) async {
  //   final file = await ImagePicker().pickImage(source: source);

  //   if (file != null) {
  //     // Compress the image file
  //     var compressFile = await testCompressAndGetFile(File(file.path), file.path);

  //     if (compressFile != null) {
  //       log("-------------------------------------/....");

  //       // Update observable value and store the compressed file
  //       fileValue.value = 1;
  //       byte = File(compressFile.path).readAsBytesSync();
  //       img = file;
  //       pic = File(compressFile.path);
  //     }
  //     // You can add a snackbar or other feedback mechanism here if needed
  //   }
  // }

  // Method to compress the image (add your implementation)
  // Future<File?> testCompressAndGetFile(File file, String targetPath) async {
  //   // Implement your image compression logic here
  //   // Return the compressed file
  //   return file; // Replace with actual compressed file
  // }

  RxDouble fixededRate = 0.0.obs;
  double distance = 0.0;
  var totalamount = 0.0.obs;

  calculateAmount() {
    double number = fixededRate.value * distance;

    totalamount.value = double.parse(number.toStringAsFixed(2));
    amtCtrl.text = totalamount.value == 0
        ? fixededRate.value.toString()
        : totalamount.value.toString();
  }

  var getFixedRate = 0.0.obs;
  var getDistance = 0.0.obs;
  var updateTotalAmount = 0.0.obs;
  dateformats() {
    endDateController.text = DateTime.now().toString();
    startDateController.text = DateTime.now().toString();
  }

  add(String a) {
    var number =
        double.parse(a.toString()) * getFixedRate.value / getDistance.value;
    updateTotalAmount.value = double.parse(number.toStringAsFixed(3));
    amtCtrl.text = updateTotalAmount.value.toString();
  }

//< --------------- this  function using to sorthe data  by date----->
  var filterList = <TravelData>[].obs;

  // filteringData() {
  //   filterList.clear();
  //   if (travelExpenseModel != null || travelExpenseModel?.data != null) {
  //     for (int i = 0; i < travelExpenseModel!.data!.length; i++) {
  //       log("-----------");
  //       if (dateFormat
  //                   .parse(travelExpenseModel!.data![i].createdDate!)
  //                   .compareTo(DateTime.parse(startDateController.text)) >=
  //               0 &&
  //           dateFormat
  //                   .parse(travelExpenseModel!.data![i].createdDate!)
  //                   .compareTo(DateTime.parse(endDateController.text)) <=
  //               0) {
  //         filterList.value.add(travelExpenseModel!.data![i]);
  //         print(
  //             "hello this the date ${travelExpenseModel!.data![i].createdDate.toString()}");
  //         log("${filterList.length}hgbfvd");
  //         filterList.refresh();
  //         update();
  //       }
  //     }
  //   }
  //   update();
  // }
  dynamic startdate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  dynamic enddate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  filteringData() async {
    filterList.clear();
    filterList.value.clear();
    print("this is ${filterList.length}");
    try {
      if (travelExpenseModel != null && travelExpenseModel?.data != null) {
        for (int i = 0; i < travelExpenseModel!.data!.length; i++) {
          DateTime createdDate =
              dateFormat.parse(travelExpenseModel!.data![i].createdDate!);
          DateTime startDate = DateTime.parse(startdate);
          DateTime endDate = DateTime.parse(enddate);

          if (createdDate.compareTo(startDate) >= 0 &&
              createdDate.compareTo(endDate) <= 0) {
            filterList.add(travelExpenseModel!.data![i]);
            filterList.refresh();
            print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
            update();
          } else {
            print("sfbbbbsd dddddddddddddddddddddddddddddddddddddddddd$i");
          }
        }
        filterList.refresh();
        update();
        log("${filterList.length} ffffffffff...");
      }
      filterList.refresh();
      update();
    } catch (e) {
      print("Error in filtering: $e");
    }
  }
}
