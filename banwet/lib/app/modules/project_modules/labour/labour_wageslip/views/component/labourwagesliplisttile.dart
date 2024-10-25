import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../controllers/labour_wageslip_controller.dart';

class LabourWageSlip extends GetView<LabourWageslipController> {
  LabourWageSlip(this.index, {super.key});
  @override
  final int index;
  @override
  LabourWageslipController controller = Get.put(LabourWageslipController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 1.h),
      // height: 14.h,
      width: 100.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: bColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          w2,
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32.w,
                child: Text(
                  controller.wageSlipModel!.data![index].labourName ?? "",
                  style: wheader11.copyWith(fontFamily: regular),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                controller.wageSlipModel!.data![index].work_type ?? "",
                style: wheader10.copyWith(fontFamily: regular, fontSize: 9.sp),
              ),
              h1,
              RichText(
                  text: TextSpan(
                      text: "Worked On : ",
                      style: wheader10.copyWith(fontSize: 12),
                      children: [
                    TextSpan(
                        text: controller.wageSlipModel!.data![index].workDate ??
                            "",
                        style: wheader10.copyWith(fontSize: 10.sp))
                  ])),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  print(controller.wageSlipModel!.data![index].noOfDays);
                },
                child: Container(
                  height: 25,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF8F8F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      controller.wageSlipModel!.data![index].noOfDays == .5
                          ? "Half Day"
                          : "Full Day",
                      style: header10.copyWith(
                          fontSize: 12,
                          fontFamily: Medium,
                          color:
                              controller.wageSlipModel!.data![index].noOfDays ==
                                      .5
                                  ? Colors.orange
                                  : const Color.fromARGB(255, 19, 177, 29)),
                    ),
                  ),
                ),
              ),
              w1,
              controller.wageSlipModel!.data![index].createdDate.toString() ==
                      DateFormat("dd-MM-y").format(DateTime.now()).toString()
                  ? PopupMenuButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      itemBuilder: (context) {
                        return [
                          // PopupMenuItem(
                          //     padding: EdgeInsets.zero,
                          //     onTap: () {},
                          //     child: GestureDetector(
                          //         onTap: () {},
                          //         child: Container(
                          //           padding: EdgeInsets.only(left: 2.h),
                          //           width: 28.w,
                          //           height: 3.h,
                          //           child: const Text(
                          //             "Edit",
                          //           ),
                          //         ))),
                          PopupMenuItem(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return SizedBox(
                                          //  height:80.h,
                                          width: 100.w,
                                          child: SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              contentPadding: EdgeInsets.zero,
                                              titlePadding: EdgeInsets.zero,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.h,
                                                      horizontal: 2.h),
                                                  // height: 25.h,
                                                  width: 100.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      h1,
                                                      SvgPicture.asset(
                                                        "assets/images/delete.svg",
                                                        width: 5.w,
                                                        height: 5.h,
                                                      ),
                                                      h1,
                                                      Text(
                                                        "Warning",
                                                        style: header15,
                                                      ),
                                                      h1,
                                                      Text(
                                                        "Do you Want Delete?",
                                                        style: header10.copyWith(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                139, 131, 131)),
                                                      ),
                                                      const Divider(
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  Get.back();
                                                                  controller
                                                                      .getLabourWageList();

                                                                  controller.wageslipdelet(controller
                                                                      .wageSlipModel!
                                                                      .data![
                                                                          index]
                                                                      .wageId
                                                                      .toString());
                                                                  // controller
                                                                  // .getLabourWageList();
                                                                  // controller
                                                                  //     .filteredList
                                                                  //     .value
                                                                  //     .removeAt(
                                                                  //         index);
                                                                  controller
                                                                      .wageSlipModel!
                                                                      .data!
                                                                      .removeAt(
                                                                          index);
                                                                },
                                                                // child: Container(
                                                                //   height: 4.h,
                                                                //   width: 30.w,
                                                                //   decoration: BoxDecoration(
                                                                //       color: bColor,
                                                                //       borderRadius: BorderRadius.circular(13)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'Yes',
                                                                  style: header12
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                )),
                                                                //  ),
                                                              ),
                                                            ),
                                                            const VerticalDivider(
                                                              thickness: 1,
                                                              color: Colors
                                                                  .black26,
                                                              endIndent: 5,
                                                              indent: 2,
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  return Get
                                                                      .back();
                                                                },
                                                                child: Center(
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    // child: Container(
                                                                    //   height: 4.h,
                                                                    //   width: 30.w,
                                                                    //   decoration: BoxDecoration(l
                                                                    //       color: bColor,
                                                                    //       borderRadius: BorderRadius.circular(13)),
                                                                    //   child: Center(
                                                                    child: Text(
                                                                      'No',
                                                                      style: header12.copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                      // )
                                                                      //),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        );
                                      });
                                    });
                              },
                              value: 1,
                              child: const Text("Delete"))
                        ];
                      })
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
