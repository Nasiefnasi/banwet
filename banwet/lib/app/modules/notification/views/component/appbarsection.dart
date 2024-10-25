import 'package:flutter/material.dart';
import 'package:get/get.dart';

appBarSection() {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    toolbarHeight: 62,
    title: const Text(
      'Notifications',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: Colors.black,
      onPressed: () {
        Get.back();
      },
    ),
  );
}
