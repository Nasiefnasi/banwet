import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_ios/image_picker_ios.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/utils/image.compress.dart';

import '../../../common_widegt/submitpage.dart';
import '../../../data/model/dayilnote/dailymodel.dart';
import '../../../data/service/dailynote/get_dailynote.dart';

class DailyNoteController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingUpdate = false.obs;
  var dateFormat = DateFormat('dd-MM-yyyy');
  var dateFormat2 = DateFormat('yyyy-MM-dd');
  var filterList = <DayilyNoteData>[].obs;
  var isShow = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDetails();
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

  getDetails() async {
    isShow.value = true;
    var result = await DayilNoteService().getDayilNote();

    if (result.status) {
      dayilNoteModel = result;
      update();
      filteringData();
      isShow.value = false;
    } else {
      isShow.value = false;
    }
  }

  // this function is update the enddate and start date
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  // <---------- this function using to filtering items from two dates  ---->

  addNotes() async {
    isLoading.value = true;
    var result = await DayilNoteService().addDayilNote(
        title: titleController.text.toString(),
        description: descriptionController.text.toString(),
        byte: byte);
    if (result.status) {
      isLoading.value = false;
      fileValue.value = 0;
      clear();
      getDetails();
      Get.to(() => const SubmitDone());
    } else {
      isLoading.value = false;
    }
  }

  delete(String billId) async {
    var result = await DayilNoteService().deleteNote(billId);
    if (result.status) {
      isLoading.value = false;

      clear();
      getDetails();
    } else {
      isLoading.value = false;
    }
  }

  updateNote(String noteid) async {
    isLoadingUpdate.value = true;
    var result = await DayilNoteService()
        .updateNote(noteid, titleController.text, descriptionController.text);
    log(result.toString());
    if (result.status) {
      getDetails();
      clear();
      isLoadingUpdate.value = false;
      Get.to(() => const SubmitDone());
    } else {
      isLoadingUpdate.value = false;
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
    if (Platform.isIOS) {
      final ImagePickerIOS picker = ImagePickerIOS();
      final file = await picker.pickImage(source: source);
      if (file != null) {
        var compressFile =
            await testCompressAndGetFile(File(file.path), file.path);

        if (compressFile != null) {
          log("-------------------------------------/....");

          fileValue.value = 1;
          byte = File(compressFile.path).readAsBytesSync();
          img = file as XFile?;
          pic = File(compressFile.path);
        }

        // Get.snackbar("Bill", "Uploaded");
      }
    } else if (Platform.isAndroid) {
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
        }

        // Get.snackbar("Bill", "Uploaded");
      }
    }
    // Get.snackbar("sorry","Boys");
  }

  void pickImages(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: source);

      if (file != null) {
        var compressFile =
            await testCompressAndGetFile(File(file.path), file.path);

        if (compressFile != null) {
          log("Image picked and compressed successfully.");

          fileValue.value = 1;
          byte = File(compressFile.path).readAsBytesSync();
          img = file;
          pic = File(compressFile.path);

          // Optional: show a snackbar to notify successful upload
          // Get.snackbar("Success", "Image uploaded successfully");
        } else {
          log("Compression failed");
          // Optional: show a snackbar to notify the failure
          // Get.snackbar("Error", "Failed to compress image");
        }
      } else {
        log("No image selected");
      }
    } catch (e) {
      log("Error picking image: $e");
    }
  }

  dateformats() {
    endDateController.text = DateTime.now().toString();
    startDateController.text = DateTime.now().toString();
  }

  dynamic startdate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  dynamic enddate =
      DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString();
  filteringData() async {
    filterList.clear();
    filterList.value.clear();
    print("this is ${filterList.length}");
    try {
      if (dayilNoteModel != null || dayilNoteModel?.data != null) {
        for (int i = 0; i < dayilNoteModel!.data!.length; i++) {
          DateTime createdDate =
              dateFormat.parse(dayilNoteModel!.data![i].createdDate);
          DateTime startDate = DateTime.parse(startdate);
          DateTime endDate = DateTime.parse(enddate);

          if (createdDate.compareTo(startDate) >= 0 &&
              createdDate.compareTo(endDate) <= 0) {
            filterList.add(dayilNoteModel!.data![i]);
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
  // filteringData() {
  //   filterList.clear();
  //   if (dayilNoteModel != null || dayilNoteModel?.data != null) {
  //     for (int i = 0; i < dayilNoteModel!.data.length; i++) {
  //       if (dateFormat
  //                   .parse(dayilNoteModel!.data[i].createdDate)
  //                   .compareTo(DateTime.parse(startDateController.text)) >=
  //               0 &&
  //           dateFormat
  //                   .parse(dayilNoteModel!.data[i].createdDate)
  //                   .compareTo(DateTime.parse(endDateController.text)) <=
  //               0) {
  //         filterList.add(dayilNoteModel!.data[i]);
  //         log("${filterList.length}hgbfvd");
  //       }
  //     }
  //   }
  // }
}
