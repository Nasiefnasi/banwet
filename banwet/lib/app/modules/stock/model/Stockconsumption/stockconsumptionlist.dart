import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/stock/Apimodel/stocktransferpostarray.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';
import 'package:banwet/app/modules/stock/model/search.dart';

import 'package:intl/intl.dart';

class StockConsumptionList extends StatelessWidget {
  StockConsumptionList({super.key});

  final StockControllers controller = Get.put(StockControllers());

  final List<TextEditingController> textControllers = [];

  @override
  Widget build(BuildContext context) {
    RxInt count = 0.obs;
    final RxBool isError = false.obs;
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SubmitButtons(
            isLoading: controller.isLoadings,
            onTap: () {
              controller.dailyconsumptionpost();
            },
            text: "Submit"),
      ),

      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      //   child: GestureDetector(
      //     onTap: () async {
      //       controller.dailyconsumptionpost();
      //     },
      //     child: Container(
      //       height: 7.h,
      //       width: 100.w,
      //       decoration: BoxDecoration(
      //         color: bColor,
      //         borderRadius: const BorderRadius.all(const Radius.circular(5)),
      //       ),
      //       child: Center(
      //         child: Obx(() => controller.isLoadings.value
      //             ? SpinKitThreeBounce(color: Colors.white)
      //             : Text(
      //                 'Submit',
      //                 style: header15.copyWith(color: Colors.white),
      //               )),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              ProjectNameTitile(
                addbutton: const SizedBox(),
                projectName: controller.argumentData["workname"],
                screenTitile: "Daily Consumption",
                onTap: () {
                  // Handle tap event
                },
              ),
              h3,
              Container(
                height: 54,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black26,
                //     width: 1.0,
                //   ),
                //   borderRadius: BorderRadius.circular(5),
                // ),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius: 2,
                  //     blurRadius: 2,
                  //     offset: const Offset(0, 2), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.2), width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      count.value++;
                    },
                    child: Center(
                      child: DateTimePickers(
                        onChanged: (p0) {
                          // date.value = p0.toString();
                        },
                        labelStyle: header4.copyWith(color: Colors.black38),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: Medium,
                        ),
                        controller: controller.Stockconsumptiondate,
                        enabledBorder: InputBorder.none,
                        label: "Consumption Date",
                      ),
                    ),
                  ),
                ),
              ),
              h1,
              StockConsumptiondate(),
              h2,
              Expanded(
                child: GetBuilder<StockControllers>(
                  init: StockControllers(),
                  builder: (controller) {
                    if (controller.stockConsumptionLoading.value) {
                      return Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [loadingthreebounce],
                          ),
                        ),
                      );
                    }

                    if (controller.stockConsumptionListmodel == null ||
                        controller.stockConsumptionListmodel!.data == null) {
                      return Center(
                        child: Lottie.asset(
                            repeat: false,
                            "assets/images/qrbRtDHknE.json",
                            height: 250),
                      );
                    }

                    // Initialize text controllers if empty
                    if (textControllers.isEmpty) {
                      for (var i = 0;
                          i < controller.stockConsumptionListmodel!.data.length;
                          i++) {
                        textControllers.add(TextEditingController(text: "0"));
                      }
                    }

                    return controller.filteredData.value.length == 0
                        ? ListView.builder(
                            itemCount: controller
                                .stockConsumptionListmodel!.data.length,
                            itemBuilder: (context, index) {
                              var details = controller
                                  .stockConsumptionListmodel!.data[index];
                              var availableQty = details.availableQty;

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: mediaquery.height * .12,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  details.stockName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: regular,
                                                  ),
                                                ),
                                                Text(
                                                  details.unitName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: SemiBold,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat('dd MMM yyyy')
                                                      .format(
                                                        DateTime.parse(controller
                                                            .Stockconsumptiondate
                                                            .text),
                                                      )
                                                      .toString(),
                                                  style: header9.copyWith(
                                                    fontFamily: Medium,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                "assets/images/arroe.png",
                                              ),
                                            ),
                                          ),
                                          w2,
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height:
                                                      mediaquery.height * 0.06,
                                                  width: 106,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Color.fromARGB(
                                                        255, 54, 51, 140),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      child: TextField(
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) {
                                                          if (double.tryParse(
                                                                      value) !=
                                                                  null &&
                                                              double.parse(
                                                                      value) >
                                                                  availableQty) {
                                                            textControllers[
                                                                        index]
                                                                    .text =
                                                                availableQty
                                                                    .toString();
                                                            textControllers[
                                                                        index]
                                                                    .selection =
                                                                TextSelection.fromPosition(TextPosition(
                                                                    offset: textControllers[
                                                                            index]
                                                                        .text
                                                                        .length));
                                                          } else {
                                                            controller
                                                                .consumpationiteams
                                                                .removeWhere((element) =>
                                                                    element
                                                                        .material_id ==
                                                                    details
                                                                        .materialId
                                                                        .toString());

                                                            controller
                                                                .consumpationiteams
                                                                .add(
                                                                    StockArrayIteams(
                                                              location_id: details
                                                                  .locationId
                                                                  .toString(),
                                                              material_id: details
                                                                  .materialId
                                                                  .toString(),
                                                              quantity:
                                                                  textControllers[
                                                                          index]
                                                                      .text
                                                                      .toString(),
                                                              stock_id: details
                                                                  .stockId
                                                                  .toString(),
                                                              unit_id: details
                                                                  .unitId
                                                                  .toString(),
                                                            ));
                                                          }

                                                          print(controller
                                                              .stockiteams
                                                              .toList());
                                                        },
                                                        controller:
                                                            textControllers[
                                                                index],
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                h1,
                                                Text(
                                                  "Available Qtys : ${availableQty.toString()}",
                                                  style: header9.copyWith(
                                                    fontFamily: Medium,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: controller.filteredData.value.length,
                            itemBuilder: (context, index) {
                              var details =
                                  controller.filteredData.value[index];
                              var availableQty = details.availableQty;

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: mediaquery.height * .12,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  details.stockName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: regular,
                                                  ),
                                                ),
                                                Text(
                                                  details.unitName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: SemiBold,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat('dd MMM yyyy')
                                                      .format(
                                                        DateTime.parse(controller
                                                            .Stockconsumptiondate
                                                            .text),
                                                      )
                                                      .toString(),
                                                  style: header9.copyWith(
                                                    fontFamily: Medium,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                "assets/images/arroe.png",
                                              ),
                                            ),
                                          ),
                                          w2,
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height:
                                                      mediaquery.height * 0.06,
                                                  width: 106,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: Color.fromARGB(
                                                        255, 54, 51, 140),
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              bottom: 10),
                                                      child: TextField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onChanged: (value) {
                                                          if (double.tryParse(
                                                                      value) !=
                                                                  null &&
                                                              double.parse(
                                                                      value) >
                                                                  availableQty) {
                                                            textControllers[
                                                                        index]
                                                                    .text =
                                                                availableQty
                                                                    .toString();
                                                            textControllers[
                                                                        index]
                                                                    .selection =
                                                                TextSelection.fromPosition(TextPosition(
                                                                    offset: textControllers[
                                                                            index]
                                                                        .text
                                                                        .length));
                                                          } else {
                                                            controller
                                                                .consumpationiteams
                                                                .removeWhere((element) =>
                                                                    element
                                                                        .material_id ==
                                                                    details
                                                                        .materialId
                                                                        .toString());

                                                            controller
                                                                .consumpationiteams
                                                                .add(
                                                                    StockArrayIteams(
                                                              location_id: details
                                                                  .locationId
                                                                  .toString(),
                                                              material_id: details
                                                                  .materialId
                                                                  .toString(),
                                                              quantity:
                                                                  textControllers[
                                                                          index]
                                                                      .text
                                                                      .toString(),
                                                              stock_id: details
                                                                  .stockId
                                                                  .toString(),
                                                              unit_id: details
                                                                  .unitId
                                                                  .toString(),
                                                            ));
                                                          }

                                                          print(controller
                                                              .stockiteams
                                                              .toList());
                                                        },
                                                        controller:
                                                            textControllers[
                                                                index],
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        decoration:
                                                            const InputDecoration(
                                                          border:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  Colors.white,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                h1,
                                                Text(
                                                  "Available Qtys : ${availableQty.toString()}",
                                                  style: header9.copyWith(
                                                    fontFamily: Medium,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
