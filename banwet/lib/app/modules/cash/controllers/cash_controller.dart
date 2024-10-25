import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/data/model/leadger.model/ledger_model.dart';
import 'package:banwet/app/data/model/notification.model/notification_model.dart';
import 'package:banwet/app/data/service/notification.service/otification.service.dart';

import '../../../data/model/cash_model.dart';
import '../../../data/service/cash/cash_service.dart';

class CashController extends GetxController {
  var dateFormat = DateFormat('dd-MM-yyyy');

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  var cashModel = CashModel().obs;
  getDetails() async {
    var result = await CashService().getPayemntDatails();
    cashModel.value = result;
    update();
  }

  var notifir = NotificationModel().obs;
  GetNotifiers() async {
    var results = await NotificationService().getNotification();
    // notifir.value = results;
  }

  LedgerModel? ledgerModel;
  getLeadgerDeatils() async {
    var result = await CashService().getLeadgerDeatils();
    ledgerModel = result;
    filteringData();

    update();
  }

  var filterList = <Transactions>[].obs;

  // filteringData() {
  //   filterList.clear();
  //   for (int i = 0; i < ledgerModel!.data!.transactions!.length; i++) {
  //     var transactionDate =
  //         dateFormat.parse(ledgerModel!.data!.transactions![i].date ?? "");
  //     log("Transaction date: $transactionDate");
  //     if (dateFormat
  //                 .parse(ledgerModel?.data?.transactions?[i].date ?? "")
  //                 .compareTo(DateTime.parse(startDateController.text)) >=
  //             0 &&
  //         dateFormat
  //                 .parse(ledgerModel?.data?.transactions?[i].date ?? "")
  //                 .compareTo(DateTime.parse(endDateController.text)) <=
  //             0) {
  //       log("------------------lllll");
  //       filterList.add(ledgerModel!.data!.transactions![i]);
  //       log(filterList.length.toString());
  //       update();
  //     }
  //   }
  // }
  // void filteringData() {
  //   log("-----------------");
  //   filterList.clear();

  //   for (int i = 0; i <= ledgerModel!.data!.transactions!.length; i++) {
  //     // Parse the transaction date
  //     var transactionDate =
  //         dateFormat.parse(ledgerModel!.data!.transactions![i].date ?? "");
  //     var startDate = DateTime.parse(startDateController.text);
  //     var endDate = DateTime.parse(endDateController.text);

  //     // Log the dates to check if they are parsed correctly
  //     log("Transaction Date: $transactionDate, Start Date: $startDate, End Date: $endDate");

  //     if (transactionDate.compareTo(startDate) >= 0 &&
  //         transactionDate.compareTo(endDate) <= 0) {
  //       log("------------//////////////////////---");
  //       filterList.value.add(ledgerModel!.data!.transactions![i]);
  //       filterList.refresh();
  //       update();
  //     }
  //   }

  //   update();
  // }

  // void filteringData() {
  //   log("-----------------");
  //   filterList.clear();

  //   for (int i = 0; i <= ledgerModel!.data!.transactions!.length; i++) {
  //     // var transactionDate =
  //     //     dateFormat.parse(ledgerModel!.data!.transactions![i].date ?? "");
  //     // log(transactionDate.toString());
  //     // if (dateFormat
  //     //             .parse(ledgerModel!.data!.transactions![i].date ?? "")
  //     //             .compareTo(DateTime.parse(startDateController.text)) >=
  //     //         0 &&
  //     //     dateFormat
  //     //             .parse(ledgerModel!.data!.transactions![i].date ?? "")
  //     //             .compareTo(DateTime.parse(endDateController.text)) <=
  //     print(ledgerModel!.data!.transactions![i].date!);
  //     //         0)
  //     if (dateFormat
  //                 .parse(ledgerModel!.data!.transactions![i].date.toString())
  //                 .compareTo(DateTime.parse(startDateController.text)) >=
  //             0 &&
  //         dateFormat
  //                 .parse(ledgerModel!.data!.transactions![i].date.toString())
  //                 .compareTo(DateTime.parse(endDateController.text)) <=
  //             0) {
  //       log("------------//////////////////////---");
  //       filterList.value.add(ledgerModel!.data!.transactions![i]);
  //       filterList.refresh();
  //       update();
  //     }
  //     continue;
  //   }

  //   update();
  // }
  void filteringData() {
    log("-----------------");
    filterList.clear();

    // Use i < length to avoid IndexOutOfRangeException
    for (int i = 0; i < ledgerModel!.data!.transactions!.length; i++) {
      String? transactionDateString = ledgerModel!.data!.transactions![i].date;

      // Check if the date is null or empty before parsing
      if (transactionDateString == null || transactionDateString.isEmpty) {
        log("Invalid or missing date for transaction at index $i");
        continue;
      }

      try {
        // Parse the transaction date
        var transactionDate = dateFormat.parse(transactionDateString);
        var startDate = DateTime.parse(startDateController.text);
        var endDate = DateTime.parse(endDateController.text);

        log("Transaction Date: $transactionDate, Start Date: $startDate, End Date: $endDate");

        // Compare the dates
        if (transactionDate.compareTo(startDate) >= 0 &&
            transactionDate.compareTo(endDate) <= 0) {
          log("Transaction within date range at index $i");
          filterList.value.add(ledgerModel!.data!.transactions![i]);
          filterList.refresh();
          update();
        }
      } catch (e) {
        log("Error parsing date: $transactionDateString at index $i - Error: $e");
      }
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDetails();
    getLeadgerDeatils();
    GetNotifiers();
  }
}
