import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/launch_soon.dart';
import '../../../routes/app_pages.dart';

class LabourHome extends StatelessWidget {
  LabourHome({super.key});
  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Labour & Wage Slip',
            style: header15.copyWith(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: const Row(
                children: [
                  // GestureDetector(
                  //     onTap: () => Get.back(),
                  //     child: const Icon(Icons.arrow_back_ios)),
                  // w2,
                  // Text(
                  //   'Labour & Wage Slip',
                  //   style: header2.copyWith(
                  //       fontSize: 23.sp, fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
            ),
            AnimationLimiter(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(seconds: 1),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  // Get.toNamed(item[index][1].toString());
                                  routing(item[index][1].toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(1.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            item[index][2],
                                            width: 10.w,
                                            height: 4.h,
                                            color: Colors.white,
                                          ),
                                          width5,
                                          Text(
                                            item[index][0],
                                            style: wheader2,
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 17.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    })),
          ],
        ),
      ),
    );
  }

  routing(String values) {
    switch (values) {
      case "labour":
        Get.toNamed(Routes.LABOUR_LIST, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "wageSlip":
        Get.toNamed(Routes.LABOUR_WAGESLIP, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "labourActivities":
        Get.toNamed(Routes.LABOUR_ACTIVITY, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;

      default:
        print("${values}mkkk");
        Get.to(() => const LaunchSoon());
        break;
    }
  }

  List item = [
    ['Labour', 'labour', 'assets/images/pa1.png'],
    ['Wage Slip', 'wageSlip', 'assets/images/pa2.png'],
    ['Labour Activities', 'labourActivities', 'assets/images/pa3.png'],
  ];
}
