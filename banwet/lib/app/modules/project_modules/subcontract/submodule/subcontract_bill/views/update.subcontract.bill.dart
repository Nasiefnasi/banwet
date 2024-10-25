import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/style/const.dart';

import '../controllers/subcontract_bill_controller.dart';

class UpdateSubContractBill extends StatelessWidget {
  UpdateSubContractBill({super.key});
  SubcontractBillController controller = Get.put(SubcontractBillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Edit Sub Bill",
          style: header15.copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      controller: controller.billNo,
                      keyboard: TextInputType.number,
                      label: 'Bill Number',
                      validator: Validators.noneEmptyValidator,
                      icon: paidAmount()),
                ),
                Expanded(
                  child: DateTimePickers2(
                    label: "Bill Date",
                    controller: controller.billDate,
                  ),
                ),
              ],
            ),
            h3,
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      onChanged: (value) {
                        if (controller.grossAmountController.text.isNotEmpty) {
                          controller.grossAmount.value =
                              double.parse(value.toString());
                          controller.calculateGrossAmount();
                          print(controller.grossAmount.value.toString());
                        }
                      },
                      controller: controller.grossAmountController,
                      keyboard: TextInputType.number,
                      label: "Gross Amount",
                      validator: Validators.noneEmptyValidator,
                      icon: paidAmount()),
                ),
                Expanded(
                  child: SearchField(
                    inputType: TextInputType.number,
                    searchStyle: header11,
                    suggestionStyle: header11,
                    suggestionItemDecoration: BoxDecoration(color: bColor2),
                    controller: controller.taxpersentageController,
                    validator: (p0) {
                      if (controller.taxpersentageController.text.isEmpty) {
                        return 'Tax Percent  is required';
                      } else if (!controller.headModel!.taxPercentagesNew!
                          .any((e) => e.taxPercentage.toString() == p0)) {
                        return 'Invalid Tax Percent';
                      } else {
                        return null; // No error
                      }
                    },
                    searchInputDecoration: InputDecoration(
                      labelText: 'Tax Percent',
                      labelStyle: header10.copyWith(color: Colors.black54),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: taxPersent(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black26, width: 1.0),
                      ),
                    ),
                    suggestions: controller.headModel!.taxPercentagesNew!
                        .map(
                          (e) => SearchFieldListItem(e.taxPercentage.toString(),
                              child: Text(
                                '  ${e.taxPercentage.toString()}',
                                style: header11,
                              ),
                              item: e),
                        )
                        .toList(),
                    onSuggestionTap: (value) async {
                      controller.taxid = value.item!.taxId!;
                      controller.taxpersentage.value =
                          double.parse(value.item!.taxPercentage.toString());
                      controller.calculateGrossAmount();
                      // controller.billTotalAmt();

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ],
            ),
            h3,
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black54)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('₹',
                          style: TextStyle(
                            fontSize: 11.sp,
                          )),
                      w1,
                      Obx(() {
                        return Text(
                          controller.totalGrossAmount.value == 0.0
                              ? 0.toString()
                              : controller.totalGrossAmount.value
                                  .toDouble()
                                  .toString(),
                          style: header12.copyWith(fontSize: 9.5.sp),
                        );
                      }),
                    ],
                  ),
                  Text("Bill Gross Amount", style: header8),
                ],
              ),
            ),
            h3,
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      onChanged: (a) {
                        if (controller.paidAmountController.text.isNotEmpty) {
                          if (double.parse(a) <=
                                  controller.totalGrossAmount.value &&
                              a.isNotEmpty) {
                            controller.balanceAmount.value =
                                controller.totalGrossAmount.value -
                                    double.parse(a);
                          } else {
                            controller.paidAmountController.clear();
                            //   warningDialogue(context);
                          }
                        }
                      },
                      controller: controller.paidAmountController,
                      keyboard: TextInputType.number,
                      label: 'Paid Amount',
                      validator: Validators.noneEmptyValidator,
                      icon: paidAmount()),
                ),
                Expanded(
                  child: DateTimePickers2(
                    label: "Paid Date",
                    controller: controller.paidDate,
                  ),
                ),
              ],
            ),
            h3,
            Row(
              children: [
                Expanded(
                  child: SearchField(
                    searchStyle: header11,
                    suggestionStyle: header11,
                    suggestionItemDecoration: BoxDecoration(color: bColor2),
                    controller: controller.paidFromAccount,
                    validator: Validators.noneEmptyValidator,
                    searchInputDecoration: InputDecoration(
                      labelText: 'Paid From Account',
                      labelStyle: header10.copyWith(color: Colors.black54),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: taxPersent(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.0),
                      ),
                    ),
                    suggestions: controller.headModel!.accountHeads!
                        .map(
                          (e) => SearchFieldListItem(e.headName.toString(),
                              child: Text(
                                '  ${e.headName.toString()}',
                                style: header11,
                              ),
                              item: e),
                        )
                        .toList(),
                    onSuggestionTap: (value) async {
                      // controller.taxpersentage.value =
                      //     double.parse(value.item!.taxPercentage.toString());
                      // controller.calculateGrossAmount();
                      // // controller.billTotalAmt();

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                h3,
                Expanded(
                  child: SearchField(
                    searchStyle: header11,
                    suggestionStyle: header11,
                    suggestionItemDecoration: BoxDecoration(color: bColor2),
                    controller: controller.paymentMode,
                    validator: Validators.noneEmptyValidator,
                    searchInputDecoration: InputDecoration(
                      labelText: 'Payment Mode',
                      labelStyle: header10.copyWith(color: Colors.black54),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: taxPersent(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.0),
                      ),
                    ),
                    suggestions: controller.headModel!.paymentModes!
                        .map(
                          (e) => SearchFieldListItem(e.name.toString(),
                              child: Text(
                                '  ${e.name.toString()}',
                                style: header11,
                              ),
                              item: e),
                        )
                        .toList(),
                    onSuggestionTap: (value) async {
                      // controller.taxpersentage.value =
                      //     double.parse(value.item!.taxPercentage.toString());
                      // controller.calculateGrossAmount();
                      // // controller.billTotalAmt();

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ],
            ),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.remark,
                keyboard: TextInputType.multiline,
                label: 'Remark',
                icon: const Icon(
                  Icons.sticky_note_2_outlined,
                  color: Colors.black38,
                )),
            h3,
            h2,
            SubmitButtons(
                isLoading: controller.isLoading,
                onTap: () {
                  if (controller.key2.currentState!.validate()) {
                    controller.createSubContractBill();
                  }
                },
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
