import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:intl/intl.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/activity/controllers/activity_controller.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';

// class MyActivity extends StatelessWidget {
//   const MyActivity({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ActivityController controller = Get.put(ActivityController());
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             ProjectNameTitile(
//               back: () => Get.back(result: 'refresh'),
//               addbutton: const SizedBox(),
//               projectName: "controller.argumentData[workname]",
//               screenTitile: "Group Wage Slip",
//               onTap: () {
//                 // Get.to(() => AddLabourActivity());
//               },
//             ),
//             h2,
//             Common3Date(
//               ontap: () {
//                 // controller.change();
//               },
//               statDate: controller.startDateController,
//               endDate: controller.endDateController,
//               startDateValue: controller.startDate,
//               endDateValue: controller.endDate,
//               onPressed: () {
//                 // controller.filterAndCalculatestocktransfer(
//                 //   controller.stockTransferReportModel?.data ?? [],
//                 // );
//                 // controller.update();

//                 // controller.filterAndCalculatestockconsumption(
//                 //   controller.stockConsumptionReport Model?.data ?? [],
//                 // );
//                 // controller.update();
//               },
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
class MyActivity extends StatelessWidget {
  const MyActivity({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    ActivityController controller = Get.put(ActivityController());
    DateFormat format = DateFormat("dd/MM/yyyy");
    // Initialize with two days back for start date and current date for end date

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h2,
              ProjectNameTitile(
                addbutton: const SizedBox(),
                // back: () => Get.back(result: 'refresh'),
                // addbutton: const SizedBox(),
                projectName: null,
                screenTitile: "My Activity",
                onTap: () {
                  // Navigate to AddLabourActivity if needed
                },
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: mediaquery.width * .45,
                child: DateTimePickers(
                  onChanged: (p0) {
                    controller.filteredList.clear();
                    controller.filterAndCalculate();
                    controller.update();
                  },
                  labelStyle:
                      header11.copyWith(color: Colors.black54, fontSize: 12),
                  style: header11.copyWith(color: Colors.black, fontSize: 12),
                  label: "Activity Date",
                  controller: controller.billDate,
                ),
              ),
              h2,
              // Common3Date(
              //   ontap: () {
              //     // Add logic here if needed
              //   },
              //   statDate: controller.startDateController,
              //   endDate: controller.endDateController,
              //   startDateValue: controller.startDate,
              //   endDateValue: controller.endDate,
              //   onPressed: () {
              //     // Perform actions based on the selected dates
              //   },
              // ),
              Expanded(
                child: GetBuilder<ActivityController>(
                  builder: (controller) => controller.myActivityModel == null
                      ? Center(child: loadingthreebounce)
                      : controller.filteredList.value.length == 0
                          ? Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            )
                          : ListView.builder(
                              itemCount: controller.filteredList.value.length,
                              itemBuilder: (context, index) {
                                var data = controller.filteredList.value[index];
                                return Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    // height: mediaquery.height * .15,
                                    // color: Colors.amber,
                                    child: Column(
                                      children: [
                                        h1,
                                        Text(data.date.split(" ")[0],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: regular,
                                            )),
                                        Text(
                                          data.activityDescription.toString(),
                                          style: TextStyle(
                                              fontSize: 18, fontFamily: Medium),
                                        ),
                                        h1,
                                        index !=
                                                controller.filteredList.length -
                                                    1
                                            ? Container(
                                                width: 2,
                                                color: Colors.black26,
                                                height: mediaquery.height * .06,
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                  init: ActivityController(),
                ),
              ),
              // GetBuilder(
              //   builder: (controller) {
              //     return
              //   },
              // )
              h1
            ],
          ),
        ),
      ),
    );
  }
}
