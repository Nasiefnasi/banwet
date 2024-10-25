import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/office_expense/views/component/showDialog.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../common_widegt/datatimepicker.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../../../../labour/labour_wageslip/views/component/addpayment_component.dart';
import '../../controllers/purchase_bill_controller.dart';

class AddPaymentComponets extends GetView<PurchaseBillController> {
  @override
  PurchaseBillController controller = Get.put(PurchaseBillController());
  final GlobalKey<FormState> paymnet = GlobalKey<FormState>();
  TextEditingController paidAmountController = TextEditingController();
  TextEditingController paidDateController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController debitController = TextEditingController();
  TextEditingController paymenModeController =
      TextEditingController(text: "CASH");
  AddPaymentComponets({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController deb = TextEditingController(
        text: controller.wageListModel!.accountHeads
            ?.map((e) => e.headName.toString())
            .toString());
    debitController = deb;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Form(
          key: paymnet,
          child: Column(
            children: [
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
                          // Expanded(
                          //   child: AmountContainer(
                          //     text: "Gross Amount",
                          //     amount:
                          //         "${controller.metrialList.map((e) => double.parse(e.totalAmt ?? "0")).toList().fold(0.0, (e, t) => (e + t).toDouble())}"
                          //             as RxDouble,
                          //   ),
                          // )
                          Text("Gross Amount",
                              style:
                                  TextStyle(fontSize: 11, fontFamily: regular)),
                          w1,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "₹ ",
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${controller.metrialList.map((e) => double.parse(e.totalAmt ?? "0")).toList().fold(0.0, (e, t) => (e + t).toDouble())}",
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  w2,
                  Expanded(
                    child: AmountContainer(
                        text: "Balance Amounts",
                        amount: controller.balanceAmount),
                  )
                ],
              ),
              h2,
              NewCaseTextField(
                  mediaquery: MediaQuery.of(context).size,
                  onChanged: (value) {
                    if (paidAmountController.text.isNotEmpty) {
                      log(controller.totalGrossAmounts.value.toString());

                      if (double.parse(value) <=
                          controller.totalGrossAmounts.value) {
                        log("inside");
                        // controller.balanceAmount.value =
                        //     controller.totalPoints - double.parse(value);
                        controller.payableAmount.value = double.parse(value);
                        controller.calculateBalanceAmount();
                      } else {
                        log("outaside");
                        paidAmountController.clear();
                        controller.payableAmount.value = 0;
                        controller.calculateBalanceAmount();
                        warningDialogue(context);
                      }
                    } else {
                      paidAmountController.clear();
                      controller.payableAmount.value = 0;
                      controller.calculateBalanceAmount();
                    }
                  },
                  controller: paidAmountController,
                  keyboard: TextInputType.number,
                  label: "Paid Amount",
                  labelstyle: header11.copyWith(color: Colors.black45),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'Please enter an email address';
                      return "";
                    }
                    return null;
                  },
                  icon: paidAmount()),
              h2,
              DateTimePickers2(
                controller: paidDateController,
                validator: Validators.noneEmptyValidator,
                label: 'Paid Date',
              ),
              h2,
              SearchField(
                searchStyle: header11,
                suggestionStyle: header11,
                controller: debitController,
                validator: Validators.noneEmptyValidator,
                searchInputDecoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black26),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black26),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black26),
                    ),
                    hintText: 'Debit Account',
                    hintStyle: header11.copyWith(color: Colors.black54),
                    suffixIcon:
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    icon: userAccount()),
                suggestions: controller.wageListModel!.accountHeads!
                    .map(
                      (e) => SearchFieldListItem(
                        e.headName.toString(),
                        child: Text(
                          '  ${e.headName.toString()}',
                          style: header11,
                        ),
                        item: e.toString().toString(),
                      ),
                    )
                    .toList(),
                onSuggestionTap: (val) {},
              ),
              h3,
              SearchField(
                searchStyle: header11,

                // autoCorrect: false,
                suggestionStyle: header11,
                controller: paymenModeController,
                suggestionItemDecoration: BoxDecoration(color: bColor2),
                validator: Validators.noneEmptyValidator,
                searchInputDecoration: InputDecoration(
                  hintText: 'Payment Mode',
                  hintStyle: header11.copyWith(color: Colors.black54),
                  suffixIcon:
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  icon: paymentMode(),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26, width: 1.0),
                  ),
                ),
                suggestions: controller.wageListModel!.paymentModes!
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
                    .toList(),
                onSuggestionTap: (v) {
                  FocusScope.of(context).unfocus();
                },
              ),
              h6,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: SubmitButton(
                          onTap: () {
                            controller.activeStep.value = 1;
                          },
                          text: "Previous")),
                  w3,
                  Expanded(
                      child: SubmitButtons(
                          isLoading: controller.isLoading,
                          onTap: () {
                            if (paymnet.currentState!.validate()) {
                              controller.createPurchaseBill(
                                  paidamount: paidAmountController.text,
                                  paidDate: paidDateController.text,
                                  paymentMode: paymenModeController.text,
                                  debitAc: debitController.text);
                            }
                          },
                          text: "Submit"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
