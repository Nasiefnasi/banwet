import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/data/model/WageModel/wage_labour_model.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import '../../../../../Style/const.dart';
import '../../../../../data/model/WageModel/quick_wage.dart';
import '../controllers/labour_wageslip_controller.dart';
import 'component/sechfieldComponent.dart';

class QuickWageView extends StatelessWidget {
  QuickWageView({super.key});

  final LabourWageslipController controller =
      Get.put(LabourWageslipController());

  @override
  Widget build(BuildContext context) {
    // RxInt count = 0.obs;
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Obx(
            () => SubmitButtons(
              isLoading: controller.isLoading,
              text: 'Submit - ${controller.quickWage.length}',
              onTap: () async {
                if (controller.quickWage.isNotEmpty) {
                  String formattedDate = DateFormat('yyyy-MM-dd')
                      .format(controller.newregistercasedate.value);
                  print(formattedDate);

                  // var date =
                  //     await "${controller.newregistercasedate.value.day.toString()}-${controller.newregistercasedate.value.month.toString()}-${controller.newregistercasedate.value.year}";
                  controller.addQuickWageSlip();
                }
              },
            ),
          ),
        ),
        // bottomNavigationBar: GestureDetector(
        //   onTap: () async {
        //     if (controller.quickWage.isNotEmpty) {
        //       String formattedDate = await DateFormat('yyyy-MM-dd')
        //           .format(controller.newregistercasedate.value);
        //       print(formattedDate);

        //       // var date =
        //       //     await "${controller.newregistercasedate.value.day.toString()}-${controller.newregistercasedate.value.month.toString()}-${controller.newregistercasedate.value.year}";
        //       controller.addQuickWageSlip();
        //     }
        //   },
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Container(
        //       height: 7.h,
        //       width: 100.w,
        //       decoration: BoxDecoration(
        //           color: bColor, borderRadius: BorderRadius.circular(10)),
        //       child: Center(
        //         child: Obx(() => controller.isLoading.value
        //             ? SpinKitThreeBounce(color: bColor)
        //             : Text(
        //                 'Submit - ${controller.quickWage.length}',
        //                 style: header15.copyWith(color: Colors.white),
        //               )),
        //       ),
        //     ),
        //   ),
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h2,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      controller.quickWage.clear();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  width5,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Quick Wage Slip",
                        style: header15,
                      ),
                      SizedBox(
                        width: 57.w,
                        child: Text(
                          "controller.argumentData[workname]",
                          style: header9,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              h1,
              // DateTimePicker(
              //               autofocus: false,
              //               controller: controller.quickWageDateController,
              //               //  initialValue: '',
              //               firstDate: DateTime(2000),
              //               lastDate: DateTime.now(),
              //               // dateLabelText: 'Start Date',

              //               decoration: InputDecoration(
              //                 icon: const Icon(
              //                   Icons.event_note,
              //                   color: Colors.grey,
              //                 ),
              //                 labelText: "Bill Date",
              //                 labelStyle:
              //                     header11.copyWith(color: Colors.black54),
              //                 enabledBorder: const UnderlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Colors.black26, width: 1.0),
              //                 ),
              //               ),
              //               // dateLabelText: 'Start Date',
              //               ),
              // h1,
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                    // height: 75,
                    width: 160,
                    child: DateTimePickers(
                        style: TextStyle(fontSize: 16, fontFamily: Medium),
                        controller: controller.quickWageDateController,
                        label: "Select Date")),
              ),
              h1,
              // Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Align(
              //       alignment: Alignment.centerLeft,
              //       child: Obx(
              //         () => DateUiWedget(
              //           ontap: () async {
              //             controller.newcasedate(context);
              //             // count = (count.value += 1) as RxInt;
              //           },
              //           titel: "Select Date",
              //           date:
              //               "${DateFormat('dd-MM-yyyy').format(controller.newregistercasedate.value).toString()}",
              //           // "${controller.newregistercasedate.value.day.toString()}-${controller.newregistercasedate.value.month.toString()}-${controller.newregistercasedate.value.year}"),
              //         ),
              //       ),
              //     )),
              // h3,
              SearchTextFiledWidgets(),
              const SizedBox(height: 5),
              Container(
                // width: double.maxFinite,
                // constraints: BoxConstraints(maxHeight: mediaquery.height),
                child: const Expanded(child: LabourWageclass()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateUiWedget extends StatelessWidget {
  const DateUiWedget({
    super.key,
    required this.ontap,
    required this.titel,
    required this.date,
  });
  final void Function() ontap;
  final String titel;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: SizedBox(
            width: 160,
            // height: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                Container(
                  // color: Colors.brown,
                  // height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titel,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: regular,
                          // fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          date,
                          // "${PickDateController.AdminSideCaseListStartDate.day.toString().padLeft(2, '0')}/${PickDateController.selectedDate.month.toString().padLeft(2, '0')}/${PickDateController.selectedDate.year}",
                          style: TextStyle(
                            fontFamily: Medium,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // color: Colors.amberAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .001,
            width: 110,
            child: const Divider(
              color: Colors.black12,
              thickness: 1,
              height: 10,
              indent: 5,
            ),
          ),
        ),
      ],
    );
  }
}

