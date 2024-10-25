import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';


show(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          //  height:80.h,
          width: 100.w,
          child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(2.h),
                  height: 28.h,
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_amber_outlined,
                        size: 23.sp,
                        color: Colors.red,
                      ),
                      h1,
                      Text(
                        "Warning",
                        style: header12,
                      ),
                      h1,
                      Text(
                        "You Entered Over Paid Amount",
                        style: header12,
                      ),
                      h2,
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 4.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: bColor,
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                              child: Text(
                            'Back',
                            style: header12.copyWith(color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        );
      });
}
