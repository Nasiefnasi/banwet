// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/WageModel/groupwageslip.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/labour_wageslip_controller.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';

class Groupwagesliplist extends GetView<LabourWageslipController> {
  const Groupwagesliplist(this.team_leader_id, this.perviousbalance, this.date,
      {super.key});
  final team_leader_id;
  final perviousbalance;
  final String date;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: 'refresh');
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => SubmitButtons(
              isLoading: controller.groupwagelaoding,
              text: 'Submit - ${controller.groupquickWage.length.toString()}',
              onTap: () {
                if (controller.groupquickWage.isNotEmpty) {
                  controller.groupwagesubmit(
                    controller.dateFormat.format(DateTime.parse(date
                        .toString())), // controller.dateFormat.format(DateTime.parse(date.toString())),
                    controller.groupwageremarks.text.toString(),
                    team_leader_id,
                  );
                }
              },
            ),
          ),
        ),
        // bottomNavigationBar: GestureDetector(
        //   onTap: () async {
        //     // for (int i = 0; i < controller.groupquickWage.length; i++) {
        //     //   print(
        //     //       "${i}" "no of" "${controller.groupquickWage[i].nooflabours}");
        //     // }

        //     if (controller.groupquickWage.isNotEmpty) {
        //       controller.groupwagesubmit(
        //         controller.dateFormat.format(DateTime.parse(date
        //             .toString())), // controller.dateFormat.format(DateTime.parse(date.toString())),
        //         controller.groupwageremarks.text.toString(),
        //         team_leader_id,
        //       );
        //     }
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Container(
        //       height: 7.h,
        //       width: 100.w,
        //       decoration: BoxDecoration(
        //           color: bColor, borderRadius: BorderRadius.circular(12)),
        //       child: Center(
        //         child: Obx(() => controller.isLoading.value
        //             ? SpinKitThreeBounce(color: bColor)
        //             : Text(
        //                 'Submit - ${controller.groupquickWage!.length.toString()}',
        //                 style: header15.copyWith(color: Colors.white),
        //               )),
        //       ),
        //     ),
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ProjectNameTitile(
                    back: () => Get.back(result: 'refresh'),
                    addbutton: const SizedBox(),
                    projectName: controller.argumentData["workname"],
                    screenTitile: "Group Wage Slip",
                    onTap: () {
                      // Get.to(() => AddLabourActivity());
                    },
                  ),
                  h2,
                  SizedBox(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.grey,
                          size: 20,
                        ),
                        w1,
                        Text(
                          controller.dateFormat
                              .format(DateTime.parse(date.toString())),
                          style: TextStyle(fontSize: 14, fontFamily: regular),
                        ),
                      ],
                    ),
                  ),
                  h2,
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              child: LabourWageclass(
                                  perviousbalance: perviousbalance.toString()),
                              width: double.infinity,
                            ),
                            h2,
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: SizedBox(
                                        height: 2.5.h,
                                        child: Image.asset(
                                          "assets/images/groupwage.png",
                                        )),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      style: header11.copyWith(
                                        color: Colors.black,
                                      ),
                                      maxLines: 5,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        hintText: "Wage Slip Remarks",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        contentPadding:
                                            EdgeInsets.only(top: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.black26, width: 1)),
                            ),
                            h2,
                            GroupWageCount(perviousbalance),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

