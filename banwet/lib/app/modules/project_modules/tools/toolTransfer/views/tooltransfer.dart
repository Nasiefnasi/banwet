import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/office_expense/views/component/showDialog.dart';
import 'package:banwet/app/modules/project_modules/tools/own_tools/controllers/own_tools_controller.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/controllers/owntool_inner_controller.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/views/addtooltarnsfer.dart';
import '../../../../../Style/const.dart';
import '../../../../../routes/app_pages.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/renttool_controller.dart';

// class RenttoolView extends GetView<RenttoolController> {
//   // RenttoolController soolsransfer;
//   RenttoolView({Key? key}) : super(key: key);
//   // RenttoolController RenttoolController
//   OwnToolsController controller1 = Get.put(OwnToolsController());
//   OwntoolInnerController controller2 = Get.put(OwntoolInnerController());
//   @override
//   Widget build(BuildContext context) {
//     // final RxDouble balancereturn = 0.0.obs;
//     var mediaquery = MediaQuery.of(context).size;
//     return SafeArea(
//         // bottom: false,
//         child: Scaffold(
//       body: Column(children: [
//         h1,
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 2.h),
//           child: Obx(
//             () => ProjectNameTitile(
//               addbutton: controller.index.value == 3 ? SizedBox() : null,
//               projectName: controller.argumnetData["workname"],
//               screenTitile: "Tools Transfer",
//               onTap: () async {
//                 // controller2.toolDetailsModel2 = null;
//                 controller1.toolsHomeModel = await null;
//                 // controller2.getDtetails();
//                 await controller1.getDetails();
//                 if (controller1.toolsHomeModel != null ||
//                     controller2.toolDetailsModel2 != null) {
//                   Get.to(
//                       () => AddToolTransfer(
//                             tooltransfer: "tooltransfer",
//                             tooltype: "Transfer in",
//                           ),
//                       arguments: {"toolname": "Tools", "workname": "wprkios"});
//                 }
//               },
//             ),
//           ),
//         ),
//         h2,
//         // search(),
//         h3,
//         Container(
//           margin: EdgeInsets.symmetric(
//             horizontal: 0.h,
//           ),
//           height: 6.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(00),
//             // border: Border.all(color: Color(0xff46c9c9), width: 2),
//             color: const Color.fromRGBO(234, 230, 238, 1),
//           ),
//           child: TabBar(
//             isScrollable: true,
//             indicatorSize: TabBarIndicatorSize.tab,
//             labelColor: Colors.white, // Set the label color explicitly
//             labelStyle: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 11.sp,
//             ),
//             unselectedLabelColor: Colors.black, // Color for unselected tabs
//             unselectedLabelStyle: TextStyle(
//               fontWeight: FontWeight.w500, // Adjust weight for unselected tabs
//               fontSize: 11.sp,
//             ),
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: bColor, // Background color for the selected tab
//             ),
//             controller: controller.tabBarcontoller,
//             onTap: (value) {
//               controller.count.value = value; // Handle tab change
//               print(
//                   "hhhhhhhhhhhhhhhhhhheeeeeeeeeeeeeeeeeeeeeellllllllllllllllllllllllllooooooooooooooooooooooooo${controller.count.value}");
//             },
//             tabs: const [
//               Tab(text: 'Transfer In'),
//               Tab(text: 'Transfer Out'),
//               Tab(text: 'Rented In'), // Fixed capitalization consistency
//               Tab(text: 'Rental Returns'),
//             ],
//           ),
//         ),
//         // listHeading(),
//         h1,
//         Expanded(
//           child: TabBarView(controller: controller.tabBarcontoller, children: [
//             transferin(),
//             transferout(),
//             rentedin(),
//             rentalreturns(),
//           ]),
//         )
//       ]),
//     ));
//   }
class RenttoolView extends GetView<RenttoolController> {
  RenttoolView({Key? key}) : super(key: key);

  OwnToolsController controller1 = Get.put(OwnToolsController());
  OwntoolInnerController controller2 = Get.put(OwntoolInnerController());

