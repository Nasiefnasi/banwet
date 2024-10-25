import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../Style/const.dart';
import '../../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../../common_widegt/datatimepicker.dart';
import '../../../../../../../utils/validators.dart';
import '../../../../../../daily_note/views/add_dailynote.dart';
import '../../controllers/subcontract_bill_controller.dart';

class FirstPaymentSection extends StatelessWidget {
  FirstPaymentSection({super.key, required this.onTap});
  SubcontractBillController controller = Get.put(SubcontractBillController());
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key1,
        child: Column(
          children: [
            NewCaseTextField(
                mediaquery: MediaQuery.of(context).size,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                controller: controller.billNo,
                keyboard: TextInputType.number,
                label: 'Bill Number',
                validator: Validators.noneEmptyValidator,
                icon: paidAmount()),
            h3,
            DateTimePickers2(
              label: "Bill Date",
              controller: controller.billDate,
            ),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
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
            h3,
            SearchField(
              inputType: TextInputType.number,
              searchStyle: header11,
              suggestionStyle: header11,
              suggestionItemDecoration: BoxDecoration(color: bColor2),
              controller: controller.taxpersentageController =
                  TextEditingController(
                      text: controller.taxpersentage.value.toString() == "0.0"
                          ? "0"
                          : controller.taxpersentage.value.toString()),
              // validator: (p0) {
              //   if (controller.taxpersentageController.text.isEmpty) {
              //     return 'Tax Percent  is required';
              //   } else if (!controller.headModel!.taxPercentagesNew!
              //       .any((e) => e.taxPercentage.toString() == p0)) {
              //     return 'Invalid Tax Percent';
              //   } else {
              //     return null; // No error
              //   }
              // },
              searchInputDecoration: InputDecoration(
                labelText: 'Tax Percent',
                labelStyle: header10.copyWith(color: Colors.black54),
                suffixIcon:
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                icon: taxPersent(),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
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
            h3,
            h1,
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
                          controller.totalGrossAmount.value.toStringAsFixed(2),
                          style: header12.copyWith(fontSize: 9.5.sp),
                        );
                      }),
                    ],
                  ),
                  Text('Total Amount', style: header8),
                ],
              ),
            ),
            h4,
            SubmitButton(
                onTap: () {
                  if (controller.key1.currentState!.validate()) {
                    onTap();
                  }
                },
                text: "Continue to Make Payment")
          ],
        ),
      ),
    );
  }
}
