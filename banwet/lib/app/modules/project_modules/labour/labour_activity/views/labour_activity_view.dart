import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common2date.dart';
import '../../../../../common_widegt/deletedialoge.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/labour_activity_controller.dart';
import 'addlabour_activity.dart';
import 'update_labouractivity.dart';

class LabourActivityView extends GetView<LabourActivityController> {
  LabourActivityView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');
  @override
  LabourActivityController controller = Get.put(LabourActivityController());
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
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
                  ProjectNameTitile(
                    projectName: controller.argumentData["workname"],
                    screenTitile: "Labour Activity List",
                    onTap: () {
                      Get.to(() => AddLabourActivity());
                      controller.clear();
                    },
                  ),
                  h2,
                  Common2Date(
                    ontap: () {
                      controller.filterdate();
                      controller.update();
                    },
                    statDate: controller.startDateController,
                    endDate: controller.endDateController,
                    startDateValue: controller.startDate,
                    endDateValue: controller.endDate,
                    onPressed: () {
                      // controller.filteringDates();
                      controller.filterdate();
                      controller.update();
                      print("<--------------------------");
                    },
                  ),
                  h4,
                  GetBuilder<LabourActivityController>(
                    builder: (controller) => controller.filterlist == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              loadingthreebounce,
                            ],
                          )
                        : controller.filterlist.value.length == 0
                            ? Center(
                                child: Lottie.asset(
                                    repeat: false,
                                    "assets/images/qrbRtDHknE.json",
                                    height: mediaquery.height * .3),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller
                                    .labourActivityModel!.data!.length,
                                itemBuilder: (context, index) {
                                  if (dateFormat
                                              .parse(controller
                                                  .labourActivityModel!
                                                  .data![index]
                                                  .createdDate!)
                                              .compareTo(DateTime.parse(
                                                  controller.startDateController
                                                      .text)) >=
                                          0 &&
                                      dateFormat
                                              .parse(controller
                                                  .labourActivityModel!
                                                  .data![index]
                                                  .createdDate!)
                                              .compareTo(DateTime.parse(
                                                  controller.endDateController
                                                      .text)) <=
                                          0) {
                                    return LabourActivityListTile(index);
                                  } else {
                                    return const SizedBox();
                                  }
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

class LabourActivityListTile extends GetView<LabourActivityController> {
  LabourActivityListTile(this.index, {super.key});

  @override
  LabourActivityController controller = Get.put(LabourActivityController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        infoDialoge(context, controller.labourActivityModel!.data![index].title,
            controller.labourActivityModel!.data![index].description);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 8),
        // height: 10.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // width: 65.w,
                  child: Text(
                    controller.labourActivityModel!.data![index].title ?? "",
                    style: wheader11,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                h05,
                Text(
                  "Create Date : ${controller.labourActivityModel!.data![index].date.toString()}",
                  style: wheader11,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            controller.labourActivityModel!.data![index].createdDate
                        .toString() ==
                    DateFormat("dd-MM-y").format(DateTime.now()).toString()
                ? PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "edit") {
                        Get.to(() => UpdateLabourActivity(), arguments: {
                          "reportId": controller
                              .labourActivityModel!.data![index].reportId
                              .toString()
                        });
                        controller.titleController.text = controller
                            .labourActivityModel!.data![index].title
                            .toString();
                        controller.selectLabour.text = controller
                            .labourActivityModel!.data![index].labourName
                            .toString();
                        controller.descriptionController.text = controller
                            .labourActivityModel!.data![index].description
                            .toString();
                      } else {
                        expDelete(context, index, () async {
                          controller.deleteActivity(controller
                              .labourActivityModel!.data![index].reportId!);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ),
                    color: Colors.white,
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
                    })
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
