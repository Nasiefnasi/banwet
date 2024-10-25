import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/data/model/taskmodel/selected_task_model.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/activitesdelete_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/addactivites_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/component/addactivitespage.dart';
import 'package:banwet/app/style/const.dart';

class SelectedTaskScreen extends GetView<SelectedTaskController> {
  SelectedTaskScreen({super.key, this.workname});
  String? workname;
  AddActivitiesController controllers = Get.put(AddActivitiesController());
  @override
  Widget build(BuildContext context) {
    RxInt statuscount = 0.obs;
    RxInt statusaddcount = 0.obs;
    statusaddcount.value = statuscount.value;
    var mediaquery = MediaQuery.of(context).size;
    String selectedStatus = "Pending";
    return Scaffold(
      body: GetBuilder<SelectedTaskController>(
        builder: (controller) {
          if (controller.selectedTaskModel == null) {
            return SafeArea(
                child: Center(
              child: loadingthreebounce,
            ));
          } else {
            var detalis = controller.selectedTaskModel;
            // statusaddcount.value = detalis?.taskStatus == "Pending"
            //     ? 1
            //     : detalis?.taskStatus == "Completed"
            //         ? 2
            //         : detalis?.taskStatus == "Progress"
            //             ? 3
            //             : 1;
            // statusaddcount.value = detalis?.taskStatus != "Pending" ? 0 : 2;
            return SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: bColor,
                    // borderRadius: const BorderRadius.vertical(
                    //     bottom: Radius.circular(10)),
                  ),
                  // color: bColor,
                  child: Column(
                    children: [
                      h2,
                      // h2,
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 30,
                              height: 30,
                              // color: Colors.amber,
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            w2,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    detalis?.title ?? 'Task',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontFamily: Medium,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    width: 57.w,
                                    child: Text(
                                      workname.toString(),
                                      style:
                                          header9.copyWith(color: Colors.white),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        detalis?.taskStatus ?? "",
                                        style: TextStyle(
                                          color:
                                              detalis?.taskStatus == "Pending"
                                                  ? Colors.red
                                                  : detalis?.taskStatus ==
                                                          "Completed"
                                                      ? Colors.green
                                                      : detalis?.taskStatus ==
                                                              "In Progress"
                                                          ? Colors.blue
                                                          : Colors.yellow,
                                        ),
                                        // ElevatedButton(
                                        //   onPressed: () {
                                        //     // if ("detalis?.taskStatus" ==
                                        //     //     "Pending") {
                                        //     //   statuscount.value = 0;
                                        //     //   // statusaddcount
                                        //     // } else if ("detalis?.taskStatus" ==
                                        //     //     "Completed") {
                                        //     //   statuscount.value = 1;
                                        //     // } else if ("Progress" ==
                                        //     //     "Progress") {
                                        //     //   statuscount.value = 2;
                                        //     // }
                                        //     if (statusaddcount.value <= 2) {
                                        //       statusaddcount.value++;
                                        //     } else {
                                        //       statusaddcount.value = 1;
                                        //     }
                                        //   },
                                        //   child: Text(
                                        //     detalis?.taskStatus.toString(),
                                        //     style: TextStyle(
                                        //         fontSize: 11.sp,
                                        //         fontFamily: Medium,
                                        //         color: statusaddcount.value == 1
                                        //             ? Colors.redAccent
                                        //             : statusaddcount.value == 2
                                        //                 ? Colors.green
                                        //                 : statusaddcount.value == 3
                                        //                     ? Colors.blue
                                        //                     : null),
                                        //   ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                // Default selected value
                                List<String> statusOptions = [
                                  "Pending",
                                  "Completed",
                                  "Progress",
                                ];

                                Get.defaultDialog(
                                  backgroundColor: Colors.white,
                                  radius: 7,
                                  titlePadding: const EdgeInsets.only(top: 10),
                                  title: "Status Update",
                                  titleStyle: TextStyle(
                                    fontFamily: Medium,
                                    fontSize: 15.sp,
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Column(
                                          children: [
                                            h2,
                                            DropdownButton<String>(
                                              menuMaxHeight: 150,
                                              // menuWidth: 200,

                                              value: selectedStatus,
                                              items: statusOptions
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedStatus = newValue!;
                                                });
                                              },
                                              isExpanded: true,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              dropdownColor: Colors.white,
                                            ),
                                            h5,
                                            SizedBox(
                                              width: mediaquery.width * .5,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      backgroundColor: bColor),
                                                  onPressed: () {
                                                    controller.postdailytask(
                                                        selectedStatus ==
                                                                "Pending"
                                                            ? 0
                                                            : selectedStatus ==
                                                                    "Completed"
                                                                ? 1
                                                                : selectedStatus ==
                                                                        "Progress"
                                                                    ? 2
                                                                    : 2,
                                                        detalis!.taskId
                                                            .toString());
                                                    Get.back();
                                                  },
                                                  child: const Text(
                                                    "Submit",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  // textConfirm: "Status Update",
                                  // titleStyle: const TextStyle(),
                                  // onConfirm: () {
                                  //   Get.back();
                                  //   print("Selected status: $selectedStatus");
                                  // },
                                );
                              },
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Image.asset(
                                      "assets/images/statusupdate.png",
                                      color: bColor,
                                    ),
                                  )),
                            ),
                            w3,
                            InkWell(
                              onTap: () {
                                controllers.clear();
                                Get.to(AddActivites(
                                  taskid: detalis!.taskId.toString(),
                                ));
                              },
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  color: bColor,
                                ),
                              ),
                            ),
                            w4,
                          ],
                        ),
                      ),
                      h1,
                    ],
                  ),
                ),
                h1,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5),
                  child: Container(
                      // height: 50,
                      child: TextFormField(
                    controller: TextEditingController(
                        text: detalis?.taskDescription ?? "Description"),
                    minLines: 1,
                    maxLines: 5,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: regular,
                        fontSize: 15,
                        overflow: TextOverflow.fade),
                    readOnly: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      // label: Text(
                      //   // maxLines: 3,

                      //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ),
                  )
                      //  const Text(
                      //   // maxLines: 3,

                      //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),
                      ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Activities",
                      style: TextStyle(fontSize: 16.sp, fontFamily: Medium)),
                ),
                Expanded(
                  child: GetBuilder<SelectedTaskController>(
                    builder: (controller) => controller
                                .selectedTaskModel!.activities!.length ==
                            0
                        ? Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          )
                        // controller
                        //         .selectedTaskModel==null
                        //     ? SafeArea(
                        //         child: SizedBox(
                        //           height: 10.h,
                        //           child: Center(
                        //             child: loadingthreebounce,
                        //           ),
                        //         ),
                        //       )

                        : ListView.builder(
                            itemCount: detalis!.activities!.length,
                            itemBuilder: (context, index) {
                              var activitiesdata = detalis.activities![index];
                              return InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Description",
                                      titleStyle: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                      content: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Text(
                                            //   "Description",
                                            //   style: const TextStyle(
                                            //     fontSize: 18.0,
                                            //     fontWeight: FontWeight.bold,
                                            //   ),
                                            // ),
                                            // const SizedBox(height: 20.0),
                                            TextField(
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              minLines: 1,
                                              maxLines: 12,
                                              controller: TextEditingController(
                                                text: activitiesdata.description
                                                    .toString(),
                                              ),
                                              readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14.0),
                                            ),
                                            // Text(
                                            //   activitiesdata.description,
                                            //   textAlign: TextAlign.center,
                                            //   style: const TextStyle(
                                            //       fontSize: 14.0),
                                            // ),
                                            const SizedBox(height: 20.0),
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  )),
                                                  backgroundColor:
                                                      const WidgetStatePropertyAll(
                                                          Color.fromARGB(255,
                                                              217, 217, 217))),
                                              child: const Text(
                                                'Back',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: DailytaskIteamsCard(
                                    // indexs: index,
                                    details: detalis,
                                    data: activitiesdata,
                                  ));
                            },
                          ),
                    init: SelectedTaskController(),
                  ),
                ),
              ],
            ));
          }
        },
        init: SelectedTaskController(),
      ),
    );
  }
}

