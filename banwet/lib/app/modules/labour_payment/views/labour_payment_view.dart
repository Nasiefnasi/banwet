// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/office_expense/views/office_expense_view.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common2date.dart';
import '../../../common_widegt/common_header.dart';
import '../../../common_widegt/loading.dart';
import '../../../common_widegt/submitpage.dart';
import '../controllers/labour_payment_controller.dart';
import 'add_labour_payment.dart';

class LabourPaymentView extends GetView<LabourPaymentController> {
  LabourPaymentView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  LabourPaymentController controller = Get.put(LabourPaymentController());
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
                      text: 'Labour Payment',
                      onpress: () {
                        controller.clear();
                        Get.to(() => AddLabourPayment());
                      },
                    ),
                    // Common2Date(
                    //   ontap: () {
                    //     controller.filteringData();
                    //     controller.change();
                    //     // controller.change(controller.startDateController.text,
                    //     //     controller.startDate.toString());
                    //   },
                    //   statDate: controller.startDateController,
                    //   endDate: controller.endDateController,
                    //   startDateValue: controller.startDate,
                    //   endDateValue: controller.endDate,
                    //   onPressed: () {
                    //     controller.filteringData();
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
                    h4,
                    Obx(
                      () => controller.isShow.value
                          ? Center(child: loadingthreebounce)
                          : controller.filterList.isEmpty
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
                                  bottombar: 4,
                                )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.filterList.length,
                                  itemBuilder: (context, index) {
                                    log("=============== ${dateFormat.parse(controller.startDateController.text)}");
                                    if (dateFormat
                                                .parse(controller
                                                    .labourPaymentModel!
                                                    .data![index]
                                                    .createdDate!)
                                                .compareTo(DateTime.parse(
                                                    controller
                                                        .startDateController
                                                        .text)) >=
                                            0 &&
                                        dateFormat
                                                .parse(controller
                                                    .labourPaymentModel!
                                                    .data![index]
                                                    .createdDate!)
                                                .compareTo(DateTime.parse(
                                                    controller.endDateController
                                                        .text)) <=
                                            0) {
                                      return Lab(
                                        index: index,
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  },
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

class Lab extends StatelessWidget {
  Lab({super.key, required this.index});
  LabourPaymentController controller = Get.put(LabourPaymentController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      height: 9.h,
      width: 100.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54.withOpacity(0.1)),
          color: bColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 27.w,
                child: Text(
                  controller.filterList[index].labourName ?? "",
                  style: wheader12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              h1,
              controller.filterList[index].work_type == null
                  ? const SizedBox()
                  : Text(
                      controller.filterList[index].work_type ?? "",
                      style: wheader9,
                    ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paid Amount',
                    style: wheader12,
                  ),
                  Row(
                    children: [
                      Text(
                        '₹',
                        style: TextStyle(fontSize: 11.sp, color: Colors.white),
                      ),
                      w1,
                      Text(
                        controller.filterList[index].trAmount ?? "",
                        style: wheader12.copyWith(fontSize: 9.5.sp),
                      ),
                    ],
                  ),
                ],
              ),
              w15,
              // controller.filterList[index].createdDate
              //             .toString() ==
              //         DateFormat("dd-MM-y").format(DateTime.now()).toString()
              //     ? PopupMenuButton<String>(
              //         onSelected: (value) {
              //           if (value == "update") {
              //             // Get.to(() => const UpdateLabourPayment());
              //           } else {
              //             // log("zsdfxcgbhj,m;l'./ ");
              //           }
              //         },
              //         icon: const Icon(
              //           Icons.more_vert_outlined,
              //           color: Colors.black,
              //         ),
              //         color: Colors.white,
              //         itemBuilder: (context) {
              //           return [
              //             PopupMenuItem(
              //                 value: "update",
              //                 padding: EdgeInsets.zero,
              //                 onTap: () {
              //                   //  Get.toNamed('/expenseUpdate');
              //                 },
              //                 child: Container(
              //                   padding: EdgeInsets.only(left: 2.h),
              //                   width: 28.w,
              //                   height: 3.h,
              //                   child: const Text(
              //                     "Edit",
              //                   ),
              //                 )),
              //             PopupMenuItem(
              //                 onTap: () async {},
              //                 value: "edit",
              //                 child: const Text("Delete"))
              //           ];
              //         })
              //     : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
