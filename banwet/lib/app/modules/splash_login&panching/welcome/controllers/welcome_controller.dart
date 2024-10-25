import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  PageController pageController = PageController();

  List images = [
    'assets/images/03.png',
    'assets/images/02.png',
    'assets/images/p3.jpg'
  ];

  List names = [
    "Integrated Platform",
    "Emphasize Process and Data",
    "Business Improvement"
  ];
}
