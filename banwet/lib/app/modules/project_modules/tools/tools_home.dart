import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/launch_soon.dart';
import '../../../routes/app_pages.dart';

class ToolsHome extends StatelessWidget {
  ToolsHome({super.key});
  var argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tool Management',
            style: header2.copyWith(
              fontFamily: Medium,
              fontSize: 18.sp,
            ),
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

              //     ],
              //   ),
              // ),
              AnimationLimiter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
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
                                            BorderRadius.circular(10)),
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
                                            // width2,
                                            w2,
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .6,
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                item[index][0],
                                                style: wheader2,
                                              ),
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
    switch (values) {
      case "owntool":
        Get.toNamed(Routes.OWN_TOOLS, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "renttool":
        Get.toNamed(Routes.RENTTOOL, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      // case "Consumption":
      //   Get.toNamed(Routes.TOOLSConsumption, arguments: {
      //     "workid": argumentData["workid"],
      //     "workname": argumentData["workname"],
      //   });
      //   break;

      default:
        print("${values}mkkk");
        Get.to(() => const LaunchSoon());
        break;
    }
  }

  List item = [
    ['Tools', 'owntool', "assets/images/iconoir_tools.png"],
    ['Tools Transfer', 'renttool', 'assets/images/pa2.png'],
    // ['Tools Consumption & Payment', 'Consumption', 'assets/images/pa2.png'],
  ];
}

class PurchaseListile extends StatelessWidget {
  PurchaseListile(
      {super.key,
      required this.name,
      required this.image,
      required this.onTap});
  final String name;
  final String image;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(1.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        height: 10.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 15.w,
                  height: 5.h,
                  color: Colors.white,
                ),
                width10,
                Text(
                  name,
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
    );
  }
}
