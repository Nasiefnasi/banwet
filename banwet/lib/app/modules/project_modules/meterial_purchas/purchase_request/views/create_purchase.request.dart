// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/editedialoge.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/purchase_request_controller.dart';
import 'component/index.dart';

// ignore: must_be_immutable
class CreatePurchaseRequest extends GetView<PurchaseRequestController> {
  @override
  PurchaseRequestController controller = Get.put(PurchaseRequestController());

  CreatePurchaseRequest({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Create Purchase Request",
            style: header15,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
                controller.postemetrislList.clear();
                controller.metrialList.clear();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<PurchaseRequestController>(
          builder: (controller) =>
              controller.requestModel == null ||
                      controller.requestCatModel == null
                  ? loadingthreebounce
                  : Column(
                      children: [
                        h3,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    addMaterials(context);
                                  },
                                  child: const AddRquestContainer(
                                      text: 'Add Single Material')),
                              w1,
                              GestureDetector(
                                  onTap: () {
                                    addCategory(context);
                                  },
                                  child: const AddRquestContainer(
                                      text: 'Add From Category'))
                            ],
                          ),
                        ),
                        h2,
                        Obx(() => controller.metrialList.isEmpty
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
                                        style:
                                            wheader4.copyWith(fontSize: 11.sp)),
                                    SizedBox(
                                      width: 34.w,
                                    ),
                                    Text('Qty',
                                        style:
                                            wheader4.copyWith(fontSize: 11.sp)),
                                    // Text('Material',
                                    //     style: wheader4.copyWith(fontSize:11.sp,color: bColor)
                                    // ),
                                  ],
                                ),
                              )),
                        Obx(() => ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.metrialList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(right: 2.w),
                                  height: 7.h,
                                  width: 100.w,
                                  color: Colors.white,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                h1,
                                                h05,
                                                SizedBox(
                                                  width: 28.w,
                                                  child: Text(
                                                    controller
                                                        .metrialList[index].name
                                                        .toString(),
                                                    style: header4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text(
                                                  controller
                                                      .metrialList[index].qunit
                                                      .toString(),
                                                  style: header4.copyWith(
                                                      fontFamily: Bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              controller
                                                  .metrialList[index].qtext!,
                                              style: header4,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  editDialog(
                                                      context,
                                                      index,
                                                      controller
                                                          .metrialList[index]
                                                          .name,
                                                      controller
                                                          .metrialList[index]
                                                          .qtext,
                                                      controller
                                                          .postemetrislList[
                                                              index]
                                                          .description, () {
                                                    controller
                                                        .metrialList.canUpdate;
                                                  },
                                                      controller
                                                          .metrialList[index]
                                                          .qunit);
                                                },
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://cdn-icons-png.flaticon.com/512/1159/1159633.png",
                                                  color: Colors.black,
                                                  height: 3.h,
                                                  width: 5.w,
                                                  placeholder: (context, url) =>
                                                      const SizedBox(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                )
                                                //  cImage('https://cdn-icons-png.flaticon.com/512/1159/1159633.png')

                                                ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  // Get.defaultDialog(
                                                  //   backgroundColor: Colors.white,
                                                  //   radius:
                                                  //       10, // Dialog border radius
                                                  //   title: 'Delete',
                                                  //   titlePadding:
                                                  //       const EdgeInsets.all(16.0),
                                                  //   content: Column(
                                                  //     children: [
                                                  //       const Text(
                                                  //         'Are you sure you want to delete?',
                                                  //         textAlign:
                                                  //             TextAlign.center,
                                                  //         style: TextStyle(
                                                  //             color:
                                                  //                 Colors.black38),
                                                  //       ),
                                                  //       h5,
                                                  //       Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment
                                                  //                 .spaceEvenly,
                                                  //         children: [
                                                  //           ElevatedButton(
                                                  //             onPressed: () {
                                                  //               Get.back();
                                                  //               controller
                                                  //                   .metrialList
                                                  //                   .removeAt(
                                                  //                       index);
                                                  //               controller
                                                  //                   .postemetrislList
                                                  //                   .removeAt(
                                                  //                       index);
                                                  //             },
                                                  //             child: const Text(
                                                  //               'Delete',
                                                  //               style: TextStyle(
                                                  //                   color:
                                                  //                       Colors.red),
                                                  //             ),
                                                  //             style: ButtonStyle(
                                                  //               elevation:
                                                  //                   WidgetStatePropertyAll(
                                                  //                       0),
                                                  //               backgroundColor:
                                                  //                   WidgetStateProperty
                                                  //                       .all(Colors
                                                  //                           .white),
                                                  //               // foregroundColor:
                                                  //               //     WidgetStateProperty
                                                  //               //         .all(Colors
                                                  //               //             .white),
                                                  //               shape:
                                                  //                   WidgetStateProperty
                                                  //                       .all(
                                                  //                 RoundedRectangleBorder(
                                                  //                   borderRadius:
                                                  //                       BorderRadius
                                                  //                           .circular(
                                                  //                               12), // Button border radius
                                                  //                 ),
                                                  //               ),
                                                  //               padding: WidgetStateProperty.all(
                                                  //                   const EdgeInsets
                                                  //                       .symmetric(
                                                  //                       horizontal:
                                                  //                           20,
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
                                                  //                   color: Colors
                                                  //                       .grey),
                                                  //             ),
                                                  //             style: ButtonStyle(
                                                  //               elevation:
                                                  //                   WidgetStatePropertyAll(
                                                  //                       0),
                                                  //               backgroundColor:
                                                  //                   WidgetStateProperty
                                                  //                       .all(Colors
                                                  //                           .white),
                                                  //               foregroundColor:
                                                  //                   WidgetStateProperty
                                                  //                       .all(Colors
                                                  //                           .white),
                                                  //               shape:
                                                  //                   WidgetStateProperty
                                                  //                       .all(
                                                  //                 RoundedRectangleBorder(
                                                  //                   borderRadius:
                                                  //                       BorderRadius
                                                  //                           .circular(
                                                  //                               12), // Button border radius
                                                  //                 ),
                                                  //               ),
                                                  //               padding: WidgetStateProperty.all(
                                                  //                   const EdgeInsets
                                                  //                       .symmetric(
                                                  //                       horizontal:
                                                  //                           20,
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

                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder: (BuildContext
                                                                    context,
                                                                StateSetter
                                                                    setState) {
                                                          return SizedBox(
                                                            //  height:80.h,
                                                            width: 100.w,
                                                            child: SimpleDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15)),
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                titlePadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                children: [
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            2.h,
                                                                        horizontal:
                                                                            2.h),
                                                                    // height: 25.h,
                                                                    width:
                                                                        100.w,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        h1,
                                                                        SvgPicture
                                                                            .asset(
                                                                          "assets/images/delete.svg",
                                                                          width:
                                                                              5.w,
                                                                          height:
                                                                              5.h,
                                                                        ),
                                                                        h1,
                                                                        Text(
                                                                          "Warning",
                                                                          style:
                                                                              header15,
                                                                        ),
                                                                        h1,
                                                                        Text(
                                                                          "Do you Want Delete?",
                                                                          style:
                                                                              header10.copyWith(color: const Color.fromARGB(255, 139, 131, 131)),
                                                                        ),
                                                                        const Divider(
                                                                          thickness:
                                                                              1,
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5.h,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    Get.back();
                                                                                    controller.metrialList.removeAt(index);
                                                                                    controller.postemetrislList.removeAt(index);

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
                                                                                    style: header12.copyWith(color: Colors.black),
                                                                                  )),
                                                                                  //  ),
                                                                                ),
                                                                              ),
                                                                              const VerticalDivider(
                                                                                thickness: 1,
                                                                                color: Colors.black26,
                                                                                endIndent: 5,
                                                                                indent: 2,
                                                                              ),
                                                                              Expanded(
                                                                                child: InkWell(
                                                                                  onTap: () {
                                                                                    return Get.back();
                                                                                  },
                                                                                  child: Center(
                                                                                    child: InkWell(
                                                                                      onTap: () {
                                                                                        return Get.back();
                                                                                      },
                                                                                      // child: Container(
                                                                                      //   height: 4.h,
                                                                                      //   width: 30.w,
                                                                                      //   decoration: BoxDecoration(
                                                                                      //       color: bColor,
                                                                                      //       borderRadius: BorderRadius.circular(13)),
                                                                                      //   child: Center(
                                                                                      child: Text(
                                                                                        'No',
                                                                                        style: header12.copyWith(color: Colors.black),
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
                                                child: const Icon(
                                                  Icons.delete,
                                                ))
                                          ],
                                        ),
                                        //    Text('Item $item', style: textStyle),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 0.1.h,
                                );
                              },
                            )),
                        h3,
                        Obx(() => controller.metrialList.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 2.h),
                                child: SubmitButtons(
                                  onTap: () {
                                    if (controller
                                        .postemetrislList.isNotEmpty) {
                                      controller.createPurchaseRequest();
                                    }
                                  },
                                  text: "Submit",
                                  isLoading: controller.isLoading,
                                ),
                              )
                            : const SizedBox()),
                      ],
                    ),
        ));
  }
}
