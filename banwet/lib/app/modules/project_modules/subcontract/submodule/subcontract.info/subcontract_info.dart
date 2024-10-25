import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/common_widget.dart';
import '../../../../../Style/const.dart';
import '../../controllers/subcontract_controller.dart';

class SubInfoHome extends StatelessWidget {
  final controller = Get.put(SubcontractController());
  SubInfoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      text: "Info",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            h2,
            _commonTitle('SubWork Name'),
            h2,
            _commonBox(controller.subWorkName),
            h2,
            _commonTitle('Contractor'),
            h2,
            _commonBox(controller.subContr),
            h2,
            _commonTitle('Description'),
            h2,
            _commonBox2(controller.subDes),
            h2,
            _commonTitle('Contractor Type'),
            h2,
            _commonBox(controller.subConrType),
            h2,
            _commonTitle('Status'),
            h2,
            _commonBox(controller.subStatus),
          ],
        ),
      ),
    );
  }

  Row _commonTitle(String? text) {
    return Row(
      children: [
        // Container(
        //   width: 1.7.w,
        //   height: 2.2.h,
        //   color: bColor,
        // ),
        // w3,
        Text(
          text!,
          style: header11,
        )
      ],
    );
  }

  Container _commonBox(String? text) {
    return Container(
      // height: 5.h,
      // width: 100.w,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black12.withOpacity(0.1)),
      //     color: bColor2,
      //     borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // w3,
          Text(
            text!,
            style: header11,
          ),
        ],
      ),
    );
  }

  Container _commonBox2(String? text) {
    return Container(
      height: 12.h,
      width: 100.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12.withOpacity(0.1)),
          color: bColor2,
          borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          w3,
          Expanded(
              child: Text(
            text!,
            style: header11,
          )),
        ],
      ),
    );
  }
}