  // List of tab names corresponding to the tabs
  final List<String> tabNames = [
    'Transfer In',
    'Transfer Out',
    'Rented In',
    'Rental Returns'
  ];

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    // Attach listener to TabController in the build method
    // controller.tabBarcontoller.addListener(() {
    //   if (!controller.tabBarcontoller.indexIsChanging) {
    //     // Get the current index and tab name
    //     int index = controller.tabBarcontoller.index;
    //     String tabName = tabNames[index];

    //     // Print the current tab and index
    //     print('Current Tab: $tabName, Index: $index');
    //   }
    // });

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            h1,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Obx(
                () => ProjectNameTitile(
                  addbutton: controller.index.value == 3
                      ? SizedBox(
                          height: 7.h,
                          width: 20.w,
                        )
                      : Lottie.asset(
                          'assets/images/Jp7tjlAjLj.json',
                          height: 7.h,
                          width: 20.w,
                        ),
                  projectName: controller.argumnetData["workname"],
                  screenTitile: "Tools Transfer",
                  onTap: () async {
                    if (controller.index.value == 3) {
                    } else {
                      controller1.toolsHomeModel = await null;
                      await controller1.getDetails();
                      if (controller1.toolsHomeModel != null ||
                          controller2.toolDetailsModel2 != null) {
                        Get.to(
                          () => AddToolTransfer(
                            tooltransfer: "tooltransfer",
                            tooltype: "Transfer in",
                          ),
                          arguments: {
                            "toolname": "Tools",
                            "workname": "wprkios"
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ),
            h2,
            h3,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.h),
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(00),
                color: const Color.fromRGBO(234, 230, 238, 1),
              ),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bColor,
                ),
                controller: controller.tabBarcontoller,
                onTap: (value) {
                  controller.count.value = value; // Handle tab change
                  // String tabName = tabNames[value];
                  // print('Tab selected via tap: $tabName');
                },
                tabs: const [
                  Tab(text: 'Transfer In'),
                  Tab(text: 'Transfer Out'),
                  Tab(text: 'Rented In'),
                  Tab(text: 'Rental Returns'),
                ],
              ),
            ),
            h1,
            Expanded(
              child: TabBarView(
                controller: controller.tabBarcontoller,
                children: [
                  transferin(),
                  transferout(),
                  rentedin(),
                  rentalreturns(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GetBuilder<RenttoolController> rentalreturns() {
    return GetBuilder<RenttoolController>(
      builder: (controller) => controller.tooltransferiteamModel == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.rentedreturns.value.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount: controller.rentedreturns.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.rentedreturns.value[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bColor,
                            borderRadius: BorderRadius.circular(10)),
                        // height: mediaquery.height * .2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.toolName.toString(),
                                          // "controller.toolDetailsModel2!.data.name,",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: Medium,
                                          ),
                                        ),
                                        h03,
                                        Text(
                                          data.category,
                                          // " controller.toolDetailsModel2!.data.categoryName",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: regular,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              h1,
                              const Divider(),
                              h1,
                              Text("Transfer Date : ${data.date}",
                                  // "Transfer Date : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferDate"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              // const Spacer(),
                              Text("Qty at worksite : ${data.quantity}",
                                  // "Qty at worksite : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferredQty"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              h1
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      init: RenttoolController(),
    );
  }

  GetBuilder<RenttoolController> rentedin() {
    return GetBuilder<RenttoolController>(
      builder: (controller) => controller.tooltransferiteamModel == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.rentedin.value.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount: controller.rentedin.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.rentedin.value[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bColor,
                            borderRadius: BorderRadius.circular(10)),
                        // height: mediaquery.height * .2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.toolName.toString(),
                                          // "controller.toolDetailsModel2!.data.name,",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: Medium,
                                          ),
                                        ),
                                        h03,
                                        Text(
                                          data.category,
                                          // " controller.toolDetailsModel2!.data.categoryName",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: regular,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        // controller.transferdate.clear();
                                        controller.iserror.value = false;
                                        controller.balancereturn.value =
                                            double.parse(
                                                data.quantity.toString());
                                        controller.returnedquantity.clear();
                                        Get.dialog(
                                          Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // For rounded corners
                                            ),
                                            backgroundColor: Colors.white,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width, // Set width to 80% of the screen
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize
                                                    .min, // Adjust size based on content
                                                children: [
                                                  Text(
                                                    "Return Transferred Tools",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: Medium),
                                                  ),
                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width: double
                                                        .infinity, // Ensure this container takes full width
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Balance to Return",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  Medium),
                                                        ),
                                                        const SizedBox(
                                                            height:
                                                                10), // Spacing
                                                        // Obx(() {
                                                        //   return,
                                                        Obx(
                                                          () => Text(
                                                            controller
                                                                .balancereturn
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    Medium),
                                                          ),
                                                        ),
                                                        // }),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  Obx(
                                                    () => NewCaseTextField(
                                                      bordercolor: controller
                                                                  .iserror
                                                                  .value ==
                                                              false
                                                          ? Colors.black26
                                                          : Colors.red,
                                                      onChanged: (a) {
                                                        if (controller
                                                            .returnedquantity
                                                            .text
                                                            .isNotEmpty) {
                                                          if (double.parse(a) <=
                                                                  double.parse(data
                                                                      .quantity
                                                                      .toString()) &&
                                                              a != "") {
                                                            controller.returntransferquantity(
                                                                data.quantity,
                                                                a); // controller
                                                            //         .payableAmount
                                                            //         .value =
                                                            //     double.parse(a);

                                                            // controller
                                                            //     .calculateBalanceNumber();
                                                          } else {
                                                            controller
                                                                .returntransferquantity(
                                                                    data.quantity,
                                                                    0);
                                                            controller
                                                                .returnedquantity
                                                                .clear();
                                                            warningDialogue(
                                                                context);
                                                            // controller
                                                            //     .calculateBalanceNumber();
                                                          }
                                                        } else {
                                                          // controller.payableAmount
                                                          //     .value = 0.0;
                                                          // controller
                                                          //     .calculateBalanceNumber();
                                                        }

                                                        controller.update();
                                                      },
                                                      labelstyle:
                                                          header11.copyWith(
                                                        // fontSize: 10,
                                                        color: Colors.black54,
                                                      ),
                                                      mediaquery:
                                                          MediaQuery.of(context)
                                                              .size,
                                                      validator: Validators
                                                          .noneEmptyValidator,
                                                      controller: controller
                                                          .returnedquantity,
                                                      keyboard:
                                                          TextInputType.phone,
                                                      label:
                                                          "Returned Quantity",
                                                      icon: SizedBox(
                                                          // color: Colors.amber,
                                                          height: 25,
                                                          width: 25,
                                                          child: Image.asset(
                                                              "assets/images/quanititys.png")),
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 0),
                                                      child: Obx(
                                                        () => DateTimePickers(
                                                          // color: c,
                                                          bodercolor: controller
                                                                      .iserror
                                                                      .value ==
                                                                  false
                                                              ? Colors.black26
                                                              : Colors.red,
                                                          style: header11,
                                                          labelStyle:
                                                              header11.copyWith(
                                                                  color: Colors
                                                                      .black54),
                                                          controller: controller
                                                              .transferdate,
                                                          validator: Validators
                                                              .noneEmptyValidator,
                                                          label:
                                                              " Transfer Date",
                                                        ),
                                                      )),

                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  SubmitButton(
                                                    onTap: () {
                                                      if (controller
                                                          .returnedquantity
                                                          .text
                                                          .isNotEmpty) {
                                                        controller.iserror
                                                            .value = false;
                                                        controller
                                                            .tooltransferrented(
                                                                data.id,
                                                                controller
                                                                    .returnedquantity
                                                                    .text,
                                                                controller
                                                                    .transferdate
                                                                    .text);
                                                      } else {
                                                        controller.iserror
                                                            .value = true;
                                                      }
                                                    },
                                                    text: "Submit",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Image.asset(
                                            "assets/images/tollstransfers.png"),
                                      )
                                      //  const Icon(
                                      //   Icons.info_outline,
                                      //   color: Colors.white,
                                      // ),
                                      )
                                ],
                              ),
                              h1,
                              const Divider(),
                              h1,
                              Text("Transfer Date : ${data.date}",
                                  // "Transfer Date : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferDate"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              // const Spacer(),
                              Text("Qty at worksite : ${data.quantity}",
                                  // "Qty at worksite : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferredQty"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              h1
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      init: RenttoolController(),
    );
  }

  GetBuilder<RenttoolController> transferout() {
    return GetBuilder<RenttoolController>(
      builder: (controller) => controller.tooltransferiteamModel == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.transferout.value.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount: controller.transferout.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.transferout.value[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: bColor,
                            borderRadius: BorderRadius.circular(10)),
                        // height: mediaquery.height * .2,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.toolName.toString(),
                                          // "controller.toolDetailsModel2!.data.name,",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: Medium,
                                          ),
                                        ),
                                        h03,
                                        Text(
                                          data.category,
                                          // " controller.toolDetailsModel2!.data.categoryName",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: regular,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        controller.balancereturn.value =
                                            double.parse(
                                                data.quantity.toString());
                                        Get.dialog(
                                          Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // For rounded corners
                                            ),
                                            backgroundColor: Colors.white,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width, // Set width to 80% of the screen
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize
                                                    .min, // Adjust size based on content
                                                children: [
                                                  Text(
                                                    "Return Transferred Tools",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: Medium),
                                                  ),
                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                    width: double
                                                        .infinity, // Ensure this container takes full width
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black26),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Balance to Return",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  Medium),
                                                        ),
                                                        const SizedBox(
                                                            height:
                                                                10), // Spacing
                                                        // Obx(() {
                                                        //   return,
                                                        Obx(
                                                          () => Text(
                                                            controller
                                                                .balancereturn
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    Medium),
                                                          ),
                                                        ),
                                                        // }),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  NewCaseTextField(
                                                    onChanged: (p0) {
                                                      controller
                                                          .returntransferquantity(
                                                              data.quantity,
                                                              p0);
                                                    },
                                                    labelstyle:
                                                        header11.copyWith(
                                                      // fontSize: 10,
                                                      color: Colors.black54,
                                                    ),
                                                    mediaquery:
                                                        MediaQuery.of(context)
                                                            .size,
                                                    validator: Validators
                                                        .noneEmptyValidator,
                                                    controller: controller
                                                        .returnedquantity,
                                                    keyboard:
                                                        TextInputType.phone,
                                                    label: "Returned Quantity",
                                                    icon: SizedBox(
                                                        // color: Colors.amber,
                                                        height: 25,
                                                        width: 25,
                                                        child: Image.asset(
                                                            "assets/images/quanititys.png")),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 0),
                                                      child: DateTimePickers(
                                                        style: header11,
                                                        labelStyle:
                                                            header11.copyWith(
                                                                color: Colors
                                                                    .black),
                                                        controller:
                                                            TextEditingController(),
                                                        validator: Validators
                                                            .noneEmptyValidator,
                                                        label: " Transfer Date",
                                                      )),

                                                  const SizedBox(
                                                      height: 20), // Spacing
                                                  SubmitButton(
                                                    onTap: () {
                                                      if (controller
                                                          .key.currentState!
                                                          .validate()) {
                                                        // Add your submission logic here
                                                      }
                                                    },
                                                    text: "Submit",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Image.asset(
                                            "assets/images/tollstransfers.png"),
                                      )
                                      //  const Icon(
                                      //   Icons.info_outline,
                                      //   color: Colors.white,
                                      // ),
                                      )
                                ],
                              ),
                              h1,
                              const Divider(),
                              h1,
                              Text("Transfer Date : ${data.date}",
                                  // "Transfer Date : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferDate"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              // const Spacer(),
                              Text("Qty at worksite : ${data.quantity}",
                                  // "Qty at worksite : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferredQty"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              h1
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
      init: RenttoolController(),
    );
  }

  GetBuilder<RenttoolController> transferin() {
    return GetBuilder<RenttoolController>(
      builder: (controller) => controller.tooltransferiteamModel == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.transferin.value.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount: controller.transferin.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.transferin.value[index];
                    if (data.type == "Transfer In") {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: bColor,
                              borderRadius: BorderRadius.circular(10)),
                          // height: mediaquery.height * .2,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.toolName.toString(),
                                            // "controller.toolDetailsModel2!.data.name,",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: Medium,
                                            ),
                                          ),
                                          h03,
                                          Text(
                                            data.category,
                                            // " controller.toolDetailsModel2!.data.categoryName",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: regular,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    // InkWell(
                                    //     onTap: () {
                                    //       controller.balancereturn.value =
                                    //           double.parse(
                                    //               data.quantity.toString());
                                    //       Get.dialog(
                                    //         Dialog(
                                    //           shape: RoundedRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(
                                    //                     10), // For rounded corners
                                    //           ),
                                    //           backgroundColor: Colors.white,
                                    //           child: Container(
                                    //             width: MediaQuery.of(context)
                                    //                 .size
                                    //                 .width, // Set width to 80% of the screen
                                    //             padding:
                                    //                 const EdgeInsets.all(20.0),
                                    //             child: Column(
                                    //               mainAxisSize: MainAxisSize
                                    //                   .min, // Adjust size based on content
                                    //               children: [
                                    //                 Text(
                                    //                   "Return Transferred Tools",
                                    //                   style: TextStyle(
                                    //                       fontSize: 18,
                                    //                       fontFamily: Medium),
                                    //                 ),
                                    //                 const SizedBox(
                                    //                     height: 20), // Spacing
                                    //                 Container(
                                    //                   height:
                                    //                       MediaQuery.of(context)
                                    //                               .size
                                    //                               .height *
                                    //                           0.1,
                                    //                   width: double
                                    //                       .infinity, // Ensure this container takes full width
                                    //                   decoration: BoxDecoration(
                                    //                     border: Border.all(
                                    //                         color:
                                    //                             Colors.black26),
                                    //                     borderRadius:
                                    //                         const BorderRadius
                                    //                             .all(
                                    //                             Radius.circular(
                                    //                                 10)),
                                    //                   ),
                                    //                   child: Column(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                     children: [
                                    //                       Text(
                                    //                         "Balance to Return",
                                    //                         style: TextStyle(
                                    //                             fontSize: 14,
                                    //                             fontFamily:
                                    //                                 Medium),
                                    //                       ),
                                    //                       const SizedBox(
                                    //                           height:
                                    //                               10), // Spacing
                                    //                       // Obx(() {
                                    //                       //   return,
                                    //                       Obx(
                                    //                         () => Text(
                                    //                           controller
                                    //                               .balancereturn
                                    //                               .value
                                    //                               .toString(),
                                    //                           style: TextStyle(
                                    //                               fontSize: 18,
                                    //                               fontFamily:
                                    //                                   Medium),
                                    //                         ),
                                    //                       ),
                                    //                       // }),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //                 const SizedBox(
                                    //                     height: 20), // Spacing
                                    //                 NewCaseTextField(
                                    //                   onChanged: (p0) {
                                    //                     controller
                                    //                         .returntransferquantity(
                                    //                             data.quantity
                                    //                                 .toString(),
                                    //                             p0);
                                    //                   },
                                    //                   labelstyle:
                                    //                       header11.copyWith(
                                    //                     // fontSize: 10,
                                    //                     color: Colors.black54,
                                    //                   ),
                                    //                   mediaquery:
                                    //                       MediaQuery.of(context)
                                    //                           .size,
                                    //                   validator: Validators
                                    //                       .noneEmptyValidator,
                                    //                   controller: controller
                                    //                       .returnedquantity,
                                    //                   keyboard:
                                    //                       TextInputType.phone,
                                    //                   label:
                                    //                       "Returned Quantity",
                                    //                   icon: Container(
                                    //                       // color: Colors.amber,
                                    //                       height: 25,
                                    //                       width: 25,
                                    //                       child: Image.asset(
                                    //                           "assets/images/quanititys.png")),
                                    //                 ),
                                    //                 Padding(
                                    //                     padding:
                                    //                         const EdgeInsets
                                    //                             .symmetric(
                                    //                             horizontal: 0),
                                    //                     child: DateTimePickers(
                                    //                       style: header11,
                                    //                       labelStyle:
                                    //                           header11.copyWith(
                                    //                               color: Colors
                                    //                                   .black),
                                    //                       controller:
                                    //                           TextEditingController(),
                                    //                       validator: Validators
                                    //                           .noneEmptyValidator,
                                    //                       label:
                                    //                           " Transfer Date",
                                    //                     )),

                                    //                 const SizedBox(
                                    //                     height: 20), // Spacing
                                    //                 SubmitButton(
                                    //                   onTap: () {
                                    //                     if (controller
                                    //                         .key.currentState!
                                    //                         .validate()) {
                                    //                       // Add your submission logic here
                                    //                     }
                                    //                   },
                                    //                   text: "Submit",
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     },
                                    //     child: SizedBox(
                                    //       height: 24,
                                    //       width: 24,
                                    //       child: Image.asset(
                                    //           "assets/images/tollstransfers.png"),
                                    //     )
                                    //     //  const Icon(
                                    //     //   Icons.info_outline,
                                    //     //   color: Colors.white,
                                    //     // ),
                                    //     )
                                  ],
                                ),
                                h1,
                                const Divider(),
                                h1,
                                Text("Transfer Date : ${data.date}",
                                    // "Transfer Date : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferDate"}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: Medium,
                                        color: Colors.white)),
                                // const Spacer(),
                                Text("Qty at worksite : ${data.quantity}",
                                    // "Qty at worksite : ${"controller.toolDetailsModel2!.data.transferInLog[index].transferredQty"}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: Medium,
                                        color: Colors.white)),
                                h1
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
      init: RenttoolController(),
    );
  }

  // search() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 2.h),
  //     child: SizedBox(
  //       height: 45,
  //       child: CupertinoSearchTextField(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border:
  //               Border.all(color: Colors.black54.withOpacity(0.3), width: 1),
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         onChanged: (value) {
  //           controller.searchText.value = value;
  //           controller.filterData();
  //         },
  //         itemSize: 16.sp,
  //         // backgroundColor: Colors.white,
  //         //  borderRadius: BorderRadius.circular(12),

  //         prefixIcon: const Padding(
  //           padding: EdgeInsets.only(top: 5),
  //           child: Icon(
  //             Icons.search_outlined,
  //             size: 25,
  //           ),
  //         ),
  //         placeholder: 'Search Tool Name',
  //       ),
  //     ),
  //   );
  // }
}

class OwnToolListTile extends GetView<RenttoolController> {
  OwnToolListTile(this.index, {super.key});
  @override
  RenttoolController controller = Get.put(RenttoolController());
  @override
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.RENTTOOL_INNER, arguments: {
          "workid": controller.argumnetData["workid"],
          "toolid": controller.filteredData[index].toolId,
          "workname": controller.argumnetData["workname"],
          "toolname": controller.filteredData[index].name,
          "quantity": controller.filteredData[index].ownedQty ?? "",
          "qunatityOnSite":
              controller.filteredData[index].totalQtyPresent.toString()
        });
      },
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
                    controller.filteredData[index].name ?? "",
                    style: wheader13,
                  ),
                ),
                h1,
                Text(
                  controller.filteredData[index].categoryName ?? "",
                  style: wheader10,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Qty at Site : ${controller.filteredData[index].totalQtyPresent ?? ""}',
                          style: wheader11,
                        ),
                      ],
                    ),
                    h1,
                    Text(
                      'Own Qty : ${controller.filteredData[index].ownedQty ?? ""}',
                      style: wheader11,
                    ),
                  ],
                ),
                w4,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
