import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/project_daily_note/views/updatedailynote.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common2date.dart';
import '../../../../common_widegt/deletedialoge.dart';
import '../../../../common_widegt/loading.dart';
import '../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/project_daily_note_controller.dart';
import 'add_dailynote.dart';

class ProjectDailyNoteView extends GetView<ProjectDailyNoteController> {
  ProjectDailyNoteView({Key? key}) : super(key: key);
  @override
  ProjectDailyNoteController controller = Get.put(ProjectDailyNoteController());
  @override
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h2,
              ProjectNameTitile(
                projectName: controller.argumnetData["workname"] ?? "yjyt",
                screenTitile: "Daily Notes",
                onTap: () {
                  Get.to(() => ProjectAddDayilyNote());
                },
              ),
              h2,
              Common2Date(
                ontap: () {
                  controller.filterAndCalculate();
                  controller.change();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  // controller.filteringDates();
                  controller.filterAndCalculate();
                  controller.update();
                  print("<--------------------------");
                },
              ),
              h4,
              GetBuilder<ProjectDailyNoteController>(
                builder: (controller) => Obx(
                  () => controller.dayilnoteloading.value
                      ? Column(
                          children: [
                            h5,
                            Center(child: loadingthreebounce),
                          ],
                        )
                      : controller.filteredList.length == 0
                          ? Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            )
                          : Expanded(
                              child: ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.dayilNoteModel!.data!.length,
                                itemBuilder: (context, index) {
                                  if (dateFormat
                                              .parse(controller.dayilNoteModel!
                                                  .data![index].createdDate)
                                              .compareTo(DateTime.parse(
                                                  controller.startDateController
                                                      .text)) >=
                                          0 &&
                                      dateFormat
                                              .parse(controller.dayilNoteModel!
                                                  .data![index].createdDate)
                                              .compareTo(DateTime.parse(
                                                  controller.endDateController
                                                      .text)) <=
                                          0) {
                                    log("${controller.dayilNoteModel!.data![index].createdDate}-------");
                                    return ListTIle(index: index);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ),
                ),
                init: ProjectDailyNoteController(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class ListTIle extends StatelessWidget {
//   ListTIle({
//     super.key,
//     required this.index,
//   });
//   ProjectDailyNoteController controller = Get.put(ProjectDailyNoteController());
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         infoDialoge(context, controller.dayilNoteModel!.data[index].title,
//             controller.dayilNoteModel!.data[index].description);
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 2.h),
//         padding: EdgeInsets.symmetric(horizontal: 2.h),
//         height: 10.h,
//         width: 100.w,
//         decoration: BoxDecoration(
//             color: bColor, borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: 65.w,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     controller.dayilNoteModel!.data[index].title,
//                     style: wheader13.copyWith(fontSize: 17),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   h1,
//                   Text(
//                       DateFormat('dd MMM yyyy').format(
//                         DateFormat('dd-MM-yyyy').parse(
//                           controller.dayilNoteModel!.data[index].createdDate ??
//                               "",
//                         ),
//                       ),
//                       style: wheader11),
//                 ],
//               ),
//             ),
//             controller.dayilNoteModel!.data[index].createdDate.toString() ==
//                     DateFormat("dd-MM-y").format(DateTime.now()).toString()
//                 ? PopupMenuButton<String>(
//                     onSelected: (value) {
//                       if (value == "edit") {
//                         controller.titleController.text = controller
//                             .dayilNoteModel!.data[index].title
//                             .toString();
//                         controller.descriptionController.text = controller
//                             .dayilNoteModel!.data[index].description
//                             .toString();
//                         Get.to(() => UpdateProjectDailyNotd(), arguments: {
//                           "noteId":
//                               controller.dayilNoteModel!.data[index].noteId
//                         });
//                       } else if (value == "delete") {
//                         expDelete(context, index, () async {
//                           controller.deleteNote(
//                               controller.dayilNoteModel!.data[index].noteId,
//                               controller.argumnetData["workid"]);
//                         });
//                       } else {
//                         log("===============================");
//                       }
//                     },
//                     icon: const Icon(
//                       Icons.more_vert_outlined,
//                       color: Colors.white,
//                     ),
//                     surfaceTintColor: Colors.white,
//                     itemBuilder: (context) {
//                       return [
//                         PopupMenuItem(
//                             value: "edit",
//                             padding: EdgeInsets.zero,
//                             child: Container(
//                               padding: EdgeInsets.only(left: 2.h),
//                               width: 28.w,
//                               height: 3.h,
//                               child: const Text(
//                                 "Edit",
//                               ),
//                             )),
//                         const PopupMenuItem(
//                             value: "delete", child: Text("Delete"))
//                       ];
//                     })
//                 : const SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
// }

class ListTIle extends StatelessWidget {
  ListTIle({
    super.key,
    required this.index,
  });
  final int index;
  ProjectDailyNoteController controller = Get.put(ProjectDailyNoteController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        infoDialoge(context, controller.dayilNoteModel!.data![index].title,
            controller.dayilNoteModel!.data![index].description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: bColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1.5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(indexs.toString()),
                w1,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.dayilNoteModel!.data![index].title,
                      style: wheader13.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                    h05,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                          DateFormat('dd MMM yyyy').format(
                            DateFormat('dd-MM-yyyy').parse(
                              controller.dayilNoteModel!.data![index]
                                      .createdDate ??
                                  "",
                            ),
                          ),
                          style: wheader11),
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
                        controller.titleController.text = controller
                            .dayilNoteModel!.data![index].title
                            .toString();
                        controller.descriptionController.text = controller
                            .dayilNoteModel!.data![index].description
                            .toString();
                        Get.to(() => UpdateProjectDailyNotd(), arguments: {
                          "noteId":
                              controller.dayilNoteModel!.data![index].noteId
                        });
                      } else if (value == "delete") {
                        expDelete(context, index, () async {
                          controller.deleteNote(
                              controller.dayilNoteModel!.data![index].noteId,
                              controller.argumnetData["workid"]);
                        });
                      } else {
                        log("===============================");
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
                            )),
                        const PopupMenuItem(
                            value: "delete", child: Text("Delete"))
                      ];
                    })
              ],
            ),

            // const Divider(
            //   color: Colors.white54,
            //   thickness: 1,
            //   endIndent: 10,
            // ),
          ),
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  final int firstCount;
  final String firstString;
  final int secondCount;
  final String secondString;
  final int thirdCount;
  final String thirdString;

  const StatusWidget({
    Key? key,
    required this.firstCount,
    required this.firstString,
    required this.secondCount,
    required this.secondString,
    required this.thirdCount,
    required this.thirdString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  firstString,
                  style: header10,
                ),
                h1,
                Text(
                  "$firstCount",
                  style: header14.copyWith(color: const Color(0xff18a900)),
                )
              ],
            ),
          ),
          const VerticalDivider(thickness: 2),
          Expanded(
            child: Column(
              children: [
                Text(
                  secondString,
                  style: header10,
                ),
                h1,
                Text(
                  "$secondCount",
                  style: header14.copyWith(color: const Color(0xffe7b400)),
                )
              ],
            ),
          ),
          const VerticalDivider(thickness: 2),
          Expanded(
            child: Column(
              children: [
                Text(
                  thirdString,
                  style: header10,
                ),
                h1,
                Text(
                  "$thirdCount",
                  style: header14.copyWith(color: const Color(0xffe10000)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
