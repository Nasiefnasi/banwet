import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/Dailytaskdetails/controllers/dailytaskdetails.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/component/tasktile.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/daily-taskactivities.dart';

class DailytaskView extends GetView<DailytaskDatailsController> {
  DailytaskView({Key? key}) : super(key: key);

  @override
  // DailytaskController controller = Get.put(DailytaskController());
  SelectedTaskController controller1 = Get.put(SelectedTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          title: Column(
            children: [
              Text(
                'Daily Tasks',
                style: header15,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                Common2Date(
                  ontap: () {
                    controller.filteringData();
                    controller.change();
                  },
                  statDate: controller.startDateController,
                  endDate: controller.endDateController,
                  startDateValue: controller.startDate,
                  endDateValue: controller.endDate,
                  onPressed: () {
                    controller.filteringData();
                    controller.update();
                    print("<--------------------------");
                  },
                ),
                GetBuilder<DailytaskDatailsController>(
                  builder: (controller) => Obx(
                    () => controller.dailytaskloading.value == false
                        ? SizedBox(
                            // color: Colors.amber,
                            height: MediaQuery.of(context).size.height * .5,
                            child: Center(
                              heightFactor: 250,
                              child: loadingthreebounce,
                            ),
                          )
                        : controller.filterList.value.length == 0
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height * .6,
                                child: Center(
                                  child: Lottie.asset(
                                      repeat: false,
                                      "assets/images/qrbRtDHknE.json",
                                      height: 250),
                                ),
                              )
                            :
                            // if (controller.dailytaskloading.value) {
                            //   return
                            // Container(
                            //     // color: Colors.amber,
                            //     height: MediaQuery.of(context).size.height * .5,
                            //     child: Center(
                            //       heightFactor: 250,
                            //       child: loadingthreebounce,
                            //     ),
                            //   );

                            //   // ignore: prefer_is_empty
                            // } else if (controller.filterList.value.length == 0) {
                            //   return Container(
                            //     height: MediaQuery.of(context).size.height * .6,
                            //     child: Center(
                            //       child: Lottie.asset(
                            //           repeat: false,
                            //           "assets/images/qrbRtDHknE.json",
                            //           height: 250),
                            //     ),
                            //   );
                            //   ;

                            //   // const NoItemWidget(
                            //   //   text: "Daily Task",
                            //   // );
                            // } else {
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(children: [
                                    Column(
                                      children: [
                                        h1,
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Completed",
                                                      style: header11,
                                                    ),
                                                    h1,
                                                    Text(
                                                      "${controller.completedCount}",
                                                      style: header2.copyWith(
                                                          color: const Color(
                                                              0xff18a900)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const VerticalDivider(
                                                thickness: 1,
                                                color: Colors.black12,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "InProgress",
                                                      style: header11,
                                                    ),
                                                    h1,
                                                    Text(
                                                      "${controller.inProgressCount}",
                                                      style: header2.copyWith(
                                                          color: const Color(
                                                              0xffe7b400)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const VerticalDivider(
                                                  thickness: 1,
                                                  color: Colors.black12),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Pending",
                                                      style: header11,
                                                    ),
                                                    h1,
                                                    Text(
                                                      "${controller.pendingCount}",
                                                      style: header2.copyWith(
                                                          color: const Color(
                                                              0xffe10000)),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    h2,

                                    const Divider(
                                      thickness: 1,
                                      height: 3,
                                      color: Colors.black12,
                                    ),
                                    h2,

                                    // ignore: prefer_is_empty
                                    controller.taskModel?.data?.length == 0
                                        ? Center(
                                            child: Lottie.asset(
                                                repeat: false,
                                                "assets/images/qrbRtDHknE.json",
                                                height: 250),
                                          )
                                        : Expanded(
                                            child:
                                                controller.filterList.length ==
                                                        0
                                                    ? Center(
                                                        child: Lottie.asset(
                                                            repeat: false,
                                                            "assets/images/qrbRtDHknE.json",
                                                            height: 250),
                                                      )
                                                    : ListView.builder(
                                                        // separatorBuilder: (context, index) => h2,
                                                        shrinkWrap: true,
                                                        //   itemCount: controller.taskModel?.data?.length ?? 0,
                                                        itemCount: controller
                                                            .filterList.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          print(
                                                              "Helloo ssss ${controller.filterList.length}");
                                                          var data = controller
                                                                  .filterList[
                                                              index];
                                                          return GestureDetector(
                                                            onTap: () async {
                                                              controller1
                                                                      .selectedTaskModel =
                                                                  null;
                                                              controller1
                                                                  .taskid!
                                                                  .value = controller
                                                                      .filterList[
                                                                          index]
                                                                      .taskId ??
                                                                  "";
                                                              controller1
                                                                  .getDetails();
                                                              Get.to(
                                                                  () =>
                                                                      SelectedTaskScreen(
                                                                        workname:
                                                                            controller.filterList[index].workName ??
                                                                                "",
                                                                      ),
                                                                  arguments: {
                                                                    "taskid": controller
                                                                            .filterList[index]
                                                                            .taskId ??
                                                                        "",
                                                                    "workname":
                                                                        controller.filterList[index].workName ??
                                                                            ""
                                                                  });
                                                            },
                                                            child: TaskListTile(
                                                                index: index,
                                                                tasktitle:
                                                                    data.taskTitle ??
                                                                        "",
                                                                dueDate:
                                                                    data.dueDate ??
                                                                        "",
                                                                status:
                                                                    data.taskStatus ??
                                                                        ""),
                                                          );
                                                        },
                                                      ),
                                          )
                                  ]),
                                ),
                              ),
                  ),
                  init: DailytaskDatailsController(),
                )
              ],
            ),
          ),
        ));
  }
}
