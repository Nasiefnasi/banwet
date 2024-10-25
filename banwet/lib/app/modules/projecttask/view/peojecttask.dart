import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/projecttask/controllers/projecttask_controller.dart';
import 'package:banwet/app/modules/projecttask/view/tasktitle.dart';
import 'package:banwet/app/style/const.dart';

class Peojecttask extends GetView<ProjecttaskController> {
  const Peojecttask({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            h2,
            ProjectNameTitile(
              addbutton: const SizedBox(),
              projectName: controller.arugumentData["workname"] ?? "",
              screenTitile: "Project Task",
              onTap: () {},
            ),
            h3,
            GetBuilder<ProjecttaskController>(
              builder: (controller) => Obx(
                () => controller.projectworking.value
                    ? Expanded(child: Center(child: loadingthreebounce))
                    : controller.projecttaskmodel == null
                        ? Expanded(
                            child: Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            ),
                          )
                        : Expanded(
                            child: Container(
                            child: ListView.builder(
                              itemCount:
                                  controller.projecttaskmodel!.data.length,
                              itemBuilder: (context, index) {
                                var details =
                                    controller.projecttaskmodel!.data[index];
                                return InkWell(
                                    radius: 5,
                                    onTap: () {
                                      controller.projectdetailstaskId.value =
                                          details.taskId;
                                      controller.projecttaskdetails();
                                      Get.to(const TasktitlePage());
                                    },
                                    child: ProjectTaskIteamCard(
                                        data: details, mediaquery: mediaquery));
                              },
                            ),
                          )),
              ),
              init: ProjecttaskController(),
            )
          ],
        )),
      ),
    );
  }
}

