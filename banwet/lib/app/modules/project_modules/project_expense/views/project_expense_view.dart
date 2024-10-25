import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/project_expense/views/update_project_expense.dart';
import 'package:banwet/app/style/const.dart';

import '../../../../common_widegt/common2date.dart';
import '../../../../common_widegt/deletedialoge.dart';
import '../../../../common_widegt/loading.dart';
import '../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/project_expense_controller.dart';
import 'addproject_expense.dart';

class ProjectExpenseView extends GetView<ProjectExpenseController> {
  ProjectExpenseView({Key? key}) : super(key: key);
  @override
  ProjectExpenseController controller = Get.put(ProjectExpenseController());
  @override
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              h2,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  children: [
                    // h2,
                    ProjectNameTitile(
                      projectName: controller.argumnetData["workname"] ?? "",
                      screenTitile: "Expense List ",
                      onTap: () {
                        controller.clear();
                        Get.to(() => AddOfficeProjectExpense());
                      },
                    ),
                    h2,
                    Common2Date(
                      ontap: () {
                        controller.change();
                      },
                      statDate: controller.startDateController,
                      endDate: controller.endDateController,
                      startDateValue: controller.startDate,
                      endDateValue: controller.endDate,
                      onPressed: () {
                        controller.update();
                        controller
                            .filteringData(controller.expenseHomeModel!.data!);
                      },
                    ),
                    h2,
                    // GetBuilder<ProjectExpenseController>(
                    //   builder: (controller) => StatusWidget(
                    //       firstCount: controller.paidCont,
                    //       firstString: "Paid",
                    //       secondCount: controller.partiallyPaidCount,
                    //       secondString: "Partially Paid",
                    //       thirdCount: controller.notPaidCount,
                    //       thirdString: "Not Paid"),
                    //   init: ProjectExpenseController(),
                    // ),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(child: Exenseviewlist(dateFormat: dateFormat))
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

class Exenseviewlist extends StatelessWidget {
  const Exenseviewlist({
    super.key,
    required this.dateFormat,
  });

  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return GetBuilder<ProjectExpenseController>(builder: (controller) {
      controller.notPaidCount = 0;
      controller.partiallyPaidCount = 0;
      controller.paidCont = 0;
      if (controller.expenseHomeModel?.data == null ||
          controller.expenseloading.value) {
        return Center(child: loadingthreebounce);
      } else if (controller.filteredList.value.length == 0) {
        return Center(
          child: Lottie.asset(
              repeat: false, "assets/images/qrbRtDHknE.json", height: 250),
        );
      } else {
        return Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: mediaquery.height * 0.5,
          ),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.expenseHomeModel!.data!.length,
            itemBuilder: (context, index) {
              if (dateFormat
                          .parse(controller
                              .expenseHomeModel!.data![index].createdDate!)
                          .compareTo(DateTime.parse(
                              controller.startDateController.text)) >=
                      0 &&
                  dateFormat
                          .parse(controller
                              .expenseHomeModel!.data![index].createdDate!)
                          .compareTo(DateTime.parse(
                              controller.endDateController.text)) <=
                      0) {
                return MyWidget1(
                  index: index,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        );
      }
    });
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.index});
  ProjectExpenseController controller = Get.put(ProjectExpenseController());
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
                RichText(
                    text: TextSpan(
                        text: "Expense Type : ",
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        children: [
                      TextSpan(
                        text: controller.expenseHomeModel!.data![index]
                                .expenseHeadName ??
                            "",
                      )
                    ])),
                // SizedBox(
                //   width: 35.w,
                //   child: Text(
                // controller.expenseHomeModel!.data![index].expenseHeadName ??
                //     "",
                //     style: wheader12,
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),
                Row(
                  children: [
                    Text(
                      "Payable",
                      style: wheader10,
                    ),
                    w2,
                    Text(
                        '₹ ${controller.expenseHomeModel!.data![index].payableAmount ?? ""}',
                        style: TextStyle(fontSize: 10.sp, color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Paid",
                      style: wheader10,
                    ),
                    w2,
                    Text(
                        '₹ ${controller.expenseHomeModel?.data?[index].totalPaid ?? ""}',
                        style: TextStyle(fontSize: 10.sp, color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Balance",
                      style: wheader10,
                    ),
                    w2,
                    Text(
                        '₹ ${double.tryParse(controller.expenseHomeModel!.data![index].balanceAmount!)?.toStringAsFixed(2)}',
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
                      //  startDate.toString(),

                      controller.expenseHomeModel!.data![index].createdDate
                          .toString(),
                      style: wheader12,
                    ),
                  ],
                ),
                w4,
                controller.expenseHomeModel!.data![index].createdDate
                            .toString() ==
                        DateFormat("dd-MM-y").format(DateTime.now()).toString()
                    ? PopupMenuButton<String>(
                        onSelected: (value) {
                          if ("delete" == value) {
                            expDelete(context, index, () {
                              controller.delateBillExpense(controller
                                  .expenseHomeModel!.data![index].billId
                                  .toString());
                            });
                          } else if ("edite" == value) {
                            log("${controller.expenseHomeModel!.data![index].taxAmount!}/000000000000");
                            Get.to(() => UpdateProjectExpense(), arguments: {
                              "workid": controller.argumnetData["workid"] ?? "",
                              "billid": controller
                                  .expenseHomeModel!.data![index].billId
                                  .toString(),
                              "taxid": controller
                                  .expenseHomeModel!.data![index].taxPercent
                                  .toString(),
                              "taxAmount": double.parse(controller
                                      .expenseHomeModel
                                      ?.data?[index]
                                      .taxAmount ??
                                  "0"),
                              "expenseHeadId": controller
                                  .expenseHomeModel!.data![index].expenseHeadId
                                  .toString(),
                              "expTypeCtrl": controller.expenseHomeModel!
                                  .data![index].expenseHeadName
                                  .toString(),
                              "billNumber": controller
                                  .expenseHomeModel!.data![index].billNo
                                  .toString(),
                              "billAmountController": controller
                                  .expenseHomeModel!.data![index].grossAmount!
                                  .toString(),
                              "totalGrossAmount": double.parse(controller
                                  .expenseHomeModel!
                                  .data![index]
                                  .payableAmount!),
                              "billAmounts": double.parse(controller
                                      .expenseHomeModel
                                      ?.data?[index]
                                      .grossAmount ??
                                  "0"),
                              "taxpersentages": double.parse(controller
                                  .expenseHomeModel!
                                  .data![index]
                                  .taxPercentage!),
                              "consineeName": controller
                                  .expenseHomeModel!.data![index].consignee!
                                  .toString(),
                              "billremarks": controller
                                  .expenseHomeModel!.data![index].remarks!
                                  .toString(),
                              "expenseHeader": controller.expenseHomeModel!
                                      .data![index].expenseHeadName ??
                                  "".toString(),
                              "billDate": controller
                                  .expenseHomeModel!.data![index].billDate!
                                  .toString(),
                              "taxPercentage": controller
                                  .expenseHomeModel!.data![index].taxPercentage!
                                  .toString(),
                            });
                            controller.taxid = controller
                                .expenseHomeModel!.data![index].taxPercent
                                .toString();
                            controller.expenseHeadId = controller
                                .expenseHomeModel!.data![index].expenseHeadId
                                .toString();
                            controller.expTypeCtrl.text = controller
                                .expenseHomeModel!.data![index].expenseHeadName
                                .toString();
                            controller.billNumber.text = controller
                                .expenseHomeModel!.data![index].billNo
                                .toString();
                            controller.billAmountController.text = controller
                                .expenseHomeModel!.data![index].grossAmount!
                                .toString();
                            controller.totalGrossAmount.value = double.parse(
                                controller.expenseHomeModel!.data![index]
                                    .payableAmount!);
                            controller.billAmounts.value = double.parse(
                                controller.expenseHomeModel!.data![index]
                                    .grossAmount!);
                            controller.taxpersentages.value = double.parse(
                                controller.expenseHomeModel!.data![index]
                                    .taxPercentage!);
                            controller.consineeName.text = controller
                                .expenseHomeModel!.data![index].consignee!
                                .toString();
                            controller.billremarks.text = controller
                                .expenseHomeModel!.data![index].remarks!
                                .toString();
                            controller.expenseHeader.text = controller
                                .expenseHomeModel!.data![index].expenseHeadName!
                                .toString();
                            controller.billDate.text = controller
                                .expenseHomeModel!.data![index].billDate!
                                .toString();
                            controller.taxPersentage.text = controller
                                .expenseHomeModel!.data![index].taxPercentage!
                                .toString();

                            log(controller
                                .expenseHomeModel!.data![index].taxPercentage!
                                .toString());
                          } else if (value == "delete") {
                            expDelete(context, index, () async {
                              controller.delateBillExpense(
                                controller
                                    .expenseHomeModel!.data![index].billId!
                                    .toString(),
                              );
                            });
                          }
                        },
                        icon: const Icon(Icons.more_vert_outlined,
                            color: Colors.white),
                        surfaceTintColor: Colors.white,
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                padding: EdgeInsets.zero,
                                value: "edite",
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

class MyWidget1 extends StatelessWidget {
  MyWidget1({super.key, required this.index});
  ProjectExpenseController controller = Get.put(ProjectExpenseController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 15),
        // height: 13.h,
        // width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.expenseHomeModel!.data![index].expenseHeadName ??
                      "",
                  style: wheader13.copyWith(fontFamily: regular, fontSize: 14),
                ),
                h1,
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    controller.expenseHomeModel?.data?[index].createdDate ?? "",
                    style: wheader11,
                    // DateFormat('dd-MMM-yyyy').format(
                    //   DateFormat('dd-MM-yyyy').parse(
                    // controller
                    //         .expenseHomeModel?.data?[index].createdDate ??
                    //     "",
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    const Spacer(),
                    RichText(
                        text: TextSpan(
                            text: "₹ ",
                            style: TextStyle(fontSize: 11.sp),
                            children: [
                          TextSpan(
                              text: controller.expenseHomeModel!.data![index]
                                      .payableAmount ??
                                  "",
                              style: wheader11)
                        ])),
                    // Text(
                    //   //  startDate.toString(),

                    //   "₹${controller.expenseHomeModel!.data![index].payableAmount}",
                    //   style: wheader12,
                    // ),
                    controller.expenseHomeModel!.data![index].createdDate
                                .toString() ==
                            DateFormat("dd-MM-y")
                                .format(DateTime.now())
                                .toString()
                        ? PopupMenuButton<String>(
                            onSelected: (value) {
                              if ("delete" == value) {
                                expDelete(context, index, () {
                                  controller.delateBillExpense(controller
                                      .expenseHomeModel!.data![index].billId
                                      .toString());
                                });
                              } else if ("edite" == value) {
                                log("${controller.expenseHomeModel!.data![index].taxAmount!}/000000000000");
                                Get.to(() => UpdateProjectExpense(),
                                    arguments: {
                                      "workid":
                                          controller.argumnetData["workid"] ??
                                              "",
                                      "billid": controller
                                          .expenseHomeModel!.data![index].billId
                                          .toString(),
                                      "taxid": controller.expenseHomeModel!
                                          .data![index].taxPercent
                                          .toString(),
                                      "taxAmount": double.parse(controller
                                              .expenseHomeModel
                                              ?.data?[index]
                                              .taxAmount ??
                                          "0"),
                                      "expenseHeadId": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .expenseHeadId
                                          .toString(),
                                      "expTypeCtrl": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .expenseHeadName
                                          .toString(),
                                      "billNumber": controller
                                          .expenseHomeModel!.data![index].billNo
                                          .toString(),
                                      "billAmountController": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .grossAmount!
                                          .toString(),
                                      "totalGrossAmount": double.parse(
                                          controller.expenseHomeModel!
                                              .data![index].payableAmount!),
                                      "billAmounts": double.parse(controller
                                              .expenseHomeModel
                                              ?.data?[index]
                                              .grossAmount ??
                                          "0"),
                                      "taxpersentages": double.parse(controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .taxPercentage!),
                                      "consineeName": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .consignee!
                                          .toString(),
                                      "billremarks": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .remarks!
                                          .toString(),
                                      "expenseHeader": controller
                                              .expenseHomeModel!
                                              .data![index]
                                              .expenseHeadName ??
                                          "".toString(),
                                      "billDate": controller.expenseHomeModel!
                                          .data![index].billDate!
                                          .toString(),
                                      "taxPercentage": controller
                                          .expenseHomeModel!
                                          .data![index]
                                          .taxPercentage!
                                          .toString(),
                                    });
                                controller.taxid = controller
                                    .expenseHomeModel!.data![index].taxPercent
                                    .toString();
                                controller.expenseHeadId = controller
                                    .expenseHomeModel!
                                    .data![index]
                                    .expenseHeadId
                                    .toString();
                                controller.expTypeCtrl.text = controller
                                    .expenseHomeModel!
                                    .data![index]
                                    .expenseHeadName
                                    .toString();
                                controller.billNumber.text = controller
                                    .expenseHomeModel!.data![index].billNo
                                    .toString();
                                controller.billAmountController.text =
                                    controller.expenseHomeModel!.data![index]
                                        .grossAmount!
                                        .toString();
                                controller.totalGrossAmount.value =
                                    double.parse(controller.expenseHomeModel!
                                        .data![index].payableAmount!);
                                controller.billAmounts.value = double.parse(
                                    controller.expenseHomeModel!.data![index]
                                        .grossAmount!);
                                controller.taxpersentages.value = double.parse(
                                    controller.expenseHomeModel!.data![index]
                                        .taxPercentage!);
                                controller.consineeName.text = controller
                                    .expenseHomeModel!.data![index].consignee!
                                    .toString();
                                controller.billremarks.text = controller
                                    .expenseHomeModel!.data![index].remarks!
                                    .toString();
                                controller.expenseHeader.text = controller
                                    .expenseHomeModel!
                                    .data![index]
                                    .expenseHeadName!
                                    .toString();
                                controller.billDate.text = controller
                                    .expenseHomeModel!.data![index].billDate!
                                    .toString();
                                controller.taxPersentage.text = controller
                                    .expenseHomeModel!
                                    .data![index]
                                    .taxPercentage!
                                    .toString();

                                log(controller.expenseHomeModel!.data![index]
                                    .taxPercentage!
                                    .toString());
                              } else if (value == "delete") {
                                expDelete(context, index, () async {
                                  controller.delateBillExpense(
                                    controller
                                        .expenseHomeModel!.data![index].billId!
                                        .toString(),
                                  );
                                });
                              }
                            },
                            icon: const Icon(Icons.more_vert,
                                color: Colors.white),
                            surfaceTintColor: Colors.white,
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                    padding: const EdgeInsets.only(),
                                    value: "edite",
                                    child: Container(
                                      padding: EdgeInsets.only(left: 2.h),
                                      width: 28.w,
                                      // height: 3.h,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
