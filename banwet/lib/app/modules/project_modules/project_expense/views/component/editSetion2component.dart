// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../common_widegt/datatimepicker.dart';
import '../../../../../common_widegt/searchfield.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../../../../office_expense/controllers/office_expense_controller.dart';
import '../../../../office_expense/views/component/showDialog.dart';
import '../../controllers/project_expense_controller.dart';

class EditSectionTwo extends StatelessWidget {
  EditSectionTwo({super.key});
  ProjectExpenseController controller = Get.put(ProjectExpenseController());
  OfficeExpenseController officeExpenseController =
      Get.put(OfficeExpenseController());
  @override
  Widget build(BuildContext context) {
    controller.paidAccount();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key1,
        child: Column(
          children: [
            h3,
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: NewCaseTextField(
                        labelstyle: header11.copyWith(color: Colors.black38),
                        mediaquery: MediaQuery.of(context).size,
                        onChanged: (a) {
                          if (controller.paidAmount.text.isNotEmpty) {
                            if (double.parse(a) <=
                                    controller.totalGrossAmount.value &&
                                a != "") {
                              controller.payableAmount.value = double.parse(a);

                              controller.calculateBalanceNumber();
                            } else {
                              controller.payableAmount.value = 0.0;
                              controller.paidAmount.clear();
                              warningDialogue(context);
                              controller.calculateBalanceNumber();
                            }
                          } else {
                            controller.payableAmount.value = 0.0;
                            controller.calculateBalanceNumber();
                          }
                        },
                        controller: controller.paidAmount,
                        keyboard: TextInputType.phone,
                        label: "Paid Amount",
                        validator: Validators.noneEmptyValidator,
                        icon: paidAmount()),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: DateTimePickers(
                        labelStyle: header11.copyWith(color: Colors.black45),
                        label: "Paid Date",
                        controller: controller.paidDate,
                        style: header11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            h3,
            CustomSerchField(
                iconss: paymentMode(),
                label: "Paid From Account",
                validator: controller.paidAmount.text == "0"
                    ? null
                    : Validators.noneEmptyValidator,
                controller: controller.debitAccount1,
                suggestions: controller.expenseHeadModel!.accountHeads!
                    .map(
                      (e) => SearchFieldListItem(
                        e.headName.toString(),
                        child: Text(
                          '  ${e.headName.toString()}',
                          style: header11,
                        ),
                        item: e.headName.toString(),
                      ),
                    )
                    .toList()),
            h3,
            CustomSerchField(
                iconss: userAccount(),
                label: "Payment Mode",
                validator: controller.paidAmount.text == "0"
                    ? null
                    : Validators.noneEmptyValidator,
                controller: controller.paymentMode,
                suggestions: controller.expenseHeadModel!.paymentModes!
                    .map(
                      (e) => SearchFieldListItem(
                        e.name.toString(),
                        child: Text(
                          '  ${e.name.toString()}',
                          style: header11,
                        ),
                        item: e.name.toString(),
                      ),
                    )
                    .toList()),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.paymentRemarks,
                keyboard: TextInputType.name,
                label: "Payment Remarks",
                // validator: Validators.noneEmptyValidator,
                icon: billRemarks()),
            h5,
            Row(
              children: [
                Expanded(
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
                        Text("Bill Gross Amount",
                            style:
                                TextStyle(fontSize: 11, fontFamily: regular)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('₹',
                                style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w600)),
                            w1,
                            Obx(() {
                              return Text(
                                controller.totalGrossAmount.toStringAsFixed(2),
                                style: header12.copyWith(
                                    color: Colors.black,
                                    fontSize: 13.5.sp,
                                    fontFamily: SemiBold,
                                    fontWeight: FontWeight.w500),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                w4,
                Expanded(
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
                        Text("Bill Balance Amount",
                            style:
                                TextStyle(fontSize: 11, fontFamily: regular)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('₹',
                                style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontWeight: FontWeight.w600)),
                            w1,
                            Obx(() {
                              return Text(
                                controller.balanceAmount.toStringAsFixed(2),
                                style: header12.copyWith(
                                    color: Colors.black,
                                    fontSize: 13.5.sp,
                                    fontFamily: SemiBold,
                                    fontWeight: FontWeight.w500),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            h5,
            SubmitButtons(
              text: "Submit",
              isLoading: controller.isLoading,
              onTap: () async {
                if (controller.key1.currentState!.validate() &&
                    double.parse(controller.paidAmount.text.toString()) != "") {
                  controller.createOfficeExpense();
                } else {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