class GroupWageCount extends GetView<LabourWageslipController> {
  GroupWageCount(
    this.previousbalance, {
    super.key,
  });
  final previousbalance;
  // var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  LabourWageslipController controller = Get.put(LabourWageslipController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 10.h,
      width: 100.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdfdfdf)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Present',
                          style: TextStyle(fontSize: 11, fontFamily: regular)),
                      Obx(() {
                        return Text(
                          // controller.groupWageLabourfilterlist==null?"0":
                          controller.groupquickWage.length.toString(),

                          // controller.presentWage.length.toString(),
                          style: header12.copyWith(
                              color: Colors.black,
                              fontSize: 13.5.sp,
                              fontFamily: SemiBold,
                              fontWeight: FontWeight.w500),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              w2,
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdfdfdf)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Wage Amount',
                          style: TextStyle(fontSize: 11, fontFamily: regular)),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('₹',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    // fontFamily: SemiBold,
                                    fontSize: 13.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            w1,
                            Obx(() => Text(
                                  "${controller.groupwagetotalAmount.value}",
                                  style: header12.copyWith(
                                      fontFamily: SemiBold,
                                      color: Colors.black,
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          h2,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdfdfdf)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Previous Balance',
                          style: TextStyle(fontSize: 11, fontFamily: regular)),
                      Obx(() {
                        return Text(
                          previousbalance.toString(),

                          // controller.presentWage.length.toString(),
                          style: header12.copyWith(
                              color: Colors.black,
                              fontSize: 13.5.sp,
                              fontFamily: SemiBold,
                              fontWeight: FontWeight.w500),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              w2,
              Expanded(
                child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffdfdfdf)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total to Pay',
                          style: TextStyle(fontSize: 11, fontFamily: regular)),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('₹',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    // fontFamily: SemiBold,
                                    fontSize: 13.5.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            w1,
                            Obx(() => Text(
                                  controller.grouptotalpayamount.value
                                      .toString(),
                                  style: header12.copyWith(
                                      fontFamily: SemiBold,
                                      color: Colors.black,
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LabourWageclass extends GetView<LabourWageslipController> {
  const LabourWageclass({super.key, this.perviousbalance});
  final perviousbalance;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      child: GetBuilder<LabourWageslipController>(
        init: LabourWageslipController(),
        builder: (controller) => controller.groupWageLabourfilterlist == null
            ? SpinKitThreeBounce(color: bColor)
            // Center(
            //                   child:
            //                   SizedBox(
            //                       height: dHeight! * 0.5,
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [loadingthreebounce],
            //                       )))

            : controller.groupWageLabourfilterlist!.labours!.length == 0
                ? Center(
                    child: Lottie.asset(
                        repeat: false,
                        "assets/images/qrbRtDHknE.json",
                        height: 250),
                  )
                : SizedBox(
                    // height:
                    //     controller.groupWageLabourfilterlist!.labours!.length * 80.0,
                    width: double.maxFinite,
                    // constraints:
                    //     BoxConstraints(maxHeight: mediaquery.height * 0.61),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller
                              .groupWageLabourfilterlist?.labours?.length ??
                          0,
                      //  controller.wageListModel!.labours!.length,
                      itemBuilder: (context, index) {
                        print("Building item $index"); // Debug log
                        return grouplistwidget(
                          perviousbalance: perviousbalance,
                          index: index,
                        );
                      },
                    ),
                  ),

        //  (controller) {
        //   if (controller.groupWageLabourfilterlist == null) {
        //     return SpinKitThreeBounce(color: bColor);
        //   }
        //   if (controller.groupWageLabourfilterlist!.labours!.isEmpty) {
        //     return const Text("No items");
        //   }
        //   return
        // Container(
        //     // height:
        //     //     controller.groupWageLabourfilterlist!.labours!.length * 80.0,
        //     width: double.maxFinite,
        //     constraints: BoxConstraints(maxHeight: mediaquery.height * 0.61),
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       itemCount:
        //           controller.groupWageLabourfilterlist?.labours?.length ?? 0,
        //       //  controller.wageListModel!.labours!.length,
        //       itemBuilder: (context, index) {
        //         print("Building item $index"); // Debug log
        //         return grouplistwidget(
        //           index: index,
        //         );
        //       },
        //     ),
        //   );
        // },
      ),
    );
  }
}

// class grouplistwidget extends StatelessWidget {
//   grouplistwidget({super.key, required this.index});
//   LabourWageslipController controller = Get.put(LabourWageslipController());
//   final int? index;

//   @override
//   Widget build(BuildContext context) {
//     var details =  controller.groupWageLabourfilterlist!.labours![index!];
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         margin: EdgeInsets.only(bottom: 2.h),
//         padding: EdgeInsets.symmetric(horizontal: 2.h),
//         height: 13.h,
//         width: 100.w,
//         decoration: BoxDecoration(
//             color: bColor, borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 35.w,
//                   child: Text(
//                     details
//                             .labourName ??
//                         "",
//                     // controller.filterList.value[index].vehicleType ?? "",
//                     style: wheader12,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       details.workType ?? "",
//                       style: wheader10,
//                     ),
//                     w1,
//                     Text("to",
//                         style: TextStyle(fontSize: 10.sp, color: Colors.white)),
//                     w1,
//                     Text(
//                       controller.filterList.value[index].to ?? "",
//                       style: wheader10,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "KM",
//                       style: wheader10,
//                     ),
//                     w2,
//                     Text(controller.filterList.value[index].distance ?? "",
//                         style: TextStyle(fontSize: 10.sp, color: Colors.white)),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "Amount",
//                       style: wheader10,
//                     ),
//                     w2,
//                     Text(
//                         '₹ ${controller.filterList.value[index].taAmount ?? ""}',
//                         style: TextStyle(fontSize: 10.sp, color: Colors.white)),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       controller.filterList.value[index].createdDate.toString(),
//                       style: wheader12,
//                     ),
//                   ],
//                 ),
//                 w4,
//                 controller.filterList.value[index].createdDate.toString() ==
//                         DateFormat("dd-MM-y").format(DateTime.now()).toString()
//                     ? PopupMenuButton<String>(
//                         onSelected: (value) {
//                           if (value == "edit") {
//                             Get.to(() => UpdateTravelExpense(), arguments: {
//                               "id": controller.filterList.value[index].taId
//                             });
//                             controller.iseditable.value = controller
//                                 .filterList.value[index].fixedrate
//                                 .toString();
//                             controller.getFixedRate.value = double.parse(
//                                 controller.filterList.value[index].taAmount
//                                     .toString());
//                             controller.vehicleTypeCtrle.text = controller
//                                 .filterList.value[index].vehicleType
//                                 .toString();
//                             controller.fromCtrl.text = controller
//                                 .filterList.value[index].from
//                                 .toString();
//                             controller.toCtrl.text = controller
//                                 .filterList.value[index].to
//                                 .toString();
//                             controller.amtCtrl.text = controller
//                                 .filterList.value[index].taAmount
//                                 .toString();
//                             controller.getDistance.value = double.parse(
//                                 controller.filterList.value[index].distance
//                                     .toString());
//                             controller.distanseCtrl.text = controller
//                                 .filterList.value[index].distance
//                                 .toString();
//                             controller.remarks.text = controller
//                                 .filterList.value[index].taRemarks
//                                 .toString();
//                           } else {
//                             expDelete(context, index, () async {
//                               controller.deleteTravelbill(
//                                   controller.filterList.value[index].taId!);
//                             });
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.more_vert_outlined,
//                           color: Colors.white,
//                         ),
//                         surfaceTintColor: Colors.white,
//                         itemBuilder: (context) {
//                           return [
//                             PopupMenuItem(
//                                 value: "edit",
//                                 padding: EdgeInsets.zero,
//                                 child: Container(
//                                   padding: EdgeInsets.only(left: 2.h),
//                                   width: 28.w,
//                                   height: 3.h,
//                                   child: const Text(
//                                     "Edit",
//                                   ),
//                                 )),
//                             const PopupMenuItem(
//                                 value: "delete", child: Text("Delete"))
//                           ];
//                         })
//                     : const SizedBox()
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class grouplistwidget extends GetView<LabourWageslipController> {
  const grouplistwidget({super.key, this.index, this.perviousbalance});

  final index;
  // ignore: prefer_typing_uninitialized_variables
  final perviousbalance;

  // final LabourWageslipController controller =
  //     Get.put(LabourWageslipController());

  @override
  Widget build(BuildContext context) {
    RxDouble totalvalue = 0.0.obs;
    var mediaquery = MediaQuery.of(context).size;
    var labour = controller.groupWageLabourfilterlist!.labours![index];

    // if (labour == null) {
    //   return Container(
    //     height: mediaquery.height * .21,
    //     margin: EdgeInsets.symmetric(vertical: .5.h),
    //     decoration: BoxDecoration(
    //         color: bColor, borderRadius: BorderRadius.circular(10)),
    //     child: const Center(child: Text('No labour data available')),
    //   );
    // }

    print(
        "Building MyWidget for index $index with labour: ${labour.labourName}"); // Debug log

    return Container(
      // height: mediaquery.height * .21,
      margin: EdgeInsets.symmetric(vertical: .5.h),
      decoration:
          BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
        child: Row(
          children: [
            // Ensure w1 is defined somewhere
            w1,
            SizedBox(
              width: mediaquery.width * .85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 65.w,
                        child: Text(
                          labour.labourName ?? "",
                          style: wheader12.copyWith(
                              fontFamily: Medium, fontSize: 11.sp),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Obx(() {
                        var totalshowlist = totalvalue;

                        //  labour.wagetotalamount.value == 0.0
                        //     ? double.parse(labour.dailyWage.toString()).obs
                        //     : double.parse(
                        //             labour.wagetotalamount.value.toString())
                        //         .obs;

                        return Align(
                          alignment: Alignment.topLeft,
                          child: FlutterSwitch(
                            activeColor: Colors.green,
                            width: 50.0,
                            height: 24.0,
                            valueFontSize: 12.0,
                            toggleSize: 20.0,
                            value: labour.isbuttonn.value,
                            activeTextFontWeight: FontWeight.w400,
                            inactiveTextFontWeight: FontWeight.w400,
                            borderRadius: 30.0,
                            padding: 2.0,
                            showOnOff: true,
                            onToggle: (val) async {
                              labour.isbuttonn.value = val;
                              if (val) {
                                controller.groupquickWage.add(GrouLabourss(
                                  isSelected: labour.isbuttonn.value,
                                  labourId: labour.labourId.toString(),
                                  basicWage: totalshowlist.value.toString(),
                                  extra_wage: labour.extrawage ?? "0",
                                  nooflabours: labour.noLabours ?? "1",
                                  workdays: labour.isdaysbutton.value == true
                                      ? "0.5"
                                      : "1",
                                  overtime_wage: labour.overtimeRate.toString(),
                                  ta_wage: labour.ta.toString(),
                                ));
                              } else {
                                controller.groupquickWage.removeWhere(
                                  (element) =>
                                      element.labourId ==
                                      labour.labourId.toString(),
                                );
                              }
                              await controller.groupWagetotalpresent(
                                  controller.groupquickWage.toList(),
                                  perviousbalance);

                              // labour.isSelected.value = val;
                              // if (val) {
                              //   // if(){}
                              //   controller.quickWage.add(Labourss(
                              //     labourId: labour.labourId.toString(),
                              //     basicWage: labour.dailyWage.toString(),
                              //     overtimeWage:
                              //         labour.overtimeRate?.toString() ?? "0",
                              //     workdays: labour.isdays.value ? "0.5" : "1",
                              //     overtimeduration: "0",
                              //     overtimerate: labour.overtimeRate.toString(),
                              //   ));
                              // } else {
                              //   controller.quickWage.removeWhere((element) =>
                              //       element.labourId ==
                              //       labour.labourId.toString());
                              // }
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      labour.workType ?? "",
                      style: wheader10.copyWith(
                          fontFamily: regular, fontSize: 9.sp),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  h1,
                  Row(
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: () async {
                            var totalshowlist = totalvalue.value.toString();
                            labour.isdaysbutton.value =
                                !labour.isdaysbutton.value;
                            // labour.value = !labour.isdays.value;
                            // labour.isbuttonn.value = !labour.isbuttonn.value;

                            int index = controller.groupquickWage.indexWhere(
                                (element) =>
                                    element.labourId == labour.labourId);
                            if (index != -1) {
                              var totalwagevalue = labour.totalNB.value == 0.0
                                  ? double.parse(labour.dailyWage.toString())
                                      .obs
                                  : double.parse(
                                          labour.totalNB.value.toString())
                                      .obs;

                              var newdetails =
                                  (double.parse(totalwagevalue.value.toString())
                                              .obs *
                                          double.parse(
                                              labour.isdaysbutton.value == true
                                                  ? "0.5"
                                                  : "1"))
                                      .obs;

                              var details = labour.totalOET.value == 0.0
                                  ? 0.0.obs
                                  : labour.totalOET.value;
                              var totals =
                                  double.parse(details.toString()).obs +
                                      double.parse(newdetails.value.toString());
                              controller.groupquickWage[index].workdays =
                                  labour.isdaysbutton.value ? "0.5" : "1";
                              controller.groupquickWage[index].basicWage =
                                  totals.value.toString();

                              await controller.groupWagetotalpresent(
                                  controller.groupquickWage.toList(),
                                  perviousbalance);
                              // controller.groupquickWage.removeWhere(
                              //   (element) =>
                              //       element.labourId ==
                              //       labour.labourId.toString(),
                              // );
                              // controller.groupquickWage.add(GrouLabourss(
                              //   isSelected: labour.isbuttonn.value,
                              //   labourId: labour.labourId.toString(),
                              //   basicWage: totalshowlist.toString(),
                              //   extra_wage: labour.extrawage ?? "0",
                              //   nooflabours: labour.noLabours ?? "1",
                              //   workdays: labour.isdaysbutton.value == true
                              //       ? "0.5"
                              //       : "1",
                              //   overtime_wage: labour.overtimeRate.toString(),
                              //   ta_wage: labour.ta.toString(),
                              // ));
                              // await controller.groupWagetotalpresent(
                              //     controller.groupquickWage!.toList(),
                              //     perviousbalance);
                              // Update the workdays property of the labour at the found index
                              // controller.groupquickWage[index].workdays =
                              //     labour.isdaysbutton.value ? "0.5" : "1";

                              // controller.groupquickWage[index].basicWage =
                              //     await totalshowlist.toString();
                            }

                            await controller.groupWagetotalpresent(
                                controller.groupquickWage.toList(),
                                perviousbalance);
                          },
                          child: Container(
                            // height: 37,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Center(
                              child: Text(
                                labour.isdaysbutton.value != false
                                    ? "Half Day"
                                    : "Full Day",
                                style: header10.copyWith(
                                    fontSize: 12,
                                    fontFamily: Medium,
                                    color: labour.isdaysbutton.value != false
                                        ? Colors.amber
                                        : const Color.fromARGB(
                                            255, 19, 177, 29)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      w2,
                      Obx(() {
                        var totalshowlisst = labour.wagetotalamount.value == 0.0
                            ? double.parse(labour.dailyWage.toString()).obs
                            : double.parse(
                                    labour.wagetotalamount.value.toString())
                                .obs;
                        return InkWell(
                          onTap: () {
                            Groupwageaddon(
                                index,
                                context,
                                labour.isdaysbutton.value,
                                labour.noLabours,
                                totalshowlisst.value.toString(),
                                labour.overtimeRate.toString(),
                                labour.extrawage,
                                labour.ta,
                                labour);
                            // if (labour.isSelected.value) {
                            //   labour.isSelected.value = false;
                            //   controller.quickWage.removeWhere((element) =>
                            //       element.labourId == labour.labourId.toString());
                            // } else {
                            // addWage(
                            //     index,
                            //     context,
                            //     labour.labourName,
                            //     labour.workType,
                            //     labour.dailyWage.toString(),
                            //     labour.labourId.toString(),
                            //     labour.overtimeRate,
                            //     totalshowlistamount,
                            //     labour);
                            // }
                          },
                          child: Container(
                            // height: 37,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF8F8F8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Center(
                              child: Text(
                                "ADD ON",
                                style: header10.copyWith(
                                    fontFamily: Medium,
                                    fontSize: 11,
                                    color: const Color(0xFF737373)),
                              ),
                            ),
                          ),
                        );
                      }),
                      const Spacer(),
                      Container(
                        // color: Colors.amber,
                        child: Obx(
                          () {
                            var totalwagevalue = labour.totalNB.value == 0.0
                                ? double.parse(labour.dailyWage.toString()).obs
                                : double.parse(labour.totalNB.value.toString())
                                    .obs;
// this ios working
// if(){}

                            var newdetails =
                                (double.parse(totalwagevalue.value.toString())
                                            .obs *
                                        double.parse(
                                            labour.isdaysbutton.value == true
                                                ? "0.5"
                                                : "1"))
                                    .obs;

                            // totalwagevalue.value;

                            // double.parse(labour.isdaysbutton.value == true
                            //     ? "0.5"
                            //     : "1");
                            // var data = labour.totalNB.value == 0.0
                            //     ? double.parse("0").obs
                            //     : double.parse(labour.totalNB.value.toString())
                            //         .obs;
                            var details = labour.totalOET.value == 0.0
                                ? 0.0.obs
                                : labour.totalOET.value;
                            var totals = double.parse(details.toString()).obs +
                                double.parse(newdetails.value.toString());
                            // var details = labour.totalOET.value == 0.0
                            //     ? 0.0.obs
                            //     : labour.totalOET.value;

                            totalvalue.value = totals.value;
                            return Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "₹ ",
                                    style: const TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: totals.value.toStringAsFixed(2),
                                        // ; totalwagevalue.value.toString(),
                                        // labour.dailyWage,

                                        //  labour.dailyWage.toString(),
                                        style: wheader11.copyWith(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                            fontFamily: regular),
                                      ),
                                    ],
                                  ),
                                ),
                                w2,
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  h1,
                  // Obx(
                  //   () => labour.isSelected.value == true
                  //       ? RichText(
                  //           text: TextSpan(
                  //             text: "Dated on : ",
                  //             style: wheader12.copyWith(
                  //                 fontFamily: Medium, fontSize: 14),
                  //             children: [
                  //               // TextSpan(
                  //               //   text:
                  //               //       // "${DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(controller.quickWageDateController.text))}",
                  //               //   // "${controller.newregistercasedate.value.day.toString()} - ${controller.newregistercasedate.value.month.toString()} - ${controller.newregistercasedate.value.year}",
                  //               //   // DateFormat('dd MMM yyyy').format(
                  //               //   //   DateFormat('dd-MM-yyyy').parse("01-2-2021"),
                  //               //   // ),
                  //               //   // style: wheader10,
                  //               // ),
                  //             ],
                  //           ),
                  //         )
                  //       : Container(),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> Groupwageaddon(
      index,
      BuildContext context,
      bool days,
      String? nolabours,
      String? basicwage,
      String? overtime,
      String? extrawage,
      String? ta,
      labour) {
    RxDouble basicwagea = double.parse(basicwage.toString()).obs;
    var asicwagea = double.parse(basicwagea.toString());
    calculate() async {
      var data = controller.groupWageLabourfilterlist!.labours![index];
      data.wagetotalamount.value;
      data.totalNB.value =
          //(double.parse(days == true ? "0.5" : "1") *
          (double.parse(nolabours ?? "1") * double.parse(basicwage ?? "0"));
      print(data.totalNB.value.toString());
      // (double.parse(overtime ?? "0") +
      //     double.parse(extrawage ?? "0") +
      //     double.parse(ta ?? "0"));
      data.totalOET.value = (double.parse(overtime ?? "0") +
          double.parse(extrawage ?? "0") +
          double.parse(ta ?? "0"));
      print(data.totalOET.value.toString());
    }

    basicwagedaycalculate(Value) {
      basicwagea.value = double.parse(days == true ? "0.5" : "1") *
          double.parse(Value.toString());
    }
    // calculate() async {
    //   try {
    //     double daysValue = double.parse(days == true ? "0.5" : "1");
    //     double nolaboursValue = double.parse(nolabours?.toString() ?? "1");
    //     double basicwageValue = double.parse(basicwage?.toString() ?? "0");
    //     double overtimeValue = double.parse(overtime?.toString() ?? "0");
    //     double extrawageValue = double.parse(extrawage?.toString() ?? "0");
    //     double taValue = double.parse(ta?.toString() ?? "0");

    //     controller.groupWageLabourfilterlist!.labours![index].wagetotalamount
    //             .value =
    //         (daysValue * nolaboursValue * basicwageValue) +
    //             (overtimeValue + extrawageValue + taValue);
    //   } catch (e) {
    //     // Handle the exception or show an error message
    //     print("Error calculating wage total amount: $e");
    //   }
    // }
    late dynamic totalvalue;
    // calculate() async {
    //   try {
    //     // Debugging prints to check input values
    //     print("Days: $days");
    //     print("No of labours: $nolabours");
    //     print("Basic wage: $basicwage");
    //     print("Overtime: $overtime");
    //     print("Extra wage: $extrawage");
    //     print("TA: $ta");

    //     // Parsing values
    //     double daysValue = double.parse(days == true ? "0.5" : "1");
    //     double nolaboursValue = double.parse(nolabours?.toString() ?? "0");
    //     double basicwageValue = double.parse(basicwage?.toString() ?? "0");
    //     double overtimeValue = double.parse(overtime?.toString() ?? "0");
    //     double extrawageValue = double.parse(extrawage?.toString() ?? "0");
    //     double taValue = double.parse(ta?.toString() ?? "0");

    //     // Print parsed values for debugging
    //     print("Days Value: $daysValue");
    //     print("No of Labours Value: $nolaboursValue");
    //     print("Basic Wage Value: $basicwageValue");
    //     print("Overtime Value: $overtimeValue");
    //     print("Extra Wage Value: $extrawageValue");
    //     print("TA Value: $taValue");

    //     // Perform calculation
    //     double result = (daysValue * nolaboursValue * basicwageValue) +
    //         (overtimeValue + extrawageValue + taValue);

    //     // Update the observable value
    //     totalvalue = controller.groupWageLabourfilterlist!.labours![index]
    //         .wagetotalamount.value = result;

    //     // Print result for debugging
    //     print("Calculated Wage Total Amount: $result");
    //   } catch (e) {
    //     // Handle and debug exceptions
    //     print("Error calculating wage total amount: $e");
    //   }
    // }

    return Get.defaultDialog(
      backgroundColor: Colors.white, radius: 10,
      titlePadding: const EdgeInsets.only(top: 20),
      title: "ADD ON",
      titleStyle: TextStyle(fontSize: 16, fontFamily: Medium), // Optional title
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // h5,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  addonpoppup("Days", (p0) {
                    // days=p0.toString();
                  }, context, "", true, days == true ? "0.5" : "1",
                      Colors.black45),
                  addonpoppup("No Labours", (p0) {
                    nolabours = p0;
                    calculate();
                  }, context, "", false,
                      "${nolabours == 0 ? 1 : nolabours ?? 1}", Colors.black),
                  addonpoppup("Basic Wage", (p0) {
                    basicwage = p0;
                    basicwagedaycalculate(basicwage);
                    calculate();
                  }, context, " ₹", false, "${basicwagea.value ?? 0}",
                      Colors.black),
                ],
              ),
            ),
            h2,
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  addonpoppup("Over Time", (p0) {
                    overtime = p0;
                    calculate();
                  }, context, " ₹", false, "${overtime ?? 0}", Colors.black),
                  addonpoppup("Extra Wage", (p0) {
                    extrawage = p0;
                    calculate();
                  }, context, " ₹", false, "${extrawage ?? 0}", Colors.black),
                  addonpoppup("TA", (p0) {
                    ta = p0;
                    calculate();
                  }, context, " ₹", false, "${ta ?? 0}", Colors.black),
                ],
              ),
            ),
            h3,
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(fontSize: 2.h, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bColor, // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Button radius
                          ),
                        ),
                      ),
                    ),
                  ),
                  w2,
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Obx(() {
                        var totalshowlist = labour.wagetotalamount.value == 0.0
                            ? double.parse(labour.dailyWage.toString()).obs
                            : double.parse(
                                    labour.wagetotalamount.value.toString())
                                .obs;

                        return ElevatedButton(
                          onPressed: () async {
                            // await calculate();
                            bool isSelected = false;
                            // if (controller.groupquickWage.contains(
                            //   (element) =>
                            //       element.labourId == labour.labourId.toString(),
                            // )) {}

                            controller.groupquickWage.removeWhere(
                              (element) =>
                                  element.labourId ==
                                  labour.labourId.toString(),
                            );

                            controller.groupquickWage.add(GrouLabourss(
                              isSelected: true,
                              labourId: labour.labourId.toString(),
                              basicWage: totalshowlist.value.toString(),
                              extra_wage: extrawage ?? "0",
                              nooflabours: nolabours ?? "1",
                              workdays: days == true ? "0.5" : "1",
                              overtime_wage: labour.overtimeRate.toString(),
                              ta_wage: labour.ta ?? "0",
                            ));
                            controller.groupWageLabourfilterlist!
                                .labours![index].isbuttonn.value = true;
                            await calculate();
                            // controller.groupWageLabourfilterlist!.labours![index]
                            //     .dailyWage = basicwage.toString();

                            await controller.groupWagetotalpresent(
                                controller.groupquickWage.toList(),
                                perviousbalance);

                            Get.back();
                          },
                          child: Text(
                            "Submit",
                            style:
                                TextStyle(fontSize: 2.h, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: bColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Button radius
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addonpoppup(text, Function(String)? onChanged, BuildContext context,
      ruppes, readOnly, initialValue, color) {
    return Container(
        // color: Colors.amber,
        child: Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 12, fontFamily: Medium, color: Colors.black54),
          ),
          h1,
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black26, width: 1)),
            // height: MediaQuery.of(context).size.height * .064,
            height: 45,
            width: MediaQuery.of(context).size.width * .21,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: TextFormField(
                  style: TextStyle(color: color),
                  initialValue: initialValue,
                  readOnly: readOnly ?? false,
                  onChanged: onChanged,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  // controller: controller,
                  decoration: InputDecoration(
                      prefix: Text(ruppes ?? " ₹ "),
                      border: InputBorder.none,
                      //  OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(color: Colors.black26, width: 1),
                      // ),
                      focusedBorder: InputBorder.none,
                      //  OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(color: Colors.black26, width: 1),
                      // ),
                      enabledBorder: InputBorder.none,
                      //  OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(color: Colors.black26, width: 1),
                      // ),
                      errorBorder: InputBorder.none,
                      //  OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(color: Colors.red, width: 1),
                      // ),
                      focusedErrorBorder: InputBorder.none,
                      //  OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(5),
                      //   borderSide: const BorderSide(color: Colors.red, width: 1),
                      // ),
                      disabledBorder: InputBorder.none),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
