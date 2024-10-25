import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/launch_soon.dart';
import '../../../../routes/app_pages.dart';

class SubContactMenu extends StatelessWidget {
  SubContactMenu({super.key, this.contractId});
  var argumnentData = Get.arguments;
  final contractId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sub Contracts',
            style: header15.copyWith(color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 2.h),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //           onTap: () => Get.back(),
              //           child: const Icon(Icons.arrow_back_ios)),
              //       w2,
              //       Text(
              //         'Material Purchase',
              //         style: header2.copyWith(
              //             fontSize: 23.sp, fontWeight: FontWeight.w600),
              //       ),
              //     ],
              //   ),
              // ),
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              item[index][2],
                                              width: 15.w,
                                              height: 5.h,
                                              color: Colors.white,
                                            ),
                                            width10,
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
      ),
    );
  }

  routing(String values) {
    print("this is not working ${argumnentData["contractId"]}");
    switch (values) {
      // case "info":
      //   Get.to(() => SubInfoHome(), arguments: {
      //     "workid": argumnentData["workid"],
      //     "workname": argumnentData["workname"],
      //     "contractId": argumnentData["contractId"],
      //   });
      //   break;
      case "subactivity":
        Get.toNamed(Routes.ACTIVITY, arguments: {
          "workid": argumnentData["workid"],
          "workname": argumnentData["workname"],
          "contractId": contractId ?? argumnentData["contractId"],
        });
        break;
      case "subbill":
        Get.toNamed(Routes.SUBCONTRACT_BILL, arguments: {
          "workid": argumnentData["workid"],
          "workname": argumnentData["workname"],
          "contractId": contractId ?? argumnentData["contractId"],
        });
        break;
      case "payment":
        Get.toNamed(Routes.PAYMENT, arguments: {
          "workid": argumnentData["workid"],
          "workname": argumnentData["workname"],
          "contractId": contractId ?? argumnentData["contractId"],
        });
        break;

      default:
        print("${values}m");
        Get.to(() => const LaunchSoon());
        break;
    }
  }

  List item = [
    // ['Info', 'info', 'assets/images/pa1.png'],
    ['Activity', 'subactivity', 'assets/images/pa2.png'],
    ['Bill', 'subbill', 'assets/images/pa3.png'],
    ['Payment', "payment", 'assets/images/money.png'],
  ];
}
