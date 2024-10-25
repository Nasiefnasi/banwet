import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/addwageslip_controller.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_header.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../common_widegt/datatimepicker.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../daily_note/views/add_dailynote.dart';

class SelectLabourComponent extends StatelessWidget {
  SelectLabourComponent({super.key, required this.postionNotifier});
  AddwageslipController controller = Get.put(AddwageslipController());
  ValueNotifier<bool> postionNotifier;
  RxBool islabour = false.obs;

  @override
  Widget build(BuildContext context) {
    // controller.overtimeDurationValue.value = 0.0;

    return Obx(
      () => Form(
        key: controller.key1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SearchField(
            //   focusNode: controller.focusNode,
            //   searchStyle: header11.copyWith(color: Colors.black),
            //   suggestionItemDecoration: BoxDecoration(color: bColor2),
            //   suggestionStyle: header11,
            //   controller: controller.selectLabour,
            //   searchInputDecoration: InputDecoration(
            //     labelText: 'Select Labour',
            //     labelStyle: header11.copyWith(color: Colors.black54),
            //     suffixIcon:
            //         const Icon(Icons.arrow_drop_down, color: Colors.grey),
            //     icon: cImage(
            //         "https://cdn-icons-png.flaticon.com/512/3716/3716527.png"),
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //           color: islabour.value ? Colors.red : Colors.black26,
            //           width: 1.0),
            //     ),
            //   ),
            //   suggestions: controller.wageListModel!.labours!
            //       .map(
            //         (e) => SearchFieldListItem(e.labourName.toString(),
            //             child: Text('  ${e.labourName ?? ""}', style: header11),
            //             item: e),
            //       )
            //       .toList(),
            //   onSuggestionTap: (value) {
            //     FocusScope.of(context).unfocus();
            //     controller.overtimeRateController.text =
            //         value.item!.overtimeRate.toString();
            //     controller.ta.text = value.item!.ta_per_day.toString();
            //     controller.overtimeRatevalue.value =
            //         double.parse(value.item!.overtimeRate.toString());
            //     controller.labourId = value.item!.labourId.toString();
            //     controller.basicWage.value =
            //         double.parse(value.item!.dailyWage.toString());
            //     controller.preBalanceAmount.value =
            //         double.parse(value.item!.currentBalancePersonal.toString());
            //     controller.calculateTotalWage();
            //     controller.update();
            //   },
            // ),
            SearchField(
              focusNode: controller.focusNode, // The focus node added here
              searchStyle: header11.copyWith(color: Colors.black),
              suggestionItemDecoration: BoxDecoration(color: bColor2),
              suggestionStyle: header11,
              controller: controller.selectLabour,
              searchInputDecoration: InputDecoration(
                labelText: 'Select Labour',
                labelStyle: header11.copyWith(color: Colors.black54),
                suffixIcon:
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                icon: cImage(
                    "https://cdn-icons-png.flaticon.com/512/3716/3716527.png"),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: islabour.value ? Colors.red : Colors.black26,
                      width: 1.0),
                ),
              ),
              suggestions: controller.wageListModel!.labours!
                  .map(
                    (e) => SearchFieldListItem(
                      e.labourName.toString(),
                      child: Text('  ${e.labourName ?? ""}', style: header11),
                      item: e,
                    ),
                  )
                  .toList(),
              onSuggestionTap: (value) {
                FocusScope.of(context).unfocus();
                controller.overtimeRateController.text =
                    value.item!.overtimeRate.toString();
                controller.ta.text = value.item!.ta_per_day.toString();
                controller.overtimeRatevalue.value =
                    double.parse(value.item!.overtimeRate.toString());
                controller.labourId = value.item!.labourId.toString();
                controller.basicWage.value =
                    double.parse(value.item!.dailyWage.toString());
                controller.preBalanceAmount.value =
                    double.parse(value.item!.currentBalancePersonal.toString());
                controller.calculateTotalWage();
                controller.update();
              },
            ),

            // SearchField(
            //   searchStyle: header10.copyWith(
            //     color: Colors.black87,
            //   ),
            //   suggestionItemDecoration: BoxDecoration(color: bColor2),
            //   suggestionStyle: header11,
            //   controller: controller.selectLabour,
            //   // validator: (p0) {
            //   //   if (p0 == null || p0.isEmpty) {
            //   //     // return 'Please enter an email address';
            //   //     return "";
            //   //   }
            //   //   return null;
            //   // },
            //   searchInputDecoration: InputDecoration(
            //     labelText: 'Select Labour',
            //     labelStyle: header11.copyWith(color: Colors.black54),
            //     suffixIcon:
            //         const Icon(Icons.arrow_drop_down, color: Colors.grey),
            //     icon: cImage(
            //         "https://cdn-icons-png.flaticon.com/512/3716/3716527.png"),
            //     enabledBorder: UnderlineInputBorder(
            //       borderSide: BorderSide(
            //           color: islabour.value ? Colors.red : Colors.black26,
            //           width: 1.0),
            //     ),
            //   ),
            //   suggestions: controller.wageListModel!.labours!
            //       .map(
            //         (e) => SearchFieldListItem(e.labourName.toString(),
            //             child: Text('  ${e.labourName ?? ""}', style: header11),
            //             item: e),
            //       )
            //       .toList(),
            //   onSuggestionTap: (value) {
            //     FocusScope.of(context).unfocus();
            //     controller.overtimeRateController.text =
            //         value.item!.overtimeRate.toString();
            //     controller.ta.text = value.item!.ta_per_day.toString();
            //     controller.overtimeRatevalue.value =
            //         double.parse(value.item!.overtimeRate.toString());
            //     controller.labourId = value.item!.labourId.toString();
            //     controller.basicWage.value =
            //         double.parse(value.item!.dailyWage.toString());
            //     controller.preBalanceAmount.value =
            //         double.parse(value.item!.currentBalancePersonal.toString());
            //     controller.calculateTotalWage();
            //     controller.update();
            //   },
            // ),
            h3,
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                height: 7.h,
                width: 100.w,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffdfdfdf)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Basic Wage/Day",
                        style: TextStyle(fontSize: 11, fontFamily: regular)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('₹',
                            style: TextStyle(
                                fontSize: 13.5.sp,
                                fontWeight: FontWeight.bold)),
                        w1,
                        Obx(() => Text(
                              controller.basicWage.value.toString(),
                              style: header12.copyWith(
                                  color: Colors.black,
                                  fontSize: 13.5.sp,
                                  fontFamily: Medium,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            h2,
            DateTimePickers2(
                validator: Validators.noneEmptyValidator,
                controller: controller.workDate,
                label: "Work Date"),
            h2,
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return 'Please enter an email address';
                        return "";
                      }
                      return null;
                    },
                    controller: controller.nolabourworked,
                    keyboard: TextInputType.phone,
                    label: "No Labour Worked",
                    icon: cImage(
                        "https://cdn-icons-png.flaticon.com/512/4490/4490362.png"),
                    onChanged: (value) async {
                      // if (value != "0") {
                      //   controller.numberofLabours.value =
                      //       double.parse(value.toString());
                      //   controller.calculateAmountoflabousanddays();
                      // }

                      if (controller.nolabourworked.text.isEmpty) {
                        // If it's empty, set the value to '0'
                        controller.nolabourworked.text = '0';
                        // if (value) {}
                        if (value == "0") {
                          controller.nolabourworked.text = '1';
                          // controller.nolabourworked.text = "1";
                          // controller.nolabourworked.text = await '1';
                          // await controller.calculateAmountoflabousanddays();
                        } else {}
                      } else {
                        if (value.startsWith("0")) {
                          var a = value.substring(1);
                          if (value != "0" || value != "00") {
                            controller.nolabourworked.text = a;
                            controller.numberofLabours.value =
                                double.parse(a.toString());
                            await controller.calculateAmountoflabousanddays();
                          } else {
                            controller.nolabourworked.text = "1";
                          }

                          // controller.nolabourworked.text = a;
                          // controller.numberofLabours.value =
                          //     await double.parse(a.toString());
                          // await controller.calculateAmountoflabousanddays();
                        } else {
                          controller.numberofLabours.value =
                              double.parse(value.toString());
                          await controller.calculateAmountoflabousanddays();
                          // controller.numberofLabours.value = double.parse("1");
                          // await controller.calculateAmountoflabousanddays();
                        }
                      }
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      if (controller.nolabourworked.text == "0") {
                        controller.nolabourworked.text = "1";
                        await controller.calculateAmountoflabousanddays();
                      }
                    },
                    child: NewCaseTextField(
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Please enter an email address';
                          return "";
                        }
                        return null;
                      },
                      controller: controller.noDays,
                      keyboard: TextInputType.number,
                      label: "No Days",
                      icon: cImage(
                          "https://cdn-icons-png.flaticon.com/512/7025/7025956.png"),
                      onChanged: (value) async {
                        if (controller.nolabourworked.text == "0") {
                          controller.nolabourworked.text = "1";
                          controller.numberofLabours.value = double.parse("1");
                        }
                        // if (value == null) {
                        //   log("[[[]]]");
                        //   controller.numberofDays.value =
                        //       double.parse(0.toString());
                        //   controller.calculateAmountoflabousanddays();
                        // } else if (value != "0") {
                        //   log(value.toLowerCase());
                        //   controller.numberofDays.value =
                        //       double.parse(value.toString());
                        //   controller.calculateAmountoflabousanddays();
                        // }

                        if (controller.nolabourworked.text.isEmpty) {
                          // If it's empty, set the value to '0'
                          controller.nolabourworked.text = '1';
                          await controller.calculateAmountoflabousanddays();
                        } else {
                          controller.numberofDays.value =
                              double.parse(value.toString());
                          controller.calculateAmountoflabousanddays();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
            h2,
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    controller.calculateOvetimeWage();

                    return NewCaseTextField(
                        // initialValue: controller.overtimeDuration.text,
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        onChanged: (String? a) async {
                          if (controller.nolabourworked.text == "0") {
                            controller.nolabourworked.text = "1";
                            controller.numberofLabours.value =
                                double.parse("1");
                            await controller.calculateAmountoflabousanddays();
                          }
                          if (controller.overtimeDuration.text.isEmpty) {
                            controller.overtimeWages.value = 0.0;
                            controller.overtimeDuration.text = "0";
                            await controller.calculateOvetimeWage();
                            await controller.calculateTotalWage();

                            // If it's empty, set the value to '0'
                            // controller.overtimeDuration.text = '0';
                          } else {
                            if (a!.startsWith("0")) {
                              var value = a.substring(1);
                              controller.overtimeDuration.text = value;
                              controller.overtimeDurationValue.value =
                                  double.parse(value ?? "0");
                              await controller.calculateOvetimeWage();
                              await controller.calculateTotalWage();
                              print(
                                  controller.overtimeDurationValue.toString());
                            } else {
                              controller.overtimeDuration.text = a;
                              controller.overtimeDurationValue.value =
                                  double.parse(a ?? "0");
                              await controller.calculateOvetimeWage();
                              await controller.calculateTotalWage();
                            }
                          }
                        },
                        // validator: Validators.noneEmptyValidator,
                        controller: controller.overtimeDuration,
                        keyboard: TextInputType.number,
                        label: "OverTime Duration",
                        icon: cImage(
                            "https://cdn-icons-png.flaticon.com/512/7477/7477542.png"));
                  }),
                ),
                Expanded(
                  child: Obx(() {
                    controller.calculateOvetimeWage();
                    return NewCaseTextField(
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        onChanged: (String? a) async {
                          if (controller.nolabourworked.text == "0") {
                            controller.nolabourworked.text = "1";
                            controller.numberofLabours.value =
                                double.parse("1");
                            await controller.calculateAmountoflabousanddays();
                          }
                          if (controller.overtimeRateController.text.isEmpty) {
                            controller.overtimeRateController.text = "0";
                            controller.overtimeRatevalue.value = 0.0;
                            await controller.calculateOvetimeWage();
                            await controller.calculateTotalWage();
                          } else {
                            // if (a != "0") {
                            if (a!.startsWith("0")) {
                              var value = a.substring(1);
                              controller.overtimeRateController.text = value;
                              controller.overtimeRatevalue.value =
                                  double.parse(value.toString());
                              await controller.calculateOvetimeWage();
                              await controller.calculateTotalWage();
                            } else {
                              controller.overtimeRateController.text = a;
                              controller.overtimeRatevalue.value =
                                  double.parse(a.toString());
                              await controller.calculateOvetimeWage();
                              await controller.calculateTotalWage();
                            }

                            print(controller.overtimeRatevalue.toString());
                            // }
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return 'Please enter an email address';
                            return "";
                          }
                          return null;
                        },
                        controller: controller.overtimeRateController,
                        keyboard: TextInputType.number,
                        label: "Overtime Rate",
                        icon: cImage(
                            "https://cdn-icons-png.flaticon.com/512/4115/4115800.png"));
                  }),
                )
              ],
            ),
            h2,
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    controller.calculateOvetimeWage();

                    return NewCaseTextField(
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        onChanged: (value) async {
                          if (controller.nolabourworked.text == "0") {
                            controller.nolabourworked.text = "1";
                            controller.numberofLabours.value =
                                double.parse("1");
                            await controller.calculateAmountoflabousanddays();
                          }
                          if (controller.extraWage.text.isEmpty) {
                            controller.extraWage.text = "0";
                            await controller.calculateTotalWage();
                            await controller.calculateOvetimeWage();
                          } else {
                            if (value.startsWith("0")) {
                              controller.extraWage.text = value.substring(1);
                              await controller.calculateTotalWage();
                              await controller.calculateOvetimeWage();
                            } else {
                              controller.extraWage.text = value;
                              await controller.calculateTotalWage();
                              await controller.calculateOvetimeWage();
                            }
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return 'Please enter an email address';
                            return "";
                          }
                          return null;
                        },
                        controller: controller.extraWage,
                        keyboard: TextInputType.number,
                        label: "Exta Wage",
                        icon: billPayableAmt());
                  }),
                ),
                Expanded(
                  child: Obx(() {
                    controller.calculateOvetimeWage();
                    return NewCaseTextField(
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        onChanged: (value) async {
                          if (controller.nolabourworked.text == "0") {
                            controller.nolabourworked.text = "1";
                            controller.numberofLabours.value =
                                double.parse("1");
                            await controller.calculateAmountoflabousanddays();
                          }
                          if (controller.ta.text.isEmpty) {
                            controller.ta.text = "0";
                            await controller.calculateTotalWage();

                            await controller.calculateOvetimeWage();
                          } else {
                            controller.ta.clear();
                            if (value.startsWith("0")) {
                              controller.ta.text = value.substring(1);
                              await controller.calculateTotalWage();
                              controller.update();
                            } else {
                              controller.ta.text = value;
                              await controller.calculateTotalWage();
                              controller.update();
                            }
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return 'Please enter an email address';
                            return "";
                          }
                          return null;
                        },
                        controller: controller.ta,
                        keyboard: TextInputType.number,
                        label: "TA",
                        icon: cImage(
                            "https://cdn-icons-png.flaticon.com/512/3772/3772696.png"));
                  }),
                )
              ],
            ),
            h2,
            NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                //    validator: Validators.noneEmptyValidator,
                controller: controller.wageSlipRemarks,
                keyboard: TextInputType.name,
                label: "Wage Slip Remarks",
                icon: billRemarks()),
            h3,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => commenContainer(
                      controller.overtimeWages.value
                          .toStringAsFixed(2)
                          .toString(),
                      "Over Time Wage"),
                ),
                w1,
                Obx(() => commenContainer(
                    controller.totalWage.value.toStringAsFixed(2),
                    "Total Wage"))
              ],
            ),
            h3,
            SubmitButton(
                onTap: () async {
                  if (controller.nolabourworked.text == "0") {
                    controller.nolabourworked.text = "1";
                    await controller.calculateAmountoflabousanddays();
                  }
                  if (controller.key1.currentState!.validate() &&
                      controller.selectLabour.text.isNotEmpty) {
                    islabour.value = false;
                    postionNotifier.value = true;
                    postionNotifier.notifyListeners();
                  }
                  islabour.value = true;
                },
                text: "Continue to Make Payment"),
            h1,
          ],
        ),
      ),
    );
  }
}
