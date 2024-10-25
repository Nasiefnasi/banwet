import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../../owntool_inner/views/owntool_inner_view.dart';
import '../controllers/renttool_inner_controller.dart';
import 'adda_innerrenttool.dart';

class RenttoolInnerView extends GetView<RenttoolInnerController> {
  const RenttoolInnerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            h1,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: ProjectNameTitile(
                projectName: controller.argumnetData["workname"],
                screenTitile: controller.argumnetData["toolname"],
                onTap: () {
                  if (controller.toolDetailsModel != null) {
                    Get.to(() => AddInnerRentTool());
                  }
                },
              ),
            ),
            h1,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                children: [
                  common(
                      'Rented Quantity', controller.argumnetData["quantity"]),
                  w2,
                  common('Quantity at Site',
                      controller.argumnetData["qunatityOnSite"]),
                ],
              ),
            ),
            h1,
            listHeading(),
            GetBuilder<RenttoolInnerController>(
              builder: (controller) => controller.toolDetailsModel == null
                  ? SpinKitThreeBounce(
                      color: bColor,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.toolDetailsModel!.data!.rentLog!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            w3,
                            Text(
                              controller.toolDetailsModel!.data!.rentLog![index]
                                      .rentedDate ??
                                  "",
                              style: header11,
                            ),
                            w5,
                            Text(
                              controller.toolDetailsModel!.data!.rentLog![index]
                                      .rentedFrom ??
                                  "",
                              style: header11,
                            ),
                            w14,
                            Row(
                              children: [
                                SizedBox(
                                    width: 13.w,
                                    child: Text(
                                      controller.toolDetailsModel!.data!
                                              .rentLog![index].rentedQty ??
                                          "",
                                      style: header11,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                GestureDetector(
                                    // onTap: () {
                                    //   return(
                                    //       context,
                                    //       controller.toolDetailsModel!.data
                                    //               .rentLog[index].rentedQty ??
                                    //           "",
                                    //       controller.toolDetailsModel
                                    //           .rentLog[index][index].id);
                                    // },
                                    child: const Icon(Icons.refresh))
                              ],
                            ),
                            w12,
                            GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                    title: "Remarks",
                                    middleTextStyle: header11,
                                    middleText: controller.toolDetailsModel!
                                        .data!.rentLog![index].status!);
                              },
                              child: billRemarks(),
                            )
                          ],
                        );
                      },
                    ),
              init: RenttoolInnerController(),
            ),
          ],
        ),
      ),
    );
  }
}

listHeading() {
  return Container(
    height: 5.h,
    width: 100.w,
    color: bColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Date', style: wheader4.copyWith(fontSize: 11.sp)),
        w05,
        Text('From', style: wheader4.copyWith(fontSize: 11.sp)),
        Text('Returned Qty', style: wheader4.copyWith(fontSize: 11.sp)),
        Text('Remarks', style: wheader4.copyWith(fontSize: 11.sp)),
      ],
    ),
  );
}
