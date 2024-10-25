import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/style/const.dart';

import '../../../common_widegt/launch_soon.dart';
import '../../../routes/app_pages.dart';

class MaterialPurchaseHome extends StatelessWidget {
  var argumentData = Get.arguments;
  MaterialPurchaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        title: Text(
          "Purchase Management",
          style: header15,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            //   padding: EdgeInsets.all(2.h),
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
                                  height: 9.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Center(
                                            child: SvgPicture.asset(
                                              item[index][2],
                                              width: 28,
                                              height: 28,
                                              color: Colors.white,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          w5,
                                          Text(
                                            item[index][0],
                                            style: popin18W400.copyWith(
                                                fontWeight: FontWeight.w500),
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
      case "request":
        Get.toNamed(Routes.PURCHASE_REQUEST, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "order":
        Get.toNamed(Routes.PURCHASE_ORDER, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "bill":
        Get.toNamed(Routes.PURCHASE_BILL, arguments: {
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
    ['Purchase Request', 'request', 'assets/svg/request.svg'],
    ['Purchase Order', 'order', "assets/svg/order.svg"],
    ['Purchase Bill', 'bill', 'assets/svg/bill.svg'],
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
                SvgPicture.asset(
                  image,
                  width: 28,
                  height: 28,
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

class ProjectNameTitile extends StatelessWidget {
  ProjectNameTitile(
      {super.key,
      this.titlecolors,
      this.back,
      this.size,
      this.projectcolor,
      this.projectName,
      required this.screenTitile,
      this.addbutton,
      required this.onTap,
      this.lefticon});
  final projectName;
  final addbutton;
  final String screenTitile;
  void Function() onTap;
  final size;
  final projectcolor;
  final titlecolors;
  Function()? back;
  final lefticon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: back ?? () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: lefticon,
                )),
            width5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.amber,
                  width: size ?? 58.w,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    screenTitile,
                    style: header15.copyWith(color: titlecolors),
                  ),
                ),
                // Text(
                //   screenTitile,
                //   style: header15.copyWith(color: titlecolors),
                // ),
                projectName != null
                    ? SizedBox(
                        width: 57.w,
                        child: Text(
                          projectName,
                          style: header9.copyWith(color: projectcolor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : const SizedBox()
              ],
            )
          ],
        ),
        GestureDetector(
            onTap: () {
              onTap();
            },
            child: addbutton ??
                Lottie.asset(
                  'assets/images/Jp7tjlAjLj.json',
                  height: 7.h,
                  width: 20.w,
                ))
      ],
    );
  }
}
