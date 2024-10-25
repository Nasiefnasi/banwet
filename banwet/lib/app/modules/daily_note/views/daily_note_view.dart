import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/daily_note/views/updatedailynote.dart';
import 'package:banwet/app/modules/office_expense/views/office_expense_view.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common2date.dart';
import '../../../common_widegt/common_header.dart';
import '../../../common_widegt/deletedialoge.dart';
import '../../../common_widegt/loading.dart';
// import '../../../common_widegt/submitpage.dart';
import '../controllers/daily_note_controller.dart';
import 'add_dailynote.dart';

class DailyNoteView extends GetView<DailyNoteController> {
  DailyNoteView({Key? key}) : super(key: key);
  @override
  DailyNoteController controller = Get.put(DailyNoteController());
  @override
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            h2,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                children: [
                  CommonTitile(
                    text: 'Daily Note',
                    onpress: () {
                      Get.to(() {
                        controller.clear();
                        return AddDayilyNote();
                      });
                    },
                  ),
                  //h2,

                  // Common2Date(
                  //   ontap: () {
                  //     controller.change();
                  //     controller.filteringData();
                  //   },
                  //   statDate: controller.startDateController,
                  //   endDate: controller.endDateController,
                  //   startDateValue: controller.startDate,
                  //   endDateValue: controller.endDate,
                  //   onPressed: () {
                  //     controller.filteringData();
                  //     // controller.filteringDates();
                  //     controller.update();
                  //     print("<--------------------------");
                  //   },
                  // ),
                  HomeDate(
                    startdatesout: (p0) async {
                      controller.startdate = p0;
                      await controller.filteringData();
                      controller.update();
                    },
                    entdatesout: (p0) async {
                      controller.enddate = p0;
                      await controller.filteringData();
                      controller.update();
                    },
                    startontap: (po) async {
                      await controller.filteringData();
                      controller.update();
                      // controller.startdate = po;
                      // await controller.filteringData();
                    },
                    ontap: () async {
                      await controller.filteringData();
                      controller.update();
                      // await controller.filteringData();

                      // controller.update();
                      controller.change();
                    },
                    statDate: controller.startDateController,
                    endDate: controller.endDateController,
                    startDateValue: controller.startDate,
                    endDateValue: controller.endDate,
                    onPressed: () async {
                      controller.filteringData();
                      // controller.filteringDates();
                      controller.update();
                      print("<--------------------------");
                    },
                  ),
                  h4,
                  Obx(
                    () => controller.isShow.value
                        ? Center(child: loadingthreebounce)
                        : controller.filterList.value.length == 0
                            ? const BottomNavBarSearchingIcon(
                                bottombar: 3,
                              )
                            // Container(
                            //     height: MediaQuery.of(context).size.height * .6,
                            //     child: Center(
                            //       child: Lottie.asset(
                            //           repeat: false,
                            //           "assets/images/qrbRtDHknE.json",
                            //           height: 250),
                            //     ),
                            //   )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.filterList.value.length,
                                itemBuilder: (context, index) {
                                  log("=============== ${dateFormat.parse(controller.startDateController.text)}");
                                  // if (dateFormat
                                  //             .parse(controller.dayilNoteModel!
                                  //                 .data[index].createdDate)
                                  //             .compareTo(DateTime.parse(
                                  //                 controller.startDateController
                                  //                     .text)) >=
                                  //         0 &&
                                  //     dateFormat
                                  //             .parse(controller.dayilNoteModel!
                                  //                 .data[index].createdDate)
                                  //             .compareTo(DateTime.parse(
                                  //                 controller.endDateController
                                  //                     .text)) <=
                                  //         0) {
                                  log(controller.filterList[index].createdDate);
                                  return DailyNoteIteamCard(index: index);
                                  // } else {
                                  //   return const SizedBox();
                                  // }
                                },
                              ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class DailyNoteIteamCard extends StatelessWidget {
  DailyNoteIteamCard({
    super.key,
    required this.index,
  });
  final int index;
  DailyNoteController controller = Get.put(DailyNoteController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        infoDialoge(context, controller.filterList[index].title,
            controller.filterList[index].description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: bColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(indexs.toString()),
                w1,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.filterList[index].title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: Medium,
                          fontSize: 12.sp),
                    ),
                    h05,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        "Created Date : ${controller.filterList[index].createdDate}",
                        style: TextStyle(
                            fontFamily: SemiBold,
                            color: Colors.white,
                            fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // PopupMenuButton<String>(
                //   padding: const EdgeInsets.only(top: 10, left: 25),
                //   onSelected: (value) async {
                //     if (value == "edit") {
                //       controller.title.text = await data.createdBy.toString();
                //       controller.description.text =
                //           await data.description.toString();

                //       Get.to(EditActivites(
                //         taskid: data.taskId,
                //         // description: data.description,
                //         // title: data.createdBy,
                //         activityids: data.activityId.toString(),
                //       ));
                //     } else if (value == "delete") {
                //       showDialog(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return StatefulBuilder(builder:
                //                 (BuildContext context, StateSetter setState) {
                //               return SizedBox(
                //                 //  height:80.h,
                //                 width: 100.w,
                //                 child: SimpleDialog(
                //                     shape: RoundedRectangleBorder(
                //                         borderRadius:
                //                             BorderRadius.circular(15)),
                //                     contentPadding: EdgeInsets.zero,
                //                     titlePadding: EdgeInsets.zero,
                //                     children: [
                //                       Container(
                //                         decoration: BoxDecoration(
                //                             color: Colors.white,
                //                             borderRadius:
                //                                 BorderRadius.circular(15)),
                //                         padding: EdgeInsets.symmetric(
                //                             vertical: 2.h, horizontal: 2.h),
                //                         // height: 25.h,
                //                         width: 100.w,
                //                         child: Column(
                //                           crossAxisAlignment:
                //                               CrossAxisAlignment.center,
                //                           children: [
                //                             h1,
                //                             SvgPicture.asset(
                //                               "assets/images/delete.svg",
                //                               width: 5.w,
                //                               height: 5.h,
                //                             ),
                //                             h1,
                //                             Text(
                //                               "Warning",
                //                               style: header15,
                //                             ),
                //                             h1,
                //                             Text(
                //                               "Do you Want Delete?",
                //                               style: header10.copyWith(
                //                                   color: const Color.fromARGB(
                //                                       255, 139, 131, 131)),
                //                             ),
                //                             const Divider(
                //                               thickness: 1,
                //                             ),
                //                             SizedBox(
                //                               height: 5.h,
                //                               child: Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                                   Expanded(
                //                                     child: InkWell(
                //                                       onTap: () async {
                //                                         controller1
                //                                             .postdeleteactivities(data
                //                                                 .activityId
                //                                                 .toString());
                //                                         Get.back();
                //                                         await details
                //                                             .activities!
                //                                             .removeAt(indexs);
                //                                         // Get.back();
                //                                       },

                //                                       child: Center(
                //                                           child: Text(
                //                                         'Yes',
                //                                         style:
                //                                             header12.copyWith(
                //                                                 color: Colors
                //                                                     .black),
                //                                       )),
                //                                       //  ),
                //                                     ),
                //                                   ),
                //                                   const VerticalDivider(
                //                                     thickness: 1,
                //                                     color: Colors.black26,
                //                                     endIndent: 5,
                //                                     indent: 2,
                //                                   ),
                //                                   Expanded(
                //                                     child: InkWell(
                //                                       onTap: () {
                //                                         return Get.back();
                //                                       },
                //                                       child: Center(
                //                                         child: InkWell(
                //                                           onTap: () {
                //                                             Get.back();
                //                                           },
                //                                           // child: Container(
                //                                           //   height: 4.h,
                //                                           //   width: 30.w,
                //                                           //   decoration: BoxDecoration(
                //                                           //       color: bColor,
                //                                           //       borderRadius: BorderRadius.circular(13)),
                //                                           //   child: Center(
                //                                           child: Text(
                //                                             'No',
                //                                             style: header12
                //                                                 .copyWith(
                //                                                     color: Colors
                //                                                         .black),
                //                                             // )
                //                                             //),
                //                                           ),
                //                                         ),
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ]),
                //               );
                //             });
                //           });
                //     }
                //   },
                //   icon: const Icon(
                //     Icons.more_vert_outlined,
                //     color: Colors.white,
                //   ),
                //   surfaceTintColor: Colors.white,
                //   itemBuilder: (context) {
                //     return [
                //       PopupMenuItem(
                //         value: "edit",
                //         padding: EdgeInsets.zero,
                //         child: Container(
                //           padding: EdgeInsets.only(left: 2.h),
                //           width: 28.w,
                //           height: 3.h,
                //           child: const Text("Edit"),
                //         ),
                //       ),
                //       const PopupMenuItem(
                //         value: "delete",
                //         child: Text("Delete"),
                //       ),
                //     ];
                //   },
                // ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "edit") {
                      Get.to(() => UpdateDailyNotd(), arguments: {
                        "noteid": controller.filterList[index].noteId.toString()
                      });
                      controller.descriptionController.text =
                          controller.filterList[index].description;
                      controller.titleController.text =
                          controller.filterList[index].title;
                    } else {
                      expDelete(context, index, () async {
                        controller.delete(controller.filterList[index].noteId);
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                  surfaceTintColor: Colors.white,
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: "edit",
                        // padding: EdgeInsets.zero,
                        child: Text(
                          "Edit",
                        ),
                      ),
                      const PopupMenuItem(
                        value: "delete",
                        child: Text("Delete"),
                      ),
                    ];
                  },
                ),
              ],
            ),
            // h2
          ),
        ),
      ),
    );
  }
}