class DailytaskIteamsCard extends StatelessWidget {
  const DailytaskIteamsCard(
      {super.key, required this.data, this.indexs, required this.details});
  final indexs;
  final SelectedTaskModel details;
  final Activity data;

  @override
  Widget build(BuildContext context) {
    AddActivitiesController controller = Get.put(AddActivitiesController());
    ActivitesDelete controller1 = Get.put(ActivitesDelete());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(indexs.toString()),
                  w1,
                  Text(
                    data.title.isEmpty ? "Title" : data.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: Medium,
                        fontSize: 12.sp),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    onSelected: (value) async {
                      if (value == "edit") {
                        controller.title.text = data.title.toString();
                        controller.description.text =
                            data.description.toString();

                        Get.to(EditActivites(
                          taskid: data.taskId,
                          // description: data.description,
                          // title: data.createdBy,
                          activityids: data.activityId.toString(),
                        ));
                      } else if (value == "delete") {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return SizedBox(
                                  //  height:80.h,
                                  width: 100.w,
                                  child: SimpleDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      contentPadding: EdgeInsets.zero,
                                      titlePadding: EdgeInsets.zero,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.h, horizontal: 2.h),
                                          // height: 25.h,
                                          width: 100.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                    color: const Color.fromARGB(
                                                        255, 139, 131, 131)),
                                              ),
                                              const Divider(
                                                thickness: 1,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () async {
                                                          controller1
                                                              .postdeleteactivities(data
                                                                  .activityId
                                                                  .toString());
                                                          Get.back();
                                                          details.activities!
                                                              .removeAt(indexs);
                                                          // Get.back();
                                                        },

                                                        child: Center(
                                                            child: Text(
                                                          'Yes',
                                                          style:
                                                              header12.copyWith(
                                                                  color: Colors
                                                                      .black),
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
                                                              Get.back();
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
                                                              style: header12
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black),
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
                            child: Text("Edit")),
                        const PopupMenuItem(
                          value: "delete",
                          child: Text("Delete"),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              const Divider(
                color: Colors.white54,
                thickness: 1,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Text(
                  "Created Date : ${data.createdDate}",
                  style: TextStyle(
                      fontFamily: Medium, color: Colors.white, fontSize: 9.sp),
                ),
              ),
              h2
            ],
          ),
        ),
      ),
    );
  }
}