class LabourWageclass extends StatelessWidget {
  const LabourWageclass({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      child: GetBuilder<LabourWageslipController>(
        init: LabourWageslipController(),
        builder: (controller) {
          if (controller.wageListModel == null) {
            return SpinKitThreeBounce(color: bColor);
          }
          if (controller.wageListModel!.labours!.isEmpty) {
            return const Text("No items");
          }
          return Container(
              height: controller.wageListModel!.labours!.length * 80.0,
              width: double.maxFinite,
              constraints: BoxConstraints(maxHeight: mediaquery.height * 0.61),
              child: controller.filteredData.value.length == 0
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.wageListModel!.labours!.length,
                      itemBuilder: (context, index) {
                        return MyWidget(
                            controller.wageListModel?.labours?[index]);
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.filteredData.length,
                      itemBuilder: (context, index) {
                        return MyWidget(controller.filteredData[index]);
                      },
                    ));
        },
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget(this.details, {super.key});

  final details;

  final LabourWageslipController controller =
      Get.put(LabourWageslipController());

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    Labours? labour = details;

    if (labour == null) {
      return Container(
        height: mediaquery.height * .21,
        margin: EdgeInsets.symmetric(vertical: .5.h),
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: const Center(child: Text('No labour data available')),
      );
    }

    // var totalshowlistamount = labour.wagetotalamount.value == 0.0
    //     ? double.parse(labour.dailyWage.toString()).obs
    //     : double.parse(labour.wagetotalamount.value.toString()).obs;
    // print(totalshowlistamount.value);
    // print("otalshowlistamount.value${labour.wagetotalamount.value}");

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
                          style: wheader11.copyWith(
                            fontFamily: regular,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: FlutterSwitch(
                                activeColor: Colors.green,
                                width: 50.0,
                                height: 24.0,
                                valueFontSize: 11.0,
                                inactiveTextFontWeight: FontWeight.w400,
                                activeTextFontWeight: FontWeight.w400,
                                toggleSize: 20.0,
                                value: labour.isSelected.value,
                                borderRadius: 30.0,
                                // padding: 2.0,
                                showOnOff: true,
                                onToggle: (val) async {
                                  labour.isSelected.value = val;
                                  if (val) {
                                    // if(){}
                                    controller.quickWage.add(Labourss(
                                      labourId: labour.labourId.toString(),
                                      basicWage: labour.dailyWage.toString(),
                                      overtimeWage:
                                          labour.overtimeRate?.toString() ??
                                              "0",
                                      workdays:
                                          labour.isdays.value ? "0.5" : "1",
                                      overtimeduration: "0",
                                      overtimerate:
                                          labour.overtimeRate.toString(),
                                    ));
                                  } else {
                                    controller.quickWage.removeWhere(
                                        (element) =>
                                            element.labourId ==
                                            labour.labourId.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Obx(
                      //   () => InkWell(
                      //     onTap: () {
                      //       labour.isdays.value = !labour.isdays.value;

                      //       int index = controller.quickWage.indexWhere(
                      //           (element) =>
                      //               element.labourId == labour.labourId);
                      //       if (index != -1) {
                      //         // Update the workdays property of the labour at the found index
                      //         controller.quickWage[index].workdays =
                      //             labour.isdays.value ? "0.5" : "1";
                      //       }

                      //       // if (controller.quickWage
                      //       //     .contains(labour.labourId)) {
                      //       //   // controller.quickWage.where((element) =>
                      //       //   //       element.labourId ==
                      //       //   //       labour.labourId.toString());
                      //       // }
                      //     },
                      //     child: Container(
                      //       height: 37,
                      //       padding: const EdgeInsets.symmetric(horizontal: 23),
                      //       decoration: ShapeDecoration(
                      //         color: const Color(0xFFF8F8F8),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(5)),
                      //       ),
                      //       child: Center(
                      //         child: Text(
                      //           labour.isdays.value ? "Half Day" : "Full Day",
                      //           style: header10.copyWith(
                      //               fontSize: 13,
                      //               fontFamily: Medium,
                      //               color: labour.isdays.value
                      //                   ? Colors.orange
                      //                   : const Color.fromARGB(
                      //                       255, 19, 177, 29)),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // w2,
                      InkWell(
                        onTap: () {
                          // if (labour.isSelected.value) {
                          //   labour.isSelected.value = false;
                          //   controller.quickWage.removeWhere((element) =>
                          //       element.labourId == labour.labourId.toString());
                          // } else {
                          addWage(
                              details,
                              context,
                              labour.labourName,
                              labour.workType,
                              labour.dailyWage.toString(),
                              labour.labourId.toString(),
                              labour.overtimeRate,
                              labour);
                          // }
                        },
                        child: Container(
                          // height: 37,
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.h, vertical: .5.h),
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
                                  fontSize: 12,
                                  color: const Color(0xFF737373)),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(() {
                        var totalshowlistamount =
                            labour.wagetotalamount.value == 0.0
                                ? double.parse(labour.dailyWage.toString()).obs
                                : double.parse(
                                        labour.wagetotalamount.value.toString())
                                    .obs;
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
                                    text: totalshowlistamount.value.toString(),

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
                      }),
                    ],
                  ),
                  // h1,
                  // Obx(
                  //   () => labour.isSelected.value == true
                  //       ? RichText(
                  //           text: TextSpan(
                  //             text: "Dated on : ",
                  //             style: wheader12.copyWith(
                  //                 fontFamily: Medium, fontSize: 11),
                  //             children: [
                  //               TextSpan(
                  //                 text:
                  //                     "${DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(controller.quickWageDateController.text))}",
                  //                 // "${controller.newregistercasedate.value.day.toString()} - ${controller.newregistercasedate.value.month.toString()} - ${controller.newregistercasedate.value.year}",
                  //                 // DateFormat('dd MMM yyyy').format(
                  //                 //   DateFormat('dd-MM-yyyy').parse("01-2-2021"),
                  //                 // ),
                  //                 style: wheader10.copyWith(fontSize: 11),
                  //               ),
                  //             ],
                  //           ),
                  //         )
                  //       : Container(),
                  // )
                  h1
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future addWage(
    Labours details,
    context,
    String? name,
    String? type,
    String? basicWage,
    String labourid,
    int? overtimerate,
    Labours labour) async {
  TextEditingController overtinerateing =
      TextEditingController(text: overtimerate.toString());
  LabourWageslipController controller = Get.put(LabourWageslipController());
  // var totalAmount = double.parse(basicWage.toString()).obs;
  var totalAmount = 0.0.obs;
  double overtimeWage = 0.0;
  double overtimerat = 0.0;
  overtimerat = overtimerate!.toDouble();
  calculate() {
    totalAmount.value = overtimeWage * (overtimerat);
    controller.fullamount.value = totalAmount.value.toInt();

    log(totalAmount.toString());
  }

  // TextEditingController editebasicWage = TextEditingController();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      var mediaquery = MediaQuery.of(context).size;
      // controller.aa.value=int.parse(bWage.toString());
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: 50.h,
            width: 110.w,
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(2.h),
                  // height: 80.h,
                  width: 100.w,
                  child: Form(
                    //key: _popup,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // h1,
                        // Center(
                        //   child: Text(
                        //     'ADD ON',
                        //     style: header2.copyWith(
                        //       fontSize: 16,
                        //       fontFamily: Medium,
                        //     ),
                        //   ),
                        // ),
                        h1,

                        // TextFormField(
                        //   enableInteractiveSelection: true,
                        //   // controller: editebasicWage,
                        //   // readOnly: true,
                        //   validator: (value) {
                        //     if (value == null) {
                        //       return 'Please Fill Field';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   initialValue: basicWage,
                        //   onChanged: (value) {
                        //     basicWage = value;
                        //   },
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     labelText: 'Basic Wage',
                        //     contentPadding: const EdgeInsets.only(top: 10),
                        //     focusedBorder: const UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.black26),
                        //     ),
                        //     // contentPadding: contentPadding,
                        //     border: const UnderlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.black26),
                        //     ),
                        //     enabledBorder: const UnderlineInputBorder(
                        //       borderSide:
                        //           BorderSide(color: Colors.black26, width: 1.0),
                        //     ),
                        //     errorBorder: const UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //           style: BorderStyle.solid,
                        //           color: Colors.red,
                        //           // controller.errormessage.value ??
                        //           //     Color.fromARGB(255, 211, 211, 211),
                        //           width: 1),
                        //     ),
                        //     focusedErrorBorder: const UnderlineInputBorder(
                        //       borderSide: BorderSide(
                        //           style: BorderStyle.solid,
                        //           color: Color.fromARGB(255, 211, 211, 211),
                        //           width: 1),
                        //     ),

                        //     // fillColor: boxcolor ?? const Color.fromARGB(255, 255, 255, 255),
                        //     filled: true,
                        //     // suffixIcon: Text("₹"),
                        //     prefixIcon: const Padding(
                        //       padding: EdgeInsets.only(
                        //         top: 10,
                        //         left: 15,
                        //       ),
                        //       child: const Text(
                        //         "₹",
                        //         style: TextStyle(
                        //           fontSize: 22,
                        //           color: Colors.black45,
                        //         ),
                        //       ),
                        //     ),

                        //     hintText: "Basic Wage",
                        //     hintStyle: TextStyle(
                        //       fontFamily: Medium,
                        //       color: Colors.black38,
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 16,
                        //     ),
                        //     errorStyle: const TextStyle(
                        //       fontSize: 12, // Adjust the font size
                        //       height: 0.01, // Adjust the height
                        //       color: Color.fromARGB(
                        //           255, 219, 199, 198), // Adjust the color
                        //     ),
                        //     // fillColor: Colors.white,
                        //   ),
                        // ),
                        h2,
                        SizedBox(
                          // height: 15.h,
                          // color: Colors.amber,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              // Expanded(
                              //   child: Column(
                              //     children: [
                              //       const Text("Overtime Duration"),
                              //       ElevatedButton(
                              //           onPressed: () {},
                              //           child: const Text("data"))
                              //     ],
                              //   ),
                              // ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Basic Wage",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black54,
                                          fontFamily: Medium),
                                    ),
                                    h1,
                                    Container(
                                      height: 48,
                                      width: mediaquery.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors
                                              .black26, // You can change the color to whatever you need
                                          width: 1.5, // Border width
                                        ),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: TextFormField(
                                            textAlign: TextAlign.center,
                                            enableInteractiveSelection: true,
                                            // controller: editebasicWage,
                                            // readOnly: true,
                                            validator: (value) {
                                              if (value == null) {
                                                return 'Please Fill Field';
                                              } else {
                                                return null;
                                              }
                                            },
                                            initialValue: basicWage,
                                            onChanged: (value) {
                                              basicWage = value;
                                            },
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              // labelText: 'Basic Wage',
                                              contentPadding:
                                                  const EdgeInsets.only(top: 0),
                                              focusedBorder: InputBorder.none,
                                              // contentPadding: contentPadding,
                                              border: InputBorder.none,

                                              enabledBorder: InputBorder.none,
                                              //     const UnderlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //       color: Colors.black26,
                                              //       width: 1.0),
                                              // ),
                                              errorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    style: BorderStyle.solid,
                                                    color: Colors.red,
                                                    // controller.errormessage.value ??
                                                    //     Color.fromARGB(255, 211, 211, 211),
                                                    width: 1),
                                              ),
                                              focusedErrorBorder:
                                                  InputBorder.none,

                                              // fillColor: boxcolor ?? const Color.fromARGB(255, 255, 255, 255),
                                              filled: true,
                                              // suffixIcon: Text("₹"),
                                              prefix: const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "₹",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "robot"),
                                                ),
                                              ),

                                              hintText: "Basic Wage",
                                              hintStyle: TextStyle(
                                                fontFamily: Medium,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                              errorStyle: const TextStyle(
                                                fontSize:
                                                    12, // Adjust the font size
                                                height:
                                                    0.01, // Adjust the height
                                                color: Color.fromARGB(
                                                    255,
                                                    219,
                                                    199,
                                                    198), // Adjust the color
                                              ),
                                              // fillColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    // ElevatedButton(
                                    //     onPressed: () {}, child: Text("data"))
                                  ],
                                ),
                              ),
                              w2,
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No of Days",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black54,
                                          fontFamily: Medium),
                                    ),
                                    h1,
                                    Container(
                                      height: 48,
                                      width: mediaquery.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors
                                              .black26, // You can change the color to whatever you need
                                          width: 1.5, // Border width
                                        ),
                                      ),
                                      child: Obx(
                                        () => InkWell(
                                          onTap: () async {
                                            labour.isdays.value =
                                                !labour.isdays.value;

                                            // int index = controller.quickWage
                                            //     .indexWhere((element) =>
                                            //         element.labourId ==
                                            //         labour.labourId);
                                            // if (index != -1) {
                                            //   // Update the workdays property of the labour at the found index
                                            //   controller.quickWage[index]
                                            //           .workdays =
                                            //       labour.isdays.value
                                            //           ? "0.5"
                                            //           : "1";
                                            // }

                                            // if (controller.quickWage
                                            //     .contains(labour.labourId)) {
                                            //   // controller.quickWage.where((element) =>
                                            //   //       element.labourId ==
                                            //   //       labour.labourId.toString());
                                            // }
                                          },
                                          child: Container(
                                            height: 37,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 23),
                                            decoration: ShapeDecoration(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                labour.isdays.value
                                                    ? "Half Day"
                                                    : "Full Day",
                                                style: header10.copyWith(
                                                    fontSize: 13,
                                                    fontFamily: Medium,
                                                    color: labour.isdays.value
                                                        ? Colors.orange
                                                        : const Color.fromARGB(
                                                            255, 19, 177, 29)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //                                    TextFormField(
                                      //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      //   inputFormatters: [
                                      //     FilteringTextInputFormatter.allow(RegExp(r'^[0-9\.]*$')),
                                      //     // CustomInputFormatter(['1', '0.5']),
                                      //   ],
                                      //   validator: (value) {
                                      //     if (value != '1' && value != '0.5') {
                                      //       return 'Please enter 1 or 0.5';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   decoration: InputDecoration(
                                      //     labelText: 'Enter 1 or 0.5',
                                      //     border: OutlineInputBorder(),
                                      //   ),
                                      // )
                                      //  Center(
                                      //     child: Text(labour.isdays.value
                                      //         ? ".5"
                                      //         : "1")),
                                    )
                                    // ElevatedButton(
                                    //     onPressed: () {}, child: Text("data"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        h2,
                        SizedBox(
                          // height: 15.h,
                          // color: Colors.amber,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              // Expanded(
                              //   child: Column(
                              //     children: [
                              //       const Text("Overtime Duration"),
                              //       ElevatedButton(
                              //           onPressed: () {},
                              //           child: const Text("data"))
                              //     ],
                              //   ),
                              // ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Overtime Duration",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black54,
                                          fontFamily: Medium),
                                    ),
                                    h1,
                                    Container(
                                      height: 48,
                                      width: mediaquery.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors
                                              .black26, // You can change the color to whatever you need
                                          width: 1.5, // Border width
                                        ),
                                      ),
                                      child: Center(
                                        child: TextFormField(
                                          enableInteractiveSelection: true,
                                          initialValue: 0.toString(),
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            overtimeWage = double.parse(value);
                                            calculate();
                                          },
                                          textAlign: TextAlign.center,
                                          // controller: controller.overtimeWage,
                                          decoration: InputDecoration(
                                            hintText: "0",
                                            contentPadding:
                                                const EdgeInsets.only(top: 0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                            hintStyle: const TextStyle(
                                              fontFamily: 'Medium',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    // ElevatedButton(
                                    //     onPressed: () {}, child: Text("data"))
                                  ],
                                ),
                              ),
                              w2,
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Overtime Rate",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black54,
                                          fontFamily: Medium),
                                    ),
                                    h1,
                                    Container(
                                      height: 48,
                                      width: mediaquery.width,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors
                                              .black26, // You can change the color to whatever you need
                                          width: 1.5, // Border width
                                        ),
                                      ),
                                      child: Center(
                                        child: TextField(
                                          onChanged: (value) async {
                                            if (value == '') {
                                              overtimerat = 0;
                                              calculate();
                                            } else {
                                              overtimerat = double.parse(
                                                  value.toString());
                                              calculate();
                                            }

                                            // overtinerateing= TextEditingController(  text:  value.toString());
                                          },
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          controller: overtinerateing,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(top: 0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                            hintStyle: const TextStyle(
                                              fontFamily: 'Medium',
                                              color: Colors.black38,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    // ElevatedButton(
                                    //     onPressed: () {}, child: Text("data"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(

                        h2,

                        Container(
                          // height: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Overtime Amount",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black54,
                                    fontFamily: Medium),
                              ),
                              h1,
                              Container(
                                height: 48,
                                width: mediaquery.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors
                                        .black26, // You can change the color to whatever you need
                                    width: 1.5, // Border width
                                  ),
                                ),
                                child: Center(
                                  child: Obx(() {
                                    return Text(
                                        "₹ ${totalAmount.value.toString()}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500));
                                  }),
                                ),
                              )
                              // ElevatedButton(
                              //     onPressed: () {}, child: Text("data"))
                            ],
                          ),
                        ),

                        h2,

                        // h3,
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      // controller.quickWage.add(Labourss(
                                      //   labourId: labourid,
                                      //   basicWage: basicWage ?? "0",
                                      //   // isSelected: true,
                                      //   overtimeWage:
                                      //       " ${overtimeWage ?? "0"}",
                                      // ));
                                      // controller
                                      //     .wageListModel!
                                      //     .labours![index]
                                      //     .isSelected
                                      //     .value = true;
                                      // controller.overtimeWage.clear();
                                    },
                                    child: Container(
                                      height: 53,
                                      // width: 35.w,
                                      decoration: BoxDecoration(
                                          color: bColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'Back',
                                          style: wheader4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              w2,
                              Expanded(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      details
                                          .wagetotalamount.value = totalAmount
                                              .value +
                                          (double.parse(basicWage.toString()) *
                                              double.parse(labour.isdays.value
                                                  ? ".5"
                                                  : "1"));
                                      print(
                                          "hhhhhhhhhhhhhhhhhhhheeeeeeeeeeeeeeeelllllllllllllllllloooooooooo${details.wagetotalamount.value}");
                                      // details.wageamount.value =
                                      //     double.parse(basicWage.toString()); tht
                                      Get.back();

                                      controller.quickWage.removeWhere(
                                          (element) =>
                                              element.labourId ==
                                              labour.labourId.toString());
                                      // if (controller
                                      //         .wageListModel!
                                      //         .labours![index]
                                      //         .isSelected
                                      //         .value ==
                                      //     false) {
                                      details.isSelected.value = true;
                                      controller.quickWage.add(Labourss(
                                        workdays:
                                            labour.isdays.value ? ".5" : "1",
                                        labourId: labourid,
                                        basicWage: basicWage ?? "0",
                                        overtimeduration:
                                            overtimeWage.toString(),
                                        overtimerate: overtimerat.toString(),
                                        overtimeWage:
                                            " ${totalAmount.value ?? "0"}",
                                      ));
                                      // } else{

                                      // }
                                      // else{
                                      //   controller
                                      //     .wageListModel!
                                      //     .labours![index]
                                      //     .isSelected
                                      //     .value != true;

                                      // }

                                      controller.overtimeWage.clear();
                                    },
                                    child: Container(
                                      height: 53,
                                      // width: 35.w,
                                      decoration: BoxDecoration(
                                          color: bColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'Save',
                                          style: wheader4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
