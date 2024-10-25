import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/controllers/owntool_inner_controller.dart';

class transferInLog extends StatelessWidget {
  const transferInLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwntoolInnerController>(
      builder: (controller) => controller.toolDetailsModel2 == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.toolDetailsModel2!.data.transferInLog.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount:
                      controller.toolDetailsModel2!.data.transferInLog.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bColor,
                            borderRadius: BorderRadius.circular(10)),
                        // height: mediaquery.height * .2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .toolDetailsModel2!.data.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: Medium,
                                          ),
                                        ),
                                        h03,
                                        Text(
                                          controller.toolDetailsModel2!.data
                                              .categoryName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: regular,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.defaultDialog(
                                        backgroundColor: Colors.white,
                                        radius: 10,
                                        title: "Remarks",
                                        middleTextStyle: header11,
                                        middleText: controller
                                                .toolDetailsModel2!
                                                .data
                                                .transferInLog[index]
                                                .remarks ??
                                            "",
                                      );
                                    },
                                    child: const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              h1,
                              const Divider(),
                              h1,
                              Text(
                                  "Transfer Date : ${controller.toolDetailsModel2!.data.transferInLog[index].transferDate}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              // const Spacer(),
                              Text(
                                  "Qty at worksite : ${controller.toolDetailsModel2!.data.transferInLog[index].transferredQty}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              h1
                            ],
                          ),
                        ),
                      ),
                    );
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     w3,
                    //     Text(
                    //       controller.toolDetailsModel2!.data
                    //           .transferInLog[index].transferDate,
                    //       style: header11,
                    //     ),
                    //     w5,
                    //     Text(
                    //       controller.toolDetailsModel2!.data
                    //           .transferInLog[index].location,
                    //       style: header11,
                    //     ),
                    //     w14,
                    //     SizedBox(
                    //         width: 13.w,
                    //         child: Text(
                    // controller.toolDetailsModel2!.data
                    //     .transferInLog[index].transferredQty,
                    //           style: header11,
                    //           overflow: TextOverflow.ellipsis,
                    //         )),
                    //     w12,
                    //     GestureDetector(
                    // onTap: () {
                    //   Get.defaultDialog(
                    //     title: "Remarks",
                    //     middleTextStyle: header11,
                    //     middleText: controller.toolDetailsModel2!
                    //         .data.transferInLog[index].remarks,
                    //   );
                    // },
                    //       child: billRemarks(),
                    //     )
                    //   ],
                    // );
                  },
                ),
      init: OwntoolInnerController(),
    );
  }
}
