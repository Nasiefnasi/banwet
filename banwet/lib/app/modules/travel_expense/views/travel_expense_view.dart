import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/office_expense/views/office_expense_view.dart';
import 'package:banwet/app/modules/travel_expense/views/update_travelepense.dart';
// import 'package:banwet/app/modules/travel_expense/views/update_travelepense.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common2date.dart';
import '../../../common_widegt/common_header.dart';
import '../../../common_widegt/deletedialoge.dart';
import '../../../common_widegt/loading.dart';
// import '../../../common_widegt/submitpage.dart';
import '../controllers/travel_expense_controller.dart';
import 'add_travel_expense.dart';

class TravelExpenseView extends GetView<TravelExpenseController> {
  TravelExpenseView({Key? key}) : super(key: key);
  @override
  TravelExpenseController controller = Get.put(TravelExpenseController());
  @override
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              h2,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  children: [
                    CommonTitile(
                      text: 'Travel Expense',
                      onpress: () {
                        controller.clear();
                        Get.to(() => AddTravelExpense());
                      },
                    ), //h2,
                    // Common2Date(
                    //   statDate: controller.startDateController,
                    //   endDate: controller.endDateController,
                    //   onPressed: () {
                    //     controller.change();
                    //     controller.filteringData();
                    //     controller.update();
                    //   },
                    //   ontap: () {
                    //     controller.filteringData();
                    //     controller.update();
                    //   },
                    // ),
                    // Common2Date(
                    //   ontap: () {
                    //     controller.filteringData();

                    //     // controller.update();
                    //     controller.change();
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
                    // Common2Date(
                    //   ontap: () {
                    //     controller.change();
                    //     controller.filteringData();
                    //     // controller.filteringDates();
                    //   },
                    //   statDate: controller.startDateController,
                    //   endDate: controller.endDateController,
                    //   startDateValue: controller.startDate,
                    //   endDateValue: controller.endDate,
                    //   onPressed: () {
                    //     controller.change();

                    //     controller.filteringData();
                    //     controller.update();
                    //   },
                    // ),
                    h4,
                    GetBuilder<TravelExpenseController>(
                      builder: (controller) => Obx(
                        () =>
                            // controller.travelExpenseModel == null
                            controller.isShow.value == true
                                ? Center(child: loadingthreebounce)
                                : controller.filterList.value.length == 0
                                    ?
                                    // Container(
                                    //     // color: Colors.amber,
                                    //     height:
                                    //         MediaQuery.of(context).size.height * .6,
                                    //     child: Center(
                                    //       child: Lottie.asset(
                                    //           repeat: false,
                                    //           "assets/images/qrbRtDHknE.json",
                                    //           height: 250),
                                    //     ),
                                    //   )
                                    const BottomNavBarSearchingIcon(
                                        bottombar: 2,
                                      )
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.filterList.value.length,
                                        itemBuilder: (context, index) {
                                          // if (dateFormat
                                          //             .parse(controller
                                          //                 .filterList[index]
                                          //                 .createdDate!)
                                          //             .compareTo(DateTime.parse(
                                          //                 controller
                                          //                     .startDateController
                                          //                     .text)) >=
                                          //         0 &&
                                          //     dateFormat
                                          //             .parse(controller
                                          //                 .filterList[index]
                                          //                 .createdDate!)
                                          //             .compareTo(DateTime.parse(
                                          //                 controller
                                          //                     .endDateController
                                          //                     .text)) <=
                                          //         0)
                                          // if (dateFormat
                                          //             .parse(controller
                                          //                 .travelExpenseModel!
                                          //                 .data![index]
                                          //                 .createdDate!
                                          //                 .split(" ")[0])
                                          //             .compareTo(DateTime.parse(
                                          //                 controller
                                          //                     .startDateController
                                          //                     .text)) >=
                                          //         0 &&
                                          //     dateFormat
                                          //             .parse(controller
                                          //                 .travelExpenseModel!
                                          //                 .data![index]
                                          //                 .createdDate!
                                          //                 .split(" ")[0])
                                          //             .compareTo(DateTime.parse(
                                          //                 controller.endDateController.text)) <=
                                          //         0) ,
                                          {
                                            return MyWidget(
                                              index: index,
                                            );
                                          }
                                          // else {
                                          //   return const SizedBox();
                                          // }
                                        },
                                      ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.index});
  TravelExpenseController controller = Get.put(TravelExpenseController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        height: 13.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35.w,
                  child: Text(
                    controller.filterList.value[index].vehicleType ?? "",
                    style: wheader12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      controller.filterList.value[index].from ?? "",
                      style: wheader10,
                    ),
                    w1,
                    Text("to",
                        style: TextStyle(fontSize: 10.sp, color: Colors.white)),
                    w1,
                    Text(
                      controller.filterList.value[index].to ?? "",
                      style: wheader10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "KM",
                      style: wheader10,
                    ),
                    w2,
                    Text(controller.filterList.value[index].distance ?? "",
                        style: TextStyle(fontSize: 10.sp, color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Amount",
                      style: wheader10,
                    ),
                    w2,
                    Text(
                        '₹ ${controller.filterList.value[index].taAmount ?? ""}',
                        style: TextStyle(fontSize: 10.sp, color: Colors.white)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.filterList.value[index].createdDate.toString(),
                      style: wheader12,
                    ),
                  ],
                ),
                w4,
                controller.filterList.value[index].createdDate.toString() ==
                        DateFormat("dd-MM-y").format(DateTime.now()).toString()
                    ? PopupMenuButton<String>(
                        onSelected: (value) async {
                          if (value == "edit") {
                            Get.to(() => UpdateTravelExpense(), arguments: {
                              "id": controller.filterList.value[index].taId
                            });
                            // controller.backendimage = controller
                            //     .filterList.value[index].imageEnd as RxString?;
                            controller.iseditable.value = controller
                                .filterList.value[index].fixedrate
                                .toString();
                            controller.getFixedRate.value = double.parse(
                                controller.filterList.value[index].taAmount
                                    .toString());
                            controller.vehicleTypeCtrle.text = controller
                                .filterList.value[index].vehicleType
                                .toString();
                            controller.fromCtrl.text = controller
                                .filterList.value[index].from
                                .toString();
                            controller.toCtrl.text = controller
                                .filterList.value[index].to
                                .toString();
                            controller.amtCtrl.text = controller
                                .filterList.value[index].taAmount
                                .toString();
                            controller.getDistance.value = double.parse(
                                controller.filterList.value[index].distance
                                    .toString());
                            controller.distanseCtrl.text = controller
                                .filterList.value[index].distance
                                .toString();
                            controller.remarks.text = controller
                                .filterList.value[index].taRemarks
                                .toString();
                          } else {
                            expDelete(context, index, () async {
                              controller.deleteTravelbill(
                                  controller.filterList.value[index].taId!);
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
                                )),
                            const PopupMenuItem(
                                value: "delete", child: Text("Delete"))
                          ];
                        })
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

show(context, index, String id, void Function() onTap) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          //  height:80.h,
          width: 100.w,
          child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.all(2.h),
                  height: 30.h,
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                        size: 23.sp,
                        color: Colors.black,
                      ),
                      h1,
                      Text(
                        "Warning",
                        style: header12,
                      ),
                      h1,
                      Text(
                        "Do you Want Delete",
                        style: header12,
                      ),
                      h2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              onTap();
                            },
                            child: Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: bColor,
                                  borderRadius: BorderRadius.circular(13)),
                              child: Center(
                                  child: Text(
                                'Yes',
                                style: header12.copyWith(color: Colors.white),
                              )),
                            ),
                          ),
                          w2,
                          GestureDetector(
                            onTap: () {
                              return Get.back();
                            },
                            child: Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: bColor,
                                  borderRadius: BorderRadius.circular(13)),
                              child: Center(
                                  child: Text(
                                'No',
                                style: header12.copyWith(color: Colors.white),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        );
      });
}
