import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../controllers/labour_wageslip_controller.dart';

class CountAndAmountContainer extends GetView<LabourWageslipController> {
  CountAndAmountContainer({
    super.key,
  });
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  LabourWageslipController controller = Get.put(LabourWageslipController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      width: 100.w,
      decoration:
          BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Present',
                style: header12.copyWith(color: Colors.white),
              ),
              Obx(() {
                return Text(
                  controller.filteredList.value.length.toString(),

                  // controller.presentWage.length.toString(),
                  style: header12.copyWith(color: Colors.white),
                );
              }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wage Amount',
                style: header12.copyWith(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    '₹',
                    style: TextStyle(fontSize: 13.sp, color: Colors.white),
                  ),
                  w1,
                  Obx(() => Text(
                        controller.totalAmount.toString(),
                        style: header12.copyWith(
                            color: Colors.white, fontSize: 11.5.sp),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CountAndAmountContainer1 extends GetView<LabourWageslipController> {
  CountAndAmountContainer1({
    super.key,
  });
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  LabourWageslipController controller = Get.put(LabourWageslipController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 100.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdfdfdf)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Present',
                      style: TextStyle(fontSize: 11, fontFamily: regular)),
                  Obx(() {
                    return Text(
                      controller.filteredList.value.length.toString(),

                      // controller.presentWage.length.toString(),
                      style: header12.copyWith(
                          color: Colors.black,
                          fontSize: 13.5.sp,
                          fontFamily: SemiBold,
                          fontWeight: FontWeight.w500),
                    );
                  }),
                ],
              ),
            ),
          ),
          w2,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdfdfdf)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Wage Amount',
                      style: TextStyle(fontSize: 11, fontFamily: regular)),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('₹',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                // fontFamily: SemiBold,
                                fontSize: 13.5.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        w1,
                        Obx(() => Text(
                              controller.totalAmount.toString(),
                              style: header12.copyWith(
                                  fontFamily: SemiBold,
                                  color: Colors.black,
                                  fontSize: 13.5.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
