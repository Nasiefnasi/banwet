import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/project_modules/subcontract/subcontract.add/controllers/subcontract.dart';
import 'package:banwet/app/modules/project_modules/subcontract/subcontract.add/view/subcontract_add.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/loading.dart';
import '../controllers/subcontract_controller.dart';
import '../submodule/subcontract_menu.dart';

class SubcontractView extends GetView<SubcontractController> {
  const SubcontractView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubcontractAddingController controller1 =
        Get.put(SubcontractAddingController());
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: bColor,
        //   leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: const Icon(Icons.arrow_back_ios),
        //     color: Colors.white,
        //   ),
        //   title: const Text(
        //     'Sub Contract List',
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ProjectNameTitile(
                projectName: controller.argumentData["workname"],
                screenTitile: "Sub Contract",
                onTap: () {
                  // Get.bottomSheet(
                  //   BottomSheetWidegt(
                  //     workid: controller.argumentData["workid"],
                  //     workname: controller.argumentData["workname"],
                  //   ),
                  //   // Optional parameters
                  //   backgroundColor: Colors.white,
                  //   elevation: 8.0,
                  //   shape: const RoundedRectangleBorder(1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111*11
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(16.0),
                  //       topRight: Radius.circular(16.0),
                  //     ),1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                  //   ),
                  // );
                  controller1.clears();
                  Get.to(SubContractIteams());
                },
              ),
            ),
            h3,
            GetBuilder<SubcontractController>(
                builder: (controller) => controller
                            .subContractHomeModel?.data ==
                        null
                    ? Center(child: loadingthreebounce)
                    : controller.subContractHomeModel!.data!.isEmpty
                        ? Center(
                            child: SizedBox(
                            // height: dHeight! * .5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Lottie.asset(
                                      repeat: false,
                                      "assets/images/qrbRtDHknE.json",
                                      height: 250),
                                ),
                              ],
                            ),
                          ))
                        : Expanded(
                            child: ListView.builder(
                              itemCount:
                                  controller.subContractHomeModel!.data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    controller.subWorkName = controller
                                        .subContractHomeModel!
                                        .data![index]
                                        .subWorkName;
                                    controller.subContr = controller
                                        .subContractHomeModel!
                                        .data![index]
                                        .contractor;
                                    controller.subDes = controller
                                            .subContractHomeModel!
                                            .data![index]
                                            .description ??
                                        "";
                                    controller.subConrType = controller
                                        .subContractHomeModel!
                                        .data![index]
                                        .contractType;
                                    controller.subStatus = controller
                                        .subContractHomeModel!
                                        .data![index]
                                        .contractApprovalStatus;

                                    Get.to(
                                      arguments: {
                                        "workid":
                                            controller.argumentData["workid"],
                                        "workname":
                                            controller.argumentData["workname"],
                                        "contractId": controller
                                            .subContractHomeModel!
                                            .data![index]
                                            .contractId,
                                      },
                                      SubContactMenu(
                                        contractId: controller
                                            .subContractHomeModel!
                                            .data![index]
                                            .contractId,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.h, vertical: 2.h),
                                    // height: 9.h
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        // border: Border.all(
                                        //     // color: Colors.black54
                                        //         .withOpacity(0.1)),
                                        color: bColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 50.w,
                                              child: Text(
                                                controller
                                                        .subContractHomeModel!
                                                        .data?[index]
                                                        .subWorkName ??
                                                    "",
                                                style: header11.copyWith(
                                                    color: Colors.white,
                                                    fontFamily: regular,
                                                    fontSize: 16),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              // color: Colors.amber,
                                              width: 70.w,
                                              child: Text(
                                                "Contractor : ${controller.subContractHomeModel!.data?[index].contractor ?? ""}",
                                                style: wheader12,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            // Text(
                                            //   controller.lo[index].createdBy ?? "",
                                            //   style: wheader9,
                                            // ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.subWorkName = controller
                                                .subContractHomeModel!
                                                .data![index]
                                                .subWorkName;
                                            controller.subContr = controller
                                                .subContractHomeModel!
                                                .data![index]
                                                .contractor;
                                            controller.subDes = controller
                                                    .subContractHomeModel!
                                                    .data![index]
                                                    .description ??
                                                "";
                                            controller.subConrType = controller
                                                .subContractHomeModel!
                                                .data![index]
                                                .contractType;
                                            controller.subStatus = controller
                                                .subContractHomeModel!
                                                .data![index]
                                                .contractApprovalStatus;
                                            Get.dialog(
                                              Dialog(
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      h2,
                                                      _commonTitle(
                                                          'SubWork Name'),
                                                      h1,
                                                      _commonBox(controller
                                                          .subWorkName),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Colors.black26,
                                                      ),
                                                      h1,
                                                      _commonTitle(
                                                          'Contractor'),
                                                      h1,
                                                      _commonBox(
                                                          controller.subContr),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Colors.black26,
                                                      ),
                                                      h1,
                                                      _commonTitle(
                                                          'Description'),
                                                      h1,
                                                      _commonBox2(
                                                          controller.subDes ??
                                                              ""),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Colors.black26,
                                                      ),
                                                      h1,
                                                      _commonTitle(
                                                          'Contractor Type'),
                                                      h1,
                                                      _commonBox(controller
                                                          .subConrType),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Colors.black26,
                                                      ),
                                                      h1,
                                                      _commonTitle('Status'),
                                                      h1,
                                                      _commonBox(
                                                          controller.subStatus),
                                                      const Divider(
                                                        thickness: 1,
                                                        color: Colors.black26,
                                                      ),
                                                      const SizedBox(
                                                          height: 20.0),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            )),
                                                            backgroundColor:
                                                                const WidgetStatePropertyAll(
                                                                    Color.fromARGB(
                                                                        255,
                                                                        217,
                                                                        217,
                                                                        217))),
                                                        child: const Text(
                                                          'Back',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .remove_red_eye_outlined,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
          ],
        ),
      ),
    ));
  }

  Row _commonTitle(String? text) {
    return Row(
      children: [
        // Container(
        //   width: 1.7.w,
        //   height: 2.2.h,
        //   color: bColor,
        // ),
        // w3,
        Text(
          text!,
          style: header11,
        )
      ],
    );
  }

  Container _commonBox(text) {
    return Container(
      // height: 5.h,
      // width: 100.w,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black12.withOpacity(0.1)),
      //     color: bColor2,
      //     borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // w3,
          Text(
            text ?? "",
            style: header11.copyWith(color: Colors.black54, fontFamily: Medium),
          ),
        ],
      ),
    );
  }

  _commonBox2(text) {
    return SizedBox(
      // height: 12.h,
      width: 100.w,
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.black12.withOpacity(0.1)),
      //     color: bColor2,
      //     borderRadius: BorderRadius.circular(7)),
      child: TextFormField(
        readOnly: true,
        maxLines: 4,
        minLines: 1,
        style: header11.copyWith(color: Colors.black54, fontFamily: Medium),
        controller: TextEditingController(text: text ?? ""),
        decoration: const InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none),
      ),
      //  Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     w3,

      //     Text(
      //       text!,
      //       style: header11,
      //     ),
      //   ],
      // ),
    );
  }
}
