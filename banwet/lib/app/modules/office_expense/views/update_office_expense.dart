import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common_icontextform_feild.dart';
import '../../../common_widegt/datatimepicker.dart';
import '../../../common_widegt/loading.dart';
import '../../daily_note/views/add_dailynote.dart';
import '../controllers/office_expense_controller.dart';

class UpdateOfficeExpense extends StatelessWidget {
  var argumentData = Get.arguments;

  UpdateOfficeExpense({super.key});

  OfficeExpenseController controller = Get.put(OfficeExpenseController());
  bool taxPercentageSelected = false; // Flag to track tax percentage selection

  GlobalKey<FormState> key22 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: bColor,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Edit Expense",
              style: header15.copyWith(color: Colors.black),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          body: GetBuilder<OfficeExpenseController>(
            builder: (controller) => controller.expenseHeadModel == null
                ? loadingthreebounce
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0.h),
                    child: Form(
                      key: key22,
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          children: [
                            h3,
                            SearchField(
                              searchStyle: header11,
                              suggestionItemDecoration: BoxDecoration(
                                color: bColor2,
                              ),
                              suggestionStyle: header11,
                              controller: controller.expTypeCtrl,
                              validator: (p0) {
                                if (controller.expTypeCtrl.text.isEmpty) {
                                  return 'Expense Type is required';
                                } else if (!controller
                                    .expenseHeadModel!.expenseHeads!
                                    .any((e) => e.headName.toString() == p0)) {
                                  return 'Invalid Expense Type ';
                                } else {
                                  return null; // No error
                                }
                              },
                              searchInputDecoration: InputDecoration(
                                labelText: 'Expense Type',
                                labelStyle:
                                    header11.copyWith(color: Colors.black54),
                                suffixIcon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                icon: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                                  color: Colors.black,
                                  height: 3.h,
                                  width: 7.w,
                                  placeholder: (context, url) =>
                                      const SizedBox(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black26, width: 1.0),
                                ),
                              ),
                              suggestions:
                                  controller.expenseHeadModel!.expenseHeads!
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e.headName.toString(),
                                          child: Text(e.headName.toString(),
                                              style: header11),
                                          item: e,
                                        ),
                                      )
                                      .toList(),
                              onSuggestionTap: (p0) {
                                controller.expenseHeadId =
                                    p0.item!.headId.toString();
                              },
                            ),
                            h3,
                            SizedBox(
                              height: 60,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: NewCaseTextField(
                                        labelstyle: header11.copyWith(
                                            color: Colors.black54,
                                            fontSize: 12),
                                        mediaquery: MediaQuery.of(context).size,
                                        controller: controller.billNumber,
                                        keyboard: TextInputType.number,
                                        label: "Bill Number",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            // return 'Please enter an email address';
                                            return "";
                                          }
                                          return null;
                                        },
                                        icon: billRemarks()),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: mediaquery.width * .45,
                                      child: DateTimePickers(
                                        labelStyle: header11.copyWith(
                                            color: Colors.black54,
                                            fontSize: 12),
                                        style: header11.copyWith(
                                            color: Colors.black, fontSize: 12),
                                        label: "Bill Date",
                                        controller: controller.billDate,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            h3,
                            Row(
                              children: [
                                Expanded(
                                  child: NewCaseTextField(
                                      labelstyle: header11.copyWith(
                                          color: Colors.black54, fontSize: 12),
                                      // style: header11.copyWith(
                                      //     color: Colors.black, fontSize: 14),
                                      mediaquery: MediaQuery.of(context).size,
                                      onChanged: (a) {
                                        if (a.isNotEmpty) {
                                          controller.billAmount.value =
                                              double.parse(a.toString());
                                          controller.calculateGrossAmount();
                                          print(controller.billAmount.value
                                              .toString());
                                        }
                                      },
                                      controller:
                                          controller.billAmountController,
                                      keyboard: TextInputType.number,
                                      label: "Bill Payable Amount",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          // return 'Please enter an email address';
                                          return "";
                                        }
                                        return null;
                                      },
                                      icon: billPayableAmt()),
                                ),
                                Expanded(
                                  child: SearchField(
                                    searchStyle: header11,
                                    suggestionStyle: header11,
                                    suggestionItemDecoration:
                                        BoxDecoration(color: bColor2),
                                    controller: controller.taxPersentage,
                                    enabled:
                                        !taxPercentageSelected, // Disable the field if tax is already selected
                                    validator: (value) {
                                      if (controller
                                          .taxPersentage.text.isEmpty) {
                                        return 'Tax Persentage is required';
                                      } else if (!controller
                                          .expenseHeadModel!.taxPercentagesNew!
                                          .any((e) =>
                                              e.taxPercentage.toString() ==
                                              value)) {
                                        return 'Invalid Tax Persentage ';
                                      } else {
                                        return null; // No error
                                      }
                                    },
                                    searchInputDecoration: InputDecoration(
                                      labelText: 'Tax Percent',
                                      labelStyle: header10.copyWith(
                                          color: Colors.black54),
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey),
                                      icon: taxPersent(),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1),
                                      ),
                                    ),
                                    suggestions: controller
                                        .expenseHeadModel!.taxPercentagesNew!
                                        .map(
                                          (e) => SearchFieldListItem(
                                              e.taxPercentage.toString(),
                                              child: Text(
                                                '  ${e.taxPercentage.toString()}',
                                                style: header11,
                                              ),
                                              item: e),
                                        )
                                        .toList(),
                                    onSuggestionTap: (value) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      controller.taxid = value.item!.taxId!;
                                      log(controller.taxid.toString());

                                      controller.taxpersentage.value =
                                          double.parse(controller
                                              .taxPersentage.text
                                              .toString());
                                      controller.calculateGrossAmount();
                                      print(controller.totalGrossAmount.value
                                          .toString());

                                      // Set the flag to indicate that tax percentage is selected
                                      taxPercentageSelected = true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: NewCaseTextField(
                                  labelstyle: header11.copyWith(
                                      color: Colors.black54, fontSize: 12),
                                  // style: header11.copyWith(
                                  //     color: Colors.black, fontSize: 13),
                                  mediaquery: MediaQuery.of(context).size,
                                  controller: controller.consineeName,
                                  keyboard: TextInputType.name,
                                  label: "Consignee Name",
                                  icon: consinee()),
                            ),
                            h3,
                            NewCaseTextField(
                                // style: header11.copyWith(
                                //     color: Colors.black, fontSize: 13),
                                labelstyle: header11.copyWith(
                                    color: Colors.black54, fontSize: 12),
                                mediaquery: MediaQuery.of(context).size,
                                controller: controller.billremarks,
                                keyboard: TextInputType.name,
                                label: "Bill Remarks",
                                icon: billRemarks()),
                            h3,
                            Container(
                              height: 7.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black87)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  w1,
                                  Obx(() => Text(
                                      "₹ ${controller.totalGrossAmount.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                      ))),
                                  Text("Gross Amount", style: header9),
                                ],
                              ),
                            ),
                            h3,
                            // SubmitButtons(
                            //   onTap: () {
                            //     if (key22.currentState!.validate()) {
                            //       controller
                            //           .updateExpense(argumentData["billid"]);
                            //     }
                            //   },
                            //   text: "Update",
                            //   isLoading: controller.isLoading,
                            // )

                            SubmitButtons(
                              onTap: () async {
                                if (key22.currentState!.validate()) {
                                  //   if (!taxPercentageSelected) {
                                  //     // Show a confirmation dialog when tax is not selected
                                  //     // bool deleteConfirmed = await showDialog(
                                  //     //   context: context,
                                  //     //   builder: (BuildContext context) {
                                  //     //     return SimpleDialog(
                                  //     //       shape: RoundedRectangleBorder(
                                  //     //         borderRadius:
                                  //     //             BorderRadius.circular(10),
                                  //     //       ),
                                  //     //       contentPadding: EdgeInsets.zero,
                                  //     //       titlePadding: EdgeInsets.zero,
                                  //     //       children: [
                                  //     //         Container(
                                  //     //           decoration: BoxDecoration(
                                  //     //             color: Colors.white,
                                  //     //             borderRadius:
                                  //     //                 BorderRadius.circular(15),
                                  //     //           ),
                                  //     //           padding: const EdgeInsets.all(15),
                                  //     //           height: 25.h,
                                  //     //           width: 23.w,
                                  //     //           child: Column(
                                  //     //             crossAxisAlignment:
                                  //     //                 CrossAxisAlignment.center,
                                  //     //             children: [
                                  //     //               Icon(
                                  //     //                 Icons.warning,
                                  //     //                 size: 23.sp,
                                  //     //                 color: Colors.black,
                                  //     //               ),
                                  //     //               h1,
                                  //     //               Text(
                                  //     //                 "Warning",
                                  //     //                 style: header12,
                                  //     //               ),
                                  //     //               h1,
                                  //     //               Padding(
                                  //     //                 padding:
                                  //     //                     const EdgeInsets.only(
                                  //     //                         left: 29,
                                  //     //                         right: 30),
                                  //     //                 child: Text(
                                  //     //                   "Please Conform",
                                  //     //                   style: header12,
                                  //     //                 ),
                                  //     //               ),
                                  //     //               h2,
                                  //     //               Padding(
                                  //     //                 padding:
                                  //     //                     const EdgeInsets.only(
                                  //     //                         bottom: 2),
                                  //     //                 child: Text(
                                  //     //                   'Tax Percent',
                                  //     //                   style: header12,
                                  //     //                 ),
                                  //     //               )
                                  //     //             ],
                                  //     //           ),
                                  //     //         ),
                                  //     //       ],
                                  //     //     );
                                  //     //   },
                                  //     // );

                                  //     // if (deleteConfirmed == true) {
                                  //     //   // User confirmed to continue without selecting tax, proceed with the update
                                  //     //   controller.updateExpense(
                                  //     //       argumentData["billid"]);
                                  //     // }
                                  //   } else {
                                  //     // Tax percentage is selected, proceed with the update
                                  // controller
                                  //     .updateExpense(argumentData["billid"]);
                                  //   }
                                  controller
                                      .updateExpense(argumentData["billid"]);
                                }
                              },
                              text: "Update",
                              isLoading: controller.isLoading,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
