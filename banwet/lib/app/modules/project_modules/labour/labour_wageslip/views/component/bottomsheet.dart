import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/labour_wageslip_controller.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/views/component/groupwageslip.dart';

import '../../../../../../Style/const.dart';
import '../addwage.dart';
import '../quickwage.dart';

class BottomSheetWidegt extends StatelessWidget {
  BottomSheetWidegt({super.key, required this.workid, required this.workname});
  final String workid;
  final String workname;
  LabourWageslipController controller = LabourWageslipController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.h))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              Get.back();
              Get.to(() => QuickWageView());
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/5571/5571608.png",
                    color: Colors.white,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  w4,
                  Text(
                    "Quick Wage",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
          h2,
          GestureDetector(
            onTap: () {
              Get.back();
              Get.to(() => Addwage(), arguments: {
                "workid": workid,
                "workname": workname,
              });
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/1547/1547275.png",
                    color: Colors.white,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  w4,
                  Text(
                    "Individual Wage",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
          h2,
          GestureDetector(
            onTap: () {
              Get.back();

              // Get.to(() => Addwage(), arguments: {
              //   "workid": workid,
              //   "workname": workname,
              // });
              Get.to(() {
                return const GroupWage();
              });
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/1547/1547275.png",
                    color: Colors.white,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  w4,
                  Text(
                    "Group Wage Slip ",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
