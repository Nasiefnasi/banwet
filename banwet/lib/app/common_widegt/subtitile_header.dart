import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../Style/const.dart';

class CommenHeader2 extends StatelessWidget {
  const CommenHeader2({super.key, required this.projectName});
  final String projectName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios)),
            width5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payments',
                  style: header15,
                ),
                SizedBox(
                  width: 57.w,
                  child: Text(
                    projectName,
                    style: header9,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
        GestureDetector(
            onTap: () {},
            child: Lottie.asset('assets/images/Jp7tjlAjLj.json',
                height: 7.h, width: 20.w)
            //     :Container(
            //   //color: Colors.red,
            //   height: 7.h,width: 20.w,
            // )
            ),
      ],
    );
  }
}