class ProjectTaskIteamCard extends GetView<ProjecttaskController> {
  const ProjectTaskIteamCard({
    super.key,
    required this.mediaquery,
    required this.data,
    this.task,
  });
  final task;
  final Size mediaquery;
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bColor,
      ),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  // color: Colors.amber,
                  width: mediaquery.width * .7,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    data?.taskTitle ?? "",
                    style: TextStyle(
                        fontFamily: Medium, fontSize: 15, color: Colors.white),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    return showFullWidthDialog(context, data);
                  },
                  child: const SizedBox(
                    // color: Colors.amber,
                    height: 30,
                    width: 30,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          h2,
          SizedBox(
            height: mediaquery.height * .05,
            child: Container(
              // color: Colors.red,
              child: Row(
                children: [
                  Expanded(
                    // width: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Date",
                          style: TextStyle(
                              fontFamily: regular,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        Text(
                          data?.plannedStartDate ?? "",
                          style: TextStyle(
                              fontFamily: Medium,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "End Date",
                          style: TextStyle(
                              fontFamily: regular,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                        Text(
                          data?.plannedEndDate ?? "",
                          style: TextStyle(
                              fontFamily: Medium,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${data?.progress ?? ""}%",
                        style: TextStyle(
                            fontFamily: Medium,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      LinearProgressIndicator(
                          minHeight: 7,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                          value: data.progress / 100,
                          backgroundColor: const Color.fromARGB(255, 116, 185,
                              241), // Background color of the indicator
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white) // Progress color
                          ),
                    ],
                  ),
                ),
                task == "2task" ? w2 : const SizedBox(),
                task == "2task"
                    ? InkWell(
                        radius: 50,
                        onTap: () {
                          controller.progressValue =
                              double.parse(data.progress.toString()).obs;
                          taskstatus();
                        },
                        child: Container(
                          // color: Colors.white,
                          // width: mediaquery.width * .14,
                          // height: mediaquery.height * .05,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(50),
                          //     color: Colors.white),
                          // radius: 25,
                          // backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/nextplayicon.png",
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  void taskstatus() {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ), // Removes padding to make dialog full-screen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: SizedBox(
          width: mediaquery.width * .9,
          height: mediaquery.height * .3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                h2,
                Text(
                  "Add Sub Task",
                  style: TextStyle(
                    fontFamily: Medium,
                    fontSize: 22,
                  ),
                ),
                h1,
                Obx(() {
                  var value =
                      controller.progressValue.value.toString().split(".")[0];
// int cuttentvalue = int.p
                  return Text(
                    "${value.toString()}%",
                    style: TextStyle(
                      fontFamily: Bold,
                      fontSize: 16,
                    ),
                  );
                }),
                h1,
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: SizedBox(
                        // height: 100,
                        width: double.maxFinite,
                        child: Center(
                          child: SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 25,
                              activeTrackColor: bColor,
                              inactiveTrackColor: Colors.blue,
                              trackShape:
                                  const RoundedRectSliderTrackShape(), // Rounded track shape
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius:
                                    13.5, // Remove center circle (thumb)
                                elevation: 0.0, // No shadow on the thumb
                                pressedElevation: 0.0, // No shadow when pressed
                              ),
                              overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 0), // No overlay
                              // Customize this for both side radius
                              // trackShape: RoundedRectSliderTrackShape(),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Slider(
                                // activeColor: Colors.amber,
                                min: 0.0,
                                max: 100.0,
                                value: controller.progressValue.value,
                                onChanged: (value) {
                                  controller.updateProgress(value);
                                },
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                h3,
                // Container(
                //   height: 150,
                //   width: 250,
                //   child: Expanded(
                //     child: Slider(
                //       value: 50,
                //       onChanged: (value) {},
                //     ),
                //   ),
                // ),
                Obx(() {
                  var value =
                      controller.progressValue.value.toString().split(".")[0];

                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SubmitButtons(
                          isLoading: controller.statusupdateLoading,
                          onTap: () {
                            controller.updateProgersStatus(
                                data.taskId, value.toString());
                            // cont  progressValue.value = 0.0;
                          },
                          text: "Update"),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void showCustomDialog(BuildContext context) {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Container(
//         width: double.infinity,
//         // Adjust the width as needed
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Task title and project name
//             Text(
//               'Task Title',
//               style: TextStyle(
//                 // fontWeight: FontWeight.bold,
//                 fontFamily: Medium,
//                 fontSize: 18,
//               ),
//             ),
//             Text(
//               'Project Name',
//               style: TextStyle(
//                   fontSize: 14, color: Colors.grey, fontFamily: regular),
//             ),
//             // SizedBox(height: 15),
//             h2,
//             // Description
//             Text(
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
//               textAlign: TextAlign.left,
//               style: TextStyle(fontSize: 14, fontFamily: regular),
//             ),
//             SizedBox(height: 20),
//             // Date information
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Planned Start Date',
//                       style: TextStyle(fontFamily: SemiBold, fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Planned End Date',
//                       style: TextStyle(fontFamily: SemiBold, fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Actual Start Date',
//                       style: TextStyle(fontFamily: SemiBold, fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Actual End Date',
//                       style: TextStyle(fontFamily: SemiBold, fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Circular progress indicator (pie chart)
//             CircularPercentIndicator(
//               radius: 80.0,
//               lineWidth: 10.0,
//               percent: 0.56, // 56% completion
//               center: Text(
//                 '56%',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0,
//                 ),
//               ),
//               progressColor: Colors.blue,
//               backgroundColor: Colors.amber,
//               circularStrokeCap: CircularStrokeCap.round,
//             ),
//             SizedBox(height: 20),
//             // Back button
//             ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text('Back'),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// void showFullWidthDialog(BuildContext context) {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.99, // 90% of screen width
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Task title and project name
//             Text(
//               'Task Title',
//               style: TextStyle(
//                 fontFamily: 'Medium',
//                 fontSize: 18,
//               ),
//             ),
//             Text(
//               'Project Name',
//               style: TextStyle(
//                   fontSize: 14, color: Colors.grey, fontFamily: 'regular'),
//             ),
//             // Description
//             SizedBox(height: 15), // Add height to separate sections
//             Text(
//               'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
//               textAlign: TextAlign.left,
//               style: TextStyle(fontSize: 14, fontFamily: 'regular'),
//             ),
//             SizedBox(height: 20),
//             // Date information
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Planned Start Date',
//                       style: TextStyle(fontFamily: 'SemiBold', fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Planned End Date',
//                       style: TextStyle(fontFamily: 'SemiBold', fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Actual Start Date',
//                       style: TextStyle(fontFamily: 'SemiBold', fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Actual End Date',
//                       style: TextStyle(fontFamily: 'SemiBold', fontSize: 13),
//                     ),
//                     Text('30-09-2024'),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Circular progress indicator (pie chart)
//             CircularPercentIndicator(
//               radius: 80.0,
//               lineWidth: 10.0,
//               percent: 0.56, // 56% completion
//               center: Text(
//                 '56%',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0,
//                 ),
//               ),
//               progressColor: Colors.blue,
//               backgroundColor: Colors.amber,
//               circularStrokeCap: CircularStrokeCap.round,
//             ),
//             SizedBox(height: 20),
//             // Back button
//             ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: Text('Back'),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
void showFullWidthDialog(BuildContext context, details) {
  ProjecttaskController controller = Get.put(ProjecttaskController());
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(
          horizontal: 20), // Removes padding to make dialog full-screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth, // Take full available width
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Task title and project name
                  Text(
                    details.taskTitle,
                    style: TextStyle(
                      fontFamily: Medium,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.arugumentData["workname"],
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey, fontFamily: regular),
                  ),
                  // Description
                  h2,
                  Text(
                    details.taskDescription,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14, fontFamily: regular),
                  ),
                  const SizedBox(height: 20),
                  // Date information
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Planned Start Date',
                            style:
                                TextStyle(fontFamily: SemiBold, fontSize: 13),
                          ),
                          Text(
                            details.plannedStartDate,
                            style: TextStyle(fontFamily: Medium, fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Planned End Date',
                            style:
                                TextStyle(fontFamily: SemiBold, fontSize: 13),
                          ),
                          Text(
                            details.plannedEndDate,
                            style: TextStyle(fontFamily: Medium, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  h1,
                  const Divider(
                    thickness: 1,
                    color: Colors.black45,
                  ),
                  h1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Actual Start Date',
                            style:
                                TextStyle(fontFamily: SemiBold, fontSize: 13),
                          ),
                          Text(details.actualStartDate,
                              style:
                                  TextStyle(fontFamily: Medium, fontSize: 14)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Actual End Date',
                            style:
                                TextStyle(fontFamily: SemiBold, fontSize: 13),
                          ),
                          Text(details.actualEndDate,
                              style:
                                  TextStyle(fontFamily: Medium, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                  h5,
                  // Circular progress indicator (pie chart)
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 30.0,
                    percent: details.progress / 100, // 56% completion
                    center: Text(
                      '${details.progress}%',
                      style: TextStyle(
                        fontFamily: Bold,
                        fontSize: 40.0,
                      ),
                    ),
                    progressColor: bColor,
                    backgroundColor: const Color.fromARGB(255, 19, 172, 219),
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                  const SizedBox(height: 20),
                  // Back button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        backgroundColor:
                            const Color.fromARGB(123, 164, 164, 164),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Back',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
