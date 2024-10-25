import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/office_expense/controllers/add_officeexpence_controller.dart';

import '../../../../../Style/const.dart';

class UploadBillBottomSheet extends StatelessWidget {
  UploadBillBottomSheet({super.key});
  AddfficeExpenseController controller = Get.put(AddfficeExpenseController());
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 23.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.h))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.pickImage(ImageSource.gallery);
                Get.back();
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
                    Icon(
                      Icons.photo,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                    w4,
                    Text(
                      "Gallery",
                      style: wheader13,
                    ),
                  ],
                )),
              ),
            ),
            h2,
            GestureDetector(
              onTap: () {
                controller.pickImage(ImageSource.camera);
                Get.back();
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
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                    w4,
                    Text(
                      "Camera",
                      style: wheader13,
                    ),
                  ],
                )),
              ),
            ),
          ],
        ));
  }
}
