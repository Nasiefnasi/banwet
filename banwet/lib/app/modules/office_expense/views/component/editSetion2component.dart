// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/office_expense/views/component/showDialog.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../common_widegt/datatimepicker.dart';
import '../../../../common_widegt/searchfield.dart';
import '../../../../utils/validators.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../../controllers/add_officeexpence_controller.dart';
import '../../controllers/office_expense_controller.dart';

class EditSectionTwo extends StatelessWidget {
  EditSectionTwo({super.key});

  AddfficeExpenseController controller = Get.put(AddfficeExpenseController());
  OfficeExpenseController officeExpenseController =
      Get.put(OfficeExpenseController());

  @override
  Widget build(BuildContext context) {
    // RxBool ispayment = false
    var mediaquery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key1,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Please enter an email address';
                          return "";
                        }
                        return null;
                      },
                      icon: paidAmount()),
                ),
                SizedBox(
                  width: mediaquery.width * .45,
                  child: DateTimePickers(
                    labelStyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    style: header11.copyWith(
                      color: Colors.black,
                    ),
                    label: "Paid Date",
                    controller: controller.paidDate,
                  ),
                ),
              ],
            ),
            h3,
            CustomSerchField(
                iconss: userAccount(),
                label: "Paid From Accounts",
                validator: Validators.noneEmptyValidator,
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
                iconss: paymentMode(),
                label: "Payment Mode",
                validator: Validators.noneEmptyValidator,
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
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.paymentRemarks,
                keyboard: TextInputType.name,
                label: "Payment Remarks",
                icon: billRemarks()),
            h5,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 191, 191)),
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
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500)),
                            w1,
                            Obx(() {
                              return Text(
                                controller.totalGrossAmount.toString(),
                                style: header12.copyWith(
                                    fontSize: 9.5.sp, fontFamily: SemiBold),
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                w2,
                Expanded(
                  child: Container(
                    height: 6.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 191, 191)),
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
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500)),
                            w1,
                            Obx(() {
                              return Text(
                                controller.balanceAmount.toStringAsFixed(2),
                                style: header12.copyWith(
                                    fontSize: 9.5.sp, fontFamily: SemiBold),
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
              isLoading: controller.isLoading,
              text: "Submit",
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
