import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/data/model/notification.model/notification_model.dart';
import 'package:banwet/app/modules/notification/views/component/notifcationtopurchaserequest.dart';
import 'package:banwet/app/modules/notification/views/component/notification.list.tile.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/selectedtask_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/views/daily-taskactivities.dart';

import '../../../Style/const.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  NotificationView({Key? key}) : super(key: key);

  @override
  NotificationController controller = Get.put(NotificationController());
  SelectedTaskController controller1 = Get.put(SelectedTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: bColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Text(
            "See What's  New",
            style:
                header10.copyWith(color: const Color(0xffd7d7d7), fontSize: 15),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Text(
              "Notifications",
              style: header15.copyWith(color: Colors.white, fontSize: 30),
            )),
      ),
      backgroundColor: bColor,
      body: Column(
        children: [
          h2,
          // const NotificationHeader(), // page header and search field
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 0.h),
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: GetBuilder<NotificationController>(
                builder: (controller) {
                  if (controller.notificationModel == null) {
                    return Center(
                      child: SizedBox(
                        height: dHeight! * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [loadingthreebounce],
                        ),
                      ),
                    );
                  } else if (controller.notificationModel!.data == null) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          )
                          // SvgPicture.asset(
                          //   'assets/images/No data-pana.svg',
                          //   height: dHeight! * 0.2,
                          // ),
                          // height6,
                          // Text(
                          //   'No Notifications yet !',
                          //   style: header2.copyWith(fontSize: 25),
                          // )
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 1,
                          height: 12,
                        ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            controller.notificationModel?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var data = controller.notificationModel!.data?[index];

                          return InkWell(
                            onTap: () {
                              if (data!.notificationType == "daily_task") {
                                controller1.taskid!.value =
                                    data.referenceId ?? "";
                                controller1.getDetails();
                                Get.to(
                                  () => SelectedTaskScreen(
                                    workname: " ",
                                  ),
                                );
                              } else if (data.notificationType ==
                                  "purchase_request") {
                                controller.notificationtopurchaseDetails(
                                    data.referenceId);
                                Get.to(
                                    NotifcationtoPurchaseRequest(data.workId));
                                // Get.snackbar("hellooo Man  ",
                                //     "create this Purchase request page ",
                                //     backgroundColor: Colors.green.shade200);
                                // Container();
                              }
                            },
                            child: NotificationListTile(
                              notificationDate: data?.notificationDate ?? "",
                              description: data?.message ?? "",
                              title: data?.title ?? "",
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
                init: NotificationController(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to group notifications by date
Map<String, List<NotificationModelData>> groupByDate(
    List<NotificationModelData> notifications) {
  Map<String, List<NotificationModelData>> groupedNotifications = {};

  for (var notification in notifications) {
    String dateKey = getDateKey(notification.notificationDate);

    if (!groupedNotifications.containsKey(dateKey)) {
      groupedNotifications[dateKey] = [];
    }

    groupedNotifications[dateKey]!.add(notification);
  }

  return groupedNotifications;
}

// Helper function to get a string representation of the date
String getDateKey(String? dateString) {
  if (dateString == null) {
    return 'Unknown Date';
  }

  DateTime date = DateTime.tryParse(dateString) ?? DateTime.now();
  DateTime now = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

  if (date.year == yesterday.year &&
      date.month == yesterday.month &&
      date.day == yesterday.day) {
    return 'Yesterday';
  } else if (date.year == now.year &&
      date.month == now.month &&
      date.day == now.day) {
    return 'Today';
  } else {
    // Customize this format based on your needs
    return '${date.day}/${date.month}/${date.year}';
  }
}
