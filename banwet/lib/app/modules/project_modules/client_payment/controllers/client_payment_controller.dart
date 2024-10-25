import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClientPaymentController extends GetxController {
  var argumnetData = Get.arguments;

  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
}
