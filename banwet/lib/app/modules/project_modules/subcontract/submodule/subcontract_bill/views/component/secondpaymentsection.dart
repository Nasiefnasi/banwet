import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../Style/const.dart';
import '../../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../../common_widegt/datatimepicker.dart';
import '../../../../../../../utils/validators.dart';
import '../../../../../../daily_note/views/add_dailynote.dart';
import '../../../../../../office_expense/views/component/showDialog.dart';
import '../../controllers/subcontract_bill_controller.dart';

class SecondPaymentSection extends StatelessWidget {
  SecondPaymentSection({super.key});
  SubcontractBillController controller = Get.put(SubcontractBillController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key2,
        child: Column(
          children: [
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                onChanged: (a) {
                  if (controller.paidAmountController.text.isNotEmpty) {
                    if (double.parse(a) <= controller.totalGrossAmount.value &&
                        a.isNotEmpty) {
                      controller.balanceAmount.value =
                          controller.totalGrossAmount.value - double.parse(a);
                    } else {
                      controller.paidAmountController.clear();
                      warningDialogue(context);
                    }
                  }
                },
                controller: controller.paidAmountController,
                keyboard: TextInputType.number,
                label: 'Paid Amount',
                validator: Validators.noneEmptyValidator,
                icon: paidAmount()),
            h3,
            DateTimePickers2(
              label: "Paid Date",
              controller: controller.paidDate,
            ),
            h3,
            SearchField(
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
                  borderSide: BorderSide(color: Colors.black87, width: 1.0),
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
            h3,
            SearchField(
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
                  borderSide: BorderSide(color: Colors.black87, width: 1.0),
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
            h3,
            NewCaseTextField(
                minlines: 3,
                maxLine: 6,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.remark,
                keyboard: TextInputType.name,
                label: 'Remark',
                icon: const Icon(Icons.sticky_note_2_outlined,
                    color: Colors.black38)),
            h3,
            Row(
              children: [
                Expanded(
                  child: Container(
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
                                controller.totalGrossAmount.toString(),
                                style: header12.copyWith(fontSize: 9.5.sp),
                              );
                            }),
                          ],
                        ),
                        Text("Bill Gross Amount", style: header8),
                      ],
                    ),
                  ),
                ),
                w4,
                Expanded(
                  child: Container(
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
                                controller.balanceAmount.value
                                    .toStringAsFixed(2),
                                style: header12.copyWith(fontSize: 9.5.sp),
                              );
                            }),
                          ],
                        ),
                        Text("Bill Balance Amount", style: header8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            h3,
            SubmitButtons(
                isLoading: controller.isLoading,
                onTap: () {
                  if (controller.key2.currentState!.validate()) {
                    controller.createSubContractBill();
                  }
                },
                text: "Submit"),
            h2,
          ],
        ),
      ),
    );
  }
}