class ListTIle extends StatelessWidget {
  ListTIle({
    super.key,
    required this.index,
  });
  DailyNoteController controller = Get.put(DailyNoteController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        infoDialoge(context, controller.filterList[index].title,
            controller.filterList[index].description);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.only(left: 2.h, right: 0.h, top: 1.h, bottom: 1.h),
        // height: 8.h,
        // width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        controller.filterList[index].title,
                        style: wheader12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    w7,
                    w15,
                    controller.filterList[index].createdDate.toString() ==
                            DateFormat("dd-MM-y")
                                .format(DateTime.now())
                                .toString()
                        ? Center(
                            child: PopupMenuButton<String>(
                              onSelected: (value) {
                                if (value == "edit") {
                                  Get.to(() => UpdateDailyNotd(), arguments: {
                                    "noteid": controller
                                        .filterList[index].noteId
                                        .toString()
                                  });
                                  controller.descriptionController.text =
                                      controller.filterList[index].description;
                                  controller.titleController.text =
                                      controller.filterList[index].title;
                                } else {
                                  expDelete(context, index, () async {
                                    controller.delete(
                                        controller.filterList[index].noteId);
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.more_vert_outlined,
                                color: Colors.white,
                              ),
                              surfaceTintColor: Colors.white,
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: "edit",
                                    padding: EdgeInsets.zero,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 2.h),
                                      width: 28.w,
                                      height: 3.h,
                                      child: const Text(
                                        "Edit",
                                      ),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: "delete",
                                    child: Text("Delete"),
                                  ),
                                ];
                              },
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Text(
                  controller.filterList[index].createdDate,
                  style: wheader10,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            // controller.filterList[index].createdDate.toString() ==
            //         DateFormat("dd-MM-y").format(DateTime.now()).toString()
            //     ? Center(
            //         child: PopupMenuButton<String>(
            //           onSelected: (value) {
            //             if (value == "edit") {
            //               Get.to(() => UpdateDailyNotd(), arguments: {
            //                 "noteid":
            //                     controller.filterList[index].noteId.toString()
            //               });
            //               controller.descriptionController.text =
            //                   controller.filterList[index].description;
            //               controller.titleController.text =
            //                   controller.filterList[index].title;
            //             } else {
            //               expDelete(context, index, () async {
            //                 controller
            //                     .delete(controller.filterList[index].noteId);
            //               });
            //             }
            //           },
            //           icon: const Icon(
            //             Icons.more_vert_outlined,
            //             color: Colors.white,
            //           ),
            //           surfaceTintColor: Colors.white,
            //           itemBuilder: (context) {
            //             return [
            //               PopupMenuItem(
            //                 value: "edit",
            //                 padding: EdgeInsets.zero,
            //                 child: Container(
            //                   padding: EdgeInsets.only(left: 2.h),
            //                   width: 28.w,
            //                   height: 3.h,
            //                   child: const Text(
            //                     "Edit",
            //                   ),
            //                 ),
            //               ),
            //               const PopupMenuItem(
            //                 value: "delete",
            //                 child: Text("Delete"),
            //               ),
            //             ];
            //           },
            //         ),
            //       )
            //     : const SizedBox()
          ],
        ),
      ),
    );
  }
}
