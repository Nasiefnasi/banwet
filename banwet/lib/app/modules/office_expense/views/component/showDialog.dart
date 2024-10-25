import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';

warningDialogue(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 80.h,
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
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                  height: 28.h,
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/warningpng.png",
                        width: 9.w,
                        height: 9.h,
                        color: Colors.red,
                      ),
                      // h1,
                      Text(
                        "Warning",
                        style: header15,
                      ),
                      h1,
                      Text(
                        "Paid Amount Exceeds the Payable Amount",
                        textAlign: TextAlign.center,
                        style: header10.copyWith(
                            color: const Color.fromARGB(255, 139, 131, 131)),
                      ),
                      //  h2,
                      const Divider(thickness: 1),

                      const SizedBox(height: 2),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },

                          // child:
                          // Container(
                          //   height: 4.h,
                          //   width: 30.w,
                          //   decoration: BoxDecoration(
                          //       color: bColor,
                          //       borderRadius: BorderRadius.circular(13)),
                          //   child:
                          //    Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Back',
                              textAlign: TextAlign.center,
                              style: header12.copyWith(color: Colors.black),
                              //  )
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        );
      });
}

warningDialoguetooltransfer(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 80.h,
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
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                  height: 28.h,
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/warningpng.png",
                        width: 9.w,
                        height: 9.h,
                        color: Colors.red,
                      ),
                      // h1,
                      Text(
                        "Warning",
                        style: header15,
                      ),
                      h1,
                      Text(
                        "Transfer Quantity Exceeds the Balance Quantity",
                        textAlign: TextAlign.center,
                        style: header10.copyWith(
                            color: const Color.fromARGB(255, 139, 131, 131)),
                      ),
                      //  h2,
                      const Divider(thickness: 1),

                      const SizedBox(height: 2),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },

                          // child:
                          // Container(
                          //   height: 4.h,
                          //   width: 30.w,
                          //   decoration: BoxDecoration(
                          //       color: bColor,
                          //       borderRadius: BorderRadius.circular(13)),
                          //   child:
                          //    Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Back',
                              textAlign: TextAlign.center,
                              style: header12.copyWith(color: Colors.black),
                              //  )
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        );
      });
}
