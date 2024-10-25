import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common2date.dart';
import '../../../../../../common_widegt/loading.dart';
import '../../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/activity_controller.dart';
import 'add_activity.dart';
import 'edit_activity.dart';

class ActivityView extends GetView<ActivityController> {
  ActivityView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h2,
              ProjectNameTitile(
                projectName: controller.argumentData["workname"] ?? "yjyt",
                screenTitile: "Activity",
                onTap: () {
                  Get.to(() => AddActivity());
                },
              ),
              Common2Date(
                ontap: () {
                  controller.update();
                  controller.filteringData();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  // controller.filteringDates();
                  controller.update();
                  controller.filteringData();
                  print("<-----------==---------------");
                },
              ),
              h4,
              GetBuilder<ActivityController>(
                builder: (controller) => controller.filterList == null
                    ? Center(child: loadingthreebounce)
                    : controller.filterList.value.length == 0
                        ? Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: mediaquery.height * .4),
                          )
                        : Expanded(
                            child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.activityModel!.data!.length,
                              itemBuilder: (context, index) {
                                if (dateFormat
                                            .parse(controller.activityModel!
                                                .data![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .startDateController.text)) >=
                                        0 &&
                                    dateFormat
                                            .parse(controller.activityModel!
                                                .data![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .endDateController.text)) <=
                                        0) {
                                  return PaymnetListTile(index: index);
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                init: ActivityController(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymnetListTile extends GetView<ActivityController> {
  PaymnetListTile({super.key, required this.index});
  @override
  ActivityController controller = Get.put(ActivityController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
        // height: 8.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 65.w,
                  child: Text(
                    controller.activityModel!.data![index].title ?? "",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: Medium,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                h1,
                SizedBox(
                  width: 65.w,
                  child: Text(
                    "Created Date : ${controller.activityModel!.data![index].date ?? ""}",
                    style: TextStyle(
                        fontFamily: regular,
                        fontSize: 11.sp,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            controller.activityModel!.data![index].createdDate.toString() ==
                    DateFormat("dd-MM-y").format(DateTime.now()).toString()
                ? PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == "edit") {
                        Get.to(() => EditActivity(), arguments: {
                          "reportId":
                              controller.activityModel!.data![index].reportId ??
                                  ""
                        });
                        controller.titleController.text = controller
                            .activityModel!.data![index].title
                            .toString();
                        controller.descriptionController.text = controller
                            .activityModel!.data![index].description
                            .toString();
                      }
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            value: "edit",
                            padding: EdgeInsets.zero,
                            child: GestureDetector(
                                child: Container(
                              padding: EdgeInsets.only(left: 2.h),
                              width: 28.w,
                              height: 3.h,
                              child: const Text(
                                "Edit",
                              ),
                            ))),
                      ];
                    })
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
