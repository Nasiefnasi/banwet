import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/common2date.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/dailytask_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/component/tasktile.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/daily-taskactivities.dart';
import 'package:banwet/app/style/const.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({super.key});

  @override
  Widget build(BuildContext context) {
    DailytaskController controller = Get.put(DailytaskController());
    SelectedTaskController controller1 = Get.put(SelectedTaskController());
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
              'Daily Task',
              style: header15,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Common2Date(
              ontap: () {
                controller.filteringHometaskData();
                controller.update();
                controller.change();
              },
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              startDateValue: controller.startDate,
              endDateValue: controller.endDate,
              onPressed: () {
                // controller.filteringData();
                controller.filteringHometaskData();
                controller.update();
                print("<--------------------------");
              },
            ),
            GetBuilder<DailytaskController>(builder: (controller) {
              if (controller.filterhomepagetaskList == null) {
                return SizedBox(
                  height: 10.h,
                  child: Center(
                    child: loadingthreebounce,
                  ),
                );

                // ignore: prefer_is_empty
              } else if (controller.filterhomepagetaskList.length == 0) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .6,
                  child: Center(
                    child: Lottie.asset(
                        repeat: false,
                        "assets/images/qrbRtDHknE.json",
                        height: 250),
                  ),
                );

                // const NoItemWidget(
                //   text: "Daily Task",
                // );
              } else {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(children: [
                      Column(
                        children: [
                          h1,
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        "${controller.homecompletedCount}",
                                        style: header2.copyWith(
                                            color: const Color(0xff18a900)),
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
                                        "${controller.homeinProgressCount}",
                                        style: header2.copyWith(
                                            color: const Color(0xffe7b400)),
                                      )
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                    thickness: 1, color: Colors.black12),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Pending",
                                        style: header11,
                                      ),
                                      h1,
                                      Text(
                                        "${controller.homependingCount}",
                                        style: header2.copyWith(
                                            color: const Color(0xffe10000)),
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
                      controller.homepageTaskModel?.data?.length == 0
                          ? Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            )
                          : Expanded(
                              child: controller.filterhomepagetaskList.length ==
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
                                          .filterhomepagetaskList.length,
                                      itemBuilder: (context, index) {
                                        print(
                                            "Helloo ssss ${controller.filterhomepagetaskList.length}");
                                        var data = controller
                                            .filterhomepagetaskList[index];

                                        return GestureDetector(
                                          onTap: () async {
                                            // controller.selectedTaskModel = null;
                                            controller1.taskid!.value =
                                                controller
                                                        .filterhomepagetaskList[
                                                            index]
                                                        .taskId ??
                                                    "";

                                            controller1.getDetails();
                                            Get.to(
                                                () => SelectedTaskScreen(
                                                      workname: controller
                                                              .filterhomepagetaskList[
                                                                  index]
                                                              .workName ??
                                                          "",
                                                    ),
                                                arguments: {
                                                  // "workid": data.work_id ?? "",
                                                  "taskid": controller
                                                          .filterhomepagetaskList[
                                                              index]
                                                          .taskId ??
                                                      "",
                                                  "workname": controller
                                                          .filterhomepagetaskList[
                                                              index]
                                                          .workName ??
                                                      ""
                                                });
                                          },
                                          child: TaskListTile(
                                              index: index,
                                              tasktitle: data.taskTitle ?? "",
                                              dueDate: data.dueDate ?? "",
                                              status: data.taskStatus ?? ""),
                                        );
                                      },
                                    ),
                            )
                    ]),
                  ),
                );
              }
            }),
          ],
        ),
      )),
    );
  }
}
