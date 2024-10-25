import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../common_widegt/submitpage.dart';
import '../../../../data/model/dayilnote/dailymodel.dart';
import '../../../../data/service/project_dayilynote/project_dayilnote_service.dart';

class ProjectDailyNoteController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var argumnetData = Get.arguments;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  @override
  void onReady() {
    super.onReady();
    change();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());

  DayilNoteModel? dayilNoteModel;

  //  <----------- fetching daily note from api ------------>
  RxBool dayilnoteloading = false.obs;
  // getDetails() async {
  //   dayilnoteloading.value = true;
  //   update();
  //   dayilnoteloading.refresh();
  //   var result =
  //       await ProjectDayilNoteService().getDayilNote(argumnetData["workid"]);
  //   dayilNoteModel = result;
  //   result;
  //   if (result.status == false) {
  //     dayilnoteloading.value = false;
  //     dayilnoteloading.refresh();
  //     update();
  //   }
  //   filterAndCalculate();
  //   update();
  //   dayilnoteloading.value = false;
  //   dayilnoteloading.refresh();
  //   update();
  // }
  getDetails() async {
    dayilnoteloading.value = true;
    update();
    dayilnoteloading.refresh();

    var result =
        await ProjectDayilNoteService().getDayilNote(argumnetData["workid"]);

    // Check if the result is null
    if (result == null) {
      // Handle null case, possibly show a message to the user or log an error
      dayilnoteloading.value = false;
      update();
      dayilnoteloading.refresh();
      update();
      print("Error: No data returned or invalid response.");
      return;
    }

    // If result is not null, proceed with status check
    dayilNoteModel = result;

    if (result.status == false) {
      dayilnoteloading.value = false;
      dayilnoteloading.refresh();
      update();
      return; // Early return if status is false to avoid further processing
    }

    // Proceed with filtering and calculation
    filterAndCalculate();

    update();
    dayilnoteloading.value = false;
    dayilnoteloading.refresh();
    update();
  }

  // this function is update the enddate and start date
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  // <---------- this function using to filtering items from two dates  ---->
  var filteredList = [].obs;
  filterAndCalculate(
      // List<DayilyNoteData> dataList,
      ) {
    // log("[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]");
    filteredList.clear();
    // totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');
    if (dayilNoteModel != null || dayilNoteModel!.data != null) {
      for (int index = 0; index < dayilNoteModel!.data!.length; index++) {
        print(dayilNoteModel!.data?[index].createdDate);
        if (dateFormat
                    .parse(dayilNoteModel!.data![index].createdDate)
                    .compareTo(DateTime.parse(startDateController.text)) >=
                0 &&
            dateFormat
                    .parse(dayilNoteModel!.data![index].createdDate)
                    .compareTo(DateTime.parse(endDateController.text)) <=
                0) {
          filteredList.add(dayilNoteModel!.data![index]);
          // totalAmount.value += dataList[index].totalWage;
          // log("$totalAmount--------------------");
          // Optionally, you can return a boolean or other value to indicate success/failure
        }
      }
    }
  }

  addNotess() async {
    isLoading.value = true;
    var result = await ProjectDayilNoteService().addDayilNote(
        workid: argumnetData['workid'].toString(),
        title: titleController.text.toString(),
        description: descriptionController.text.toString(),
        byte: byte);

    if (result.status) {
      clear();
      Get.to(() => const SubmitDone());
      isLoading.value = false;
      fileValue.value = 0;
      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  deleteNote(String noteid, String workid) async {
    isLoading.value = true;
    update();
    var result = await ProjectDayilNoteService().deleteNote(noteid, workid);
    dayilNoteModel = null;
    if (result.status) {
      isLoading.value = false;

      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  updateprojectDayilinote(String noteId) async {
    isLoading.value = true;

    var result = await ProjectDayilNoteService().updateprojectDayilNote(
        workid: argumnetData['workid'].toString(),
        title: titleController.text,
        description: descriptionController.text,
        noteId: noteId);
    if (result.status) {
      isLoading.value = false;
      clear();
      Get.to(() => const SubmitDone());
      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  clear() {
    titleController.clear();
    descriptionController.clear();
  }

  XFile? img;
  File? pic;
  var byte;

  var fileValue = 0.obs;
  void pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      fileValue.value = 1;
      byte = File(file.path).readAsBytesSync();
      img = file;
      pic = File(file.path);
      print(base64Encode(byte));
      // Get.snackbar("Bill", "Uploaded");
    }
    print("sorry");
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
}
