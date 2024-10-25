import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../Style/const.dart';

class LaunchSoon extends StatelessWidget {
  const LaunchSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      color: bColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'assets/images/soon.json',
                  height: 25.h,
                  width: 70.w,
                ),
              ),
              Text(
                "LAUNCHING SOON",
                style: header24,
              ),
              h3,
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22), color: bColor),
                  child: Center(child: Text('Back', style: wheader3)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
