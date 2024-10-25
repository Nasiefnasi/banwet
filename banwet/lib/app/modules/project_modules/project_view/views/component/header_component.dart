import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../routes/app_pages.dart';
import '../../controllers/project_view_controller.dart';

class HeaderComponent extends StatelessWidget {
  HeaderComponent({super.key});
  ProjectViewController controller = Get.put(ProjectViewController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 21.h,
      width: dWidth,
      // decoration: BoxDecoration(
      //     color: bColor,
      //     borderRadius: const BorderRadius.only(
      //         bottomLeft: Radius.circular(25),
      //         bottomRight: Radius.circular(25))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    w2,
                    Text(
                      'Assigned Projects',
                      style: header13.copyWith(fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  child: Lottie.asset(
                    'assets/images/WN.json',
                    height: 58,
                    animate: true,

                    //controller5.loading.isFalse?true:false,
                  ),
                ),
              ],
            ),
            h1,
            Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.2),
                //     spreadRadius: 2,
                //     blurRadius: 2,
                //     offset: const Offset(0, 2), // changes position of shadow
                //   ),
                // ],
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
              ),
              child: SizedBox(
                height: 45,
                child: CupertinoSearchTextField(
                  itemSize: 16.sp,
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset("assets/images/Vecto.png")

                      // const Icon(
                      //   Icons.search_outlined,
                      //   size: 25,
                      // ),
                      ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  controller: controller.controller,
                  placeholder: 'Search your Projects',
                  onChanged: (c) {
                    controller.searchText.value = c.toString();
                    controller.filterData();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
