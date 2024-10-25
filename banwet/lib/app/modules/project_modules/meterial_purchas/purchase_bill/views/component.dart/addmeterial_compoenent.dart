import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/editedialoge.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../../controllers/purchase_bill_controller.dart';
import '../addpurchase_bill.dart';
import 'addcategorydialog.bill.dart';
import 'index.dart';

class AddMetrialComponent extends GetView<PurchaseBillController> {
  @override
  PurchaseBillController controller = Get.put(PurchaseBillController());
  @override
  AddMetrialComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addMaterial(context);
                          },
                          child: addMertialWidegt("Add Single Meterial"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            addCategoryDialogeBill(context);
                          },
                          child: addMertialWidegt("Add From Category"),
                        ),
                      )
                    ],
                  ),
                ),
                h2,
                controller.postemetrislList.isEmpty
                    ? const SizedBox()
                    : Container(
                        height: 5.h,
                        width: 100.w,
                        color: bColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 6.8.w,
                            ),
                            Text('Material',
                                style: wheader4.copyWith(fontSize: 11.sp)),
                            SizedBox(
                              width: 34.w,
                            ),
                            Text('Qty',
                                style: wheader4.copyWith(fontSize: 11.sp)),
                            // Text('Material',
                            //     style: wheader4.copyWith(fontSize:11.sp,color: bColor)
                            // ),
                          ],
                        ),
                      ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(right: 2.w),
                        height: 7.h,
                        width: 100.w,
                        color: Colors.white,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/4693/4693937.png',
                                    height: 5.h,
                                    width: 5.w,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  SizedBox(
                                    width: 28.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        h1,
                                        h05,
                                        Text(
                                          controller.metrialList[index].name
                                              .toString(),
                                          style: header4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          controller.metrialList[index].qunit
                                              .toString(),
                                          style: header4.copyWith(
                                              fontFamily: Bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.metrialList[index].qtext
                                        .toString(),
                                    style: header4,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      billeditDialog(
                                        context,
                                        index,
                                        controller.metrialList[index].name,
                                        controller.metrialList[index].qtext,
                                        controller
                                            .postemetrislList[index].unitPrice
                                            .toString(),
                                        controller.metrialList[index].taxPer
                                            .toString(),
                                        controller.postemetrislList[index]
                                            .description,
                                        controller.metrialList[index].totalAmt,
                                      );
                                    },
                                    child: Image.network(
                                      'https://cdn-icons-png.flaticon.com/512/1159/1159633.png',
                                      height: 5.h,
                                      width: 5.w,
                                      //   color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    titlePadding:
                                                        EdgeInsets.zero,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2.h,
                                                                horizontal:
                                                                    2.h),
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
                                                                      .fromARGB(
                                                                      255,
                                                                      139,
                                                                      131,
                                                                      131)),
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
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        Get.back();
                                                                        controller
                                                                            .postemetrislList
                                                                            .removeAt(index);
                                                                        controller
                                                                            .metrialList
                                                                            .removeAt(index);
                                                                        controller
                                                                            .calculateTotalAmount();
                                                                        // Get.back();
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
                                                                        style: header12.copyWith(
                                                                            color:
                                                                                Colors.black),
                                                                      )),
                                                                      //  ),
                                                                    ),
                                                                  ),
                                                                  const VerticalDivider(
                                                                    color: Colors
                                                                        .black26,
                                                                    endIndent:
                                                                        5,
                                                                    indent: 2,
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        return Get
                                                                            .back();
                                                                      },
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Get.back();
                                                                          },
                                                                          // child: Container(
                                                                          //   height: 4.h,
                                                                          //   width: 30.w,
                                                                          //   decoration: BoxDecoration(
                                                                          //       color: bColor,
                                                                          //       borderRadius: BorderRadius.circular(13)),
                                                                          //   child: Center(
                                                                          child:
                                                                              Text(
                                                                            'No',
                                                                            style:
                                                                                header12.copyWith(color: Colors.black),
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

                                      //                                 showDialog(
                                      // context: context,
                                      // builder: (BuildContext context) {
                                      //   return SizedBox(
                                      //     //  height:80.h,
                                      //     width: 100.w,
                                      //     child: AlertDialog(
                                      //         shape: RoundedRectangleBorder(
                                      //             borderRadius: BorderRadius.circular(15)),
                                      //         contentPadding: EdgeInsets.zero,
                                      //         titlePadding: EdgeInsets.zero,
                                      //         actions: [
                                      //           Container(
                                      //             decoration: BoxDecoration(
                                      //                 color: Colors.white,
                                      //                 borderRadius: BorderRadius.circular(15)),
                                      //             padding: EdgeInsets.all(2.h),
                                      //             height: 30.h,
                                      //             width: 100.w,
                                      //             child: Column(
                                      //               crossAxisAlignment: CrossAxisAlignment.center,
                                      //               children: [
                                      //                 Icon(
                                      //                   Icons.delete,
                                      //                   size: 23.sp,
                                      //                   color: Colors.black,
                                      //                 ),
                                      //                 h1,
                                      //                 Text(
                                      //                   "Warning",
                                      //                   style: header12,
                                      //                 ),
                                      //                 h1,
                                      //                 Text(
                                      //                   "Do you Want Delete",
                                      //                   style: header12,
                                      //                 ),
                                      //                 h2,
                                      //                 Row(
                                      //                   mainAxisAlignment: MainAxisAlignment.center,
                                      //                   children: [
                                      //                     GestureDetector(
                                      //                       onTap: () async {

                                      //                         controller.postemetrislList
                                      //                                                   .removeAt(index);
                                      //                                               controller.metrialList
                                      //                                                   .removeAt(index);
                                      //                                               controller
                                      //                                                   .calculateTotalAmount();
                                      //                       },
                                      //                       child: Container(
                                      //                         height: 4.h,
                                      //                         width: 30.w,
                                      //                         decoration: BoxDecoration(
                                      //                             color: bColor,
                                      //                             borderRadius: BorderRadius.circular(13)),
                                      //                         child: Center(
                                      //                             child: Text(
                                      //                           'Yes',
                                      //                           style: header12.copyWith(color: Colors.white),
                                      //                         )),
                                      //                       ),
                                      //                     ),
                                      //                     w2,
                                      //                     GestureDetector(
                                      //                       onTap: () { Get.back();},
                                      //                       child: Container(
                                      //                         height: 4.h,
                                      //                         width: 30.w,
                                      //                         decoration: BoxDecoration(
                                      //                             color: bColor,
                                      //                             borderRadius: BorderRadius.circular(13)),
                                      //                         child: Center(
                                      //                             child: Text(
                                      //                           'No',
                                      //                           style: header12.copyWith(color: Colors.white),
                                      //                         )),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ]),
                                      //   );
                                      // });

                                      // Get.defaultDialog(
                                      //   backgroundColor: Colors.white,
                                      //   radius: 10, // Dialog border radius
                                      //   title: 'Delete',
                                      //   titlePadding:
                                      //       const EdgeInsets.all(16.0),
                                      //   content: Column(
                                      //     children: [
                                      //       const Text(
                                      //         'Are you sure you want to delete?',
                                      //         textAlign: TextAlign.center,
                                      //         style: TextStyle(
                                      //             color: Colors.black38),
                                      //       ),
                                      //       h5,
                                      //       Row(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.spaceEvenly,
                                      //         children: [
                                      //           ElevatedButton(
                                      //             onPressed: () {
                                      //               controller.postemetrislList
                                      //                   .removeAt(index);
                                      //               controller.metrialList
                                      //                   .removeAt(index);
                                      //               controller
                                      //                   .calculateTotalAmount();
                                      //               // Get.back();
                                      //               // controller.postemetrislList
                                      //               //     .removeAt(index);
                                      //               // controller.metrialList
                                      //               //     .removeAt(index);
                                      //               // controller
                                      //               //     .metrialList
                                      //               //     .removeAt(
                                      //               //         index);
                                      //               // controller
                                      //               //     .postemetrislList
                                      //               //     .removeAt(
                                      //               //         index);
                                      //             },
                                      //             child: const Text(
                                      //               'Delete',
                                      //               style: TextStyle(
                                      //                   color: Colors.red),
                                      //             ),
                                      //             style: ButtonStyle(
                                      //               elevation:
                                      //                   WidgetStatePropertyAll(
                                      //                       0),
                                      //               backgroundColor:
                                      //                   WidgetStateProperty.all(
                                      //                       Colors.white),
                                      //               // foregroundColor:
                                      //               //     WidgetStateProperty
                                      //               //         .all(Colors
                                      //               //             .white),
                                      //               shape:
                                      //                   WidgetStateProperty.all(
                                      //                 RoundedRectangleBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           12), // Button border radius
                                      //                 ),
                                      //               ),
                                      //               padding: WidgetStateProperty
                                      //                   .all(const EdgeInsets
                                      //                       .symmetric(
                                      //                       horizontal: 20,
                                      //                       vertical:
                                      //                           12)), // Button padding
                                      //             ),
                                      //           ),
                                      //           ElevatedButton(
                                      //             onPressed: () {
                                      //               Get.back(); // Close the dialog
                                      //             },
                                      //             child: const Text(
                                      //               'Cancel',
                                      //               style: TextStyle(
                                      //                   color: Colors.grey),
                                      //             ),
                                      //             style: ButtonStyle(
                                      //               elevation:
                                      //                   WidgetStatePropertyAll(
                                      //                       0),
                                      //               backgroundColor:
                                      //                   WidgetStateProperty.all(
                                      //                       Colors.white),
                                      //               foregroundColor:
                                      //                   WidgetStateProperty.all(
                                      //                       Colors.white),
                                      //               shape:
                                      //                   WidgetStateProperty.all(
                                      //                 RoundedRectangleBorder(
                                      //                   borderRadius:
                                      //                       BorderRadius.circular(
                                      //                           12), // Button border radius
                                      //                 ),
                                      //               ),
                                      //               padding: WidgetStateProperty
                                      //                   .all(const EdgeInsets
                                      //                       .symmetric(
                                      //                       horizontal: 20,
                                      //                       vertical:
                                      //                           12)), // Button padding
                                      //             ),
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      //   barrierDismissible:
                                      //       false, // Prevents closing the dialog by tapping outside
                                      // );

                                      // controller.postemetrislList
                                      //     .removeAt(index);
                                      // controller.metrialList.removeAt(index);
                                      // controller.calculateTotalAmount();
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                    ),
                                  )
                                ],
                              ),
                              //    Text('Item $item', style: textStyle),
                            ],
                          ),
                        ),
                      );
                    },
                    // separatorBuilder: (context, index) => const SizedBox(
                    //       height: 10,
                    //     ),
                    itemCount: controller.metrialList.length),
                h3,
                controller.metrialList.isEmpty
                    ? const SizedBox()
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.0.h),
                        height: 7.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 193, 190, 190)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //     border: Border.all(color: Colors.black54)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Gross Amount",
                                style: TextStyle(
                                    fontSize: 11, fontFamily: regular)),
                            w1,
                            Obx(
                              () => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("₹  ",
                                      style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(
                                    controller.totalGrossAmounts.value
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 12.5.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                h3,
                controller.metrialList.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0.h),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: SubmitButton(
                                    onTap: () {
                                      controller.activeStep.value = 0;
                                    },
                                    text: "Previous")),
                            w3,
                            Expanded(
                                child: SubmitButton(
                                    onTap: () {
                                      controller.activeStep.value = 2;
                                    },
                                    text: "Continue"))
                          ],
                        ),
                      )
              ],
            )
          ],
        ));
  }
}
