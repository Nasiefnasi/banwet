// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/home_layout/controllers/home_layout_controller.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common2date.dart';
import '../../../common_widegt/common_header.dart';
import '../../../common_widegt/deletedialoge.dart';
import '../../../common_widegt/loading.dart';
import '../controllers/add_officeexpence_controller.dart';
import '../controllers/office_expense_controller.dart';
import 'add_office_expense.dart';
import 'update_office_expense.dart';

class OfficeExpenseView extends GetView<OfficeExpenseController> {
  OfficeExpenseView({Key? key}) : super(key: key);

  AddfficeExpenseController controller1 = Get.put(AddfficeExpenseController());
  @override
  OfficeExpenseController controller = Get.put(OfficeExpenseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 8,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                h2,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Column(
                    children: [
                      CommonTitile(
                        text: 'Office Expense',
                        onpress: () async {
                          controller1.edit1.value = false;
                          controller1.update();
                          await controller1.paidAccount();
                          Get.to(() {
                            controller.taxPersentage.clear();
                            return AddOfficeExpense();
                          });
                        },
                      ),
                      h1,
                      // Common2Date(
                      //   ontap: () {
                      //     controller.change();
                      //     controller.filteringData();
                      //     controller.update();
                      //   },
                      //   statDate: controller.startDateController,
                      //   endDate: controller.endDateController,
                      //   startDateValue: controller.startDate,
                      //   endDateValue: controller.endDate,
                      //   onPressed: () {
                      //     controller.filteringData();
                      //     controller.update();
                      //   },
                      // ),
                      HomeDate(
                        startdatesout: (p0) async {
                          controller.startdates = p0;
                          await controller.filteringData();
                          controller.update();
                        },
                        entdatesout: (p0) async {
                          controller.enddates = p0;
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

                      h2,

                      const OfficeexpenselistItems(),
                      // Container(
                      //   color: Colors.green,
                      //   child: GetBuilder<OfficeExpenseController>(
                      //     builder: (controller) => controller
                      //                 .filterList.value ==
                      //             null
                      //         ? Center(child: loadingthreebounce)
                      //         : controller.filterList.value.isEmpty
                      //             ? Center(
                      //                 child: Lottie.asset(
                      //                     repeat: false,
                      //                     "assets/images/qrbRtDHknE.json",
                      //                     height: 250),
                      //               )
                      //             : ListView.builder(
                      //                 physics:
                      //                     const NeverScrollableScrollPhysics(),
                      //                 shrinkWrap: true,
                      //                 itemCount:
                      //                     controller.filterList.value.length,
                      //                 itemBuilder: (context, index) {
                      //                   var createdDate = dateFormat.parse(
                      //                     controller.expenseHomeModel!
                      //                         .data![index].createdDate!,
                      //                   );
                      //                   if (dateFormat
                      //                               .parse(controller
                      //                                   .expenseHomeModel!
                      //                                   .data![index]
                      //                                   .createdDate!)
                      //                               .compareTo(DateTime.parse(
                      //                                   controller
                      //                                       .startDateController
                      //                                       .text)) >=
                      //                           0 &&
                      //                       dateFormat
                      //                               .parse(controller
                      //                                   .expenseHomeModel!
                      //                                   .data![index]
                      //                                   .createdDate!)
                      //                               .compareTo(DateTime.parse(
                      //                                   controller
                      //                                       .endDateController
                      //                                       .text)) <=
                      //                           0)

                      //                   // if (createdDate.compareTo(dateFormat
                      //                   //             .parse(controller
                      //                   //                 .startDateController
                      //                   //                 .text)) >=
                      //                   //         0 &&
                      //                   //     createdDate.compareTo(dateFormat
                      //                   //             .parse(controller
                      //                   //                 .endDateController
                      //                   //                 .text)) <=
                      //                   //         0),
                      //                   {
                      //                     return MyWidget(
                      //                       index: index,
                      //                       data: controller
                      //                           .expenseHomeModel!.data![index],
                      //                     );
                      //                   } else {
                      //                     return const SizedBox();
                      //                   }
                      //                 },
                      //               ),
                      //     init: OfficeExpenseController(),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OfficeexpenselistItems extends StatefulWidget {
  const OfficeexpenselistItems({
    super.key,
    // required this.controller,
    // required this.dateFormat,
  });

  @override
  State<OfficeexpenselistItems> createState() => _OfficeexpenselistItemsState();
}

class _OfficeexpenselistItemsState extends State<OfficeexpenselistItems> {
  @override
  void initState() {
    super.initState();
    setState(() {
      OfficeExpenseController().dateformats();
      // OfficeExpenseController().update();
    });

    OfficeExpenseController().getDetails();
  }

  // final OfficeExpenseController controller;
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    return GetBuilder<OfficeExpenseController>(
      builder: (controller) => Obx(
        () => controller.isShow.value
            ? Center(
                child: loadingthreebounce,
              )
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
                    bottombar: 1,
                  )
                : Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.filterList.value.length,
                      itemBuilder: (context, index) {
                        // var createdDate = dateFormat.parse(
                        //   controller.expenseHomeModel!.data![index].createdDate!,
                        // );
                        // if (dateFormat
                        //             .parse(controller
                        //                 .filterList.value[index].createdDate!)
                        //             .compareTo(DateTime.parse(
                        //                 controller.startDateController.text)) >=
                        //         0 &&
                        //     dateFormat
                        //             .parse(controller
                        //                 .filterList.value[index].createdDate!)
                        //             .compareTo(DateTime.parse(
                        //                 controller.endDateController.text)) <=
                        //         0)

                        // if (createdDate.compareTo(dateFormat.parse(
                        //             controller.startDateController.text)) >=
                        //         0 &&
                        //     createdDate.compareTo(dateFormat
                        //             .parse(controller.endDateController.text)) <=
                        //         0)
                        // {
                        return Obx(
                          () => MyWidget(
                            index: index,
                            data: controller.filterList.value[index],
                          ),
                        );
                        // } else {
                        //   return const SizedBox();
                        // }
                      },
                    ),
                  ),
      ),
    );
  }
}

class BottomNavBarSearchingIcon extends StatelessWidget {
  const BottomNavBarSearchingIcon({super.key, this.bottombar});
  final int? bottombar;

