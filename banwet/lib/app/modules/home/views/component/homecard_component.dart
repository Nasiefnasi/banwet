import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.image,
    required this.firstText,
    required this.secondText,
  });
  final String image;
  final String firstText;
  final String secondText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () =>  Get.to(() => const LaunchSoon()),
      child: SizedBox(
        height: 28.h,
        width: 42.w,
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          color: bColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        image,
                        width: 20.w,
                        height: 13.h,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: wheader13,
                    ),
                    Text(secondText, style: wheader9),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
