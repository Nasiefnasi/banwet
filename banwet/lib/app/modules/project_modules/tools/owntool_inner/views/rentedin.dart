import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/office_expense/views/component/showDialog.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/controllers/owntool_inner_controller.dart';
import 'package:banwet/app/style/const.dart';

class totalRentedIn extends StatelessWidget {
  const totalRentedIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> newkey = GlobalKey<FormState>();
    return GetBuilder<OwntoolInnerController>(
      builder: (controller) => controller.toolDetailsModel2 == null
          ? SpinKitThreeBounce(
              color: bColor,
            )
          : controller.toolDetailsModel2!.data.rentLog!.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount: controller.toolDetailsModel2!.data.rentLog!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data =
                        controller.toolDetailsModel2!.data.rentLog![index];
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
                                          controller
                                              .toolDetailsModel2!.data.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: Medium,
                                          ),
                                        ),
                                        h03,
                                        Text(
                                          controller.toolDetailsModel2!.data
                                              .categoryName,
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
                                      Get.defaultDialog(
                                        backgroundColor: Colors.white,
                                        radius: 10,
                                        title: "Remarks",
                                        middleTextStyle: header11,
                                        middleText: controller
                                            .toolDetailsModel2!
                                            .data
                                            .transferInLog[index]
                                            .remarks
                                            .toString(),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  w2,
                                  InkWell(
                                      onTap: () {
                                        controller.returnedqut.clear();
                                        // controller.transferdate.clear();
                                        controller.iserror.value = false;
                                        controller.balancereturn.value =
                                            double.parse(data.rentedQty ?? "0");
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
                                                              true
                                                          ? Colors.red
                                                          : Colors.black38,
                                                      onChanged: (a) {
                                                        if (data.rentedQty !=
                                                            null) {
                                                          if (double.parse(a) <=
                                                                  double.parse(data
                                                                      .rentedQty
                                                                      .toString()) &&
                                                              a != "") {
                                                            controller.returntransferquantity(
                                                                data.rentedQty,
                                                                a); // controller
                                                          } else {
                                                            controller
                                                                .returntransferquantity(
                                                                    data.rentedQty,
                                                                    0);
                                                            // controller
                                                            //     .returnedquantity
                                                            //     .clear();\
                                                            //returnedqut
                                                            controller
                                                                .returnedqut
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
                                                      // validator: Validators
                                                      //     .noneEmptyValidator,
                                                      controller: controller
                                                          .returnedqut,
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
                                                          style: header11,
                                                          bodercolor: controller
                                                                      .iserror
                                                                      .value ==
                                                                  true
                                                              ? Colors.red
                                                              : Colors.black38,
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
                                                    onTap: () async {
                                                      if (controller.returnedqut
                                                          .text.isNotEmpty) {
                                                        controller.iserror
                                                            .value = false;
                                                        controller
                                                            .owntoolrentalreturns(
                                                                data.id,
                                                                controller
                                                                    .returnedqut
                                                                    .text,
                                                                controller
                                                                    .transferdate
                                                                    .text); // Add your submission logic here
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
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                            "assets/images/tollstransfers.png"),
                                      )
                                      //  const Icon(
                                      //   Icons.info_outline,
                                      //   color: Colors.white,
                                      // ),
                                      ),
                                ],
                              ),
                              h1,
                              const Divider(),
                              h1,
                              Text("Transfer Date : ${data.rentedDate}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: Medium,
                                      color: Colors.white)),
                              // const Spacer(),
                              Text("Qty at worksite : ${data.rentedQty ?? ""}",
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
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     w3,
                    //     Text(
                    //       controller.toolDetailsModel2!.data
                    //           .transferInLog[index].transferDate,
                    //       style: header11,
                    //     ),
                    //     w5,
                    //     Text(
                    //       controller.toolDetailsModel2!.data
                    //           .transferInLog[index].location,
                    //       style: header11,
                    //     ),
                    //     w14,
                    //     SizedBox(
                    //         width: 13.w,
                    //         child: Text(
                    // controller.toolDetailsModel2!.data
                    //     .transferInLog[index].transferredQty,
                    //           style: header11,
                    //           overflow: TextOverflow.ellipsis,
                    //         )),
                    //     w12,
                    //     GestureDetector(
                    // onTap: () {
                    //   Get.defaultDialog(
                    //     title: "Remarks",
                    //     middleTextStyle: header11,
                    //     middleText: controller.toolDetailsModel2!
                    //         .data.transferInLog[index].remarks,
                    //   );
                    // },
                    //       child: billRemarks(),
                    //     )
                    //   ],
                    // );
                  },
                ),
      init: OwntoolInnerController(),
    );
  }
}