  @override
  Widget build(BuildContext context) {
    HomeLayoutController controller3 = Get.put(HomeLayoutController());
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: Center(
          child: Lottie.asset(
              repeat:
                  controller3.tapSelectIndex.value == bottombar ? false : true,
              "assets/images/qrbRtDHknE.json",
              height: 250),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.index, required this.data});
  final data;
  OfficeExpenseController controller = Get.put(OfficeExpenseController());
  OfficeExpenseController scontroller = Get.put(OfficeExpenseController());
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
                    data.expenseHeadName ?? "",
                    style: wheader12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Payable",
                      style: wheader10,
                    ),
                    w2,
                    Text('₹ ${data.payableAmount ?? ""}',
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
                    Text('₹ ${data.totalPaid ?? ""}',
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
                    Text('₹ ${double.tryParse(data.balanceAmount!)}',
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
                      data.createdDate.toString(),

                      // DateFormat('dd MMM yyyy').format(
                      //   DateFormat('dd-MM-yyyy').parse(
                      //     data.createdDate.toString(),
                      //   ),
                      // ),
                      style: wheader12,
                    ),
                  ],
                ),
                w4,
                data.createdDate.toString() ==
                        DateFormat("dd-MM-y").format(DateTime.now()).toString()
                    ? PopupMenuButton<String>(
                        onSelected: (value) async {
                          if (value == "edite") {
                            await controller.clear();
                            Get.to(() => UpdateOfficeExpense(), arguments: {
                              "billid": controller
                                  .expenseHomeModel!.data![index].billId
                                  .toString(),
                            });
                            controller.expenseHeadId = controller
                                .expenseHomeModel!.data![index].expenseHeadId;
                            controller.taxid = controller
                                .expenseHomeModel!.data![index].taxPercent
                                .toString();
                            controller.expTypeCtrl.text = data.expenseHeadName;
                            // controller
                            //     .expenseHomeModel!.data![index].expenseHeadName
                            //     .toString();
                            controller.billNumber.text = controller
                                .expenseHomeModel!.data![index].billNo
                                .toString();
                            controller.billAmountController.text = controller
                                .expenseHomeModel!.data![index].grossAmount!
                                .toString();
                            controller.totalGrossAmount.value =
                                double.parse(data.payableAmount!);
                            controller.billAmount.value =
                                double.parse(data.grossAmount!);
                            controller.taxpersentage.value =
                                double.parse(data.taxPercentage!);
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
                          } else if (value == "delete") {
                            expDelete(context, index, () async {
                              controller.delateBillExpense(
                                controller
                                    .expenseHomeModel!.data![index].billId!
                                    .toString(),
                              );
                            });
                          } else {}
                        },
                        icon: const Icon(Icons.more_vert_outlined,
                            color: Colors.white),
                        surfaceTintColor: Colors.white,
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                                value: "edite",
                                child: Text(
                                  "Edit",
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
