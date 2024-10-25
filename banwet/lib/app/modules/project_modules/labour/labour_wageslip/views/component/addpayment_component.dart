import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/addwageslip_controller.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/datatimepicker.dart';
import '../../../../../daily_note/views/add_dailynote.dart';

class AddPAymentComponent extends StatelessWidget {
  AddPAymentComponent({super.key});
  AddwageslipController controller = Get.put(AddwageslipController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.key2,
      child: Column(
        children: [
          h3,
          Row(
            children: [
              Expanded(
                child: NewCaseTextField(
                    labelstyle: header11.copyWith(color: Colors.black45),
                    mediaquery: MediaQuery.of(context).size,
                    onChanged: (value) {
                      if (controller.paidAmountController.text.isNotEmpty) {
                        controller.balanceAmount.value = double.parse(value);
                        // controller.totalAmount.value - double.parse(value);
                        controller.totalBalanceAdd();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return 'Please enter an email address';
                        return "";
                      }
                      return null;
                    },
                    controller: controller.paidAmountController,
                    keyboard: TextInputType.number,
                    label: "Paid Amount",
                    icon: billPayableAmt()),
              ),
              Expanded(
                  child: DateTimePickers2(
                      validator: Validators.noneEmptyValidator,
                      controller: controller.paidDate,
                      label: "Paid Date"))
            ],
          ),
          h3,
          SizedBox(
            height: MediaQuery.of(context).size.height * .09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      //     validator: Validators.noneEmptyValidator,
                      controller: controller.referenceNo,
                      keyboard: TextInputType.number,
                      label: "TR Reference No",
                      icon: cImage(
                          "https://cdn-icons-png.flaticon.com/512/7025/7025956.png")),
                ),
                Expanded(
                  child: DateTimePickers2(
                      // labelStyle: header11.copyWith(color: Colors.black45),
                      //  validator: Validators.noneEmptyValidator,
                      controller: controller.referenceDate,
                      label: "TR Reference Date"),
                )
              ],
            ),
          ),
          h2,
          CustomSerchField(
              iconss: userAccount(),
              label: "Paid From Account",
              validator: Validators.noneEmptyValidator,
              controller: controller.debitAccount1,
              suggestions: controller.wageListModel!.accountHeads!
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
          h2,
          SearchField(
            suggestionItemDecoration: BoxDecoration(color: bColor2),
            searchStyle: header10.copyWith(
              color: Colors.black,
            ),
            suggestionStyle: header11,
            controller: controller.paymentMode,
            validator: Validators.noneEmptyValidator,
            searchInputDecoration: InputDecoration(
              labelText: 'Payment Mode',
              labelStyle: header10.copyWith(color: Colors.black54),
              suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
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
                      "  ${e.name}",
                      style: header11,
                    ),
                    item: e,
                  ),
                )
                .toList(),
            onSuggestionTap: (v) {
              FocusScope.of(context).unfocus();
            },
          ),
          h3,
          NewCaseTextField(
              labelstyle: header11.copyWith(
                color: Colors.black54,
              ),
              mediaquery: MediaQuery.of(context).size,
              // validator: Validators.noneEmptyValidator,
              controller: controller.trremarks,
              keyboard: TextInputType.name,
              label: "Payment Remarks",
              icon: billRemarks()),
          h3,
          Row(
            children: [
              Expanded(
                child: AmountContainer(
                    text: "Total Wage", amount: controller.totalWage),
              ),
              w2,
              Expanded(
                child: AmountContainer(
                    text: "Previous Balance",
                    amount: controller.preBalanceAmount),
              ),
              w2,
              Expanded(
                child: AmountContainer(
                    text: "Balance Amount",
                    amount: controller.totalAmountBlance),
              )
            ],
          ),
          h3,
          SubmitButtons(
              isLoading: controller.isLoadingInduvitalAdding,
              onTap: () {
                FocusScope.of(context).unfocus();

                if (controller.key2.currentState!.validate()) {
                  controller.addIndivitualWage();
                }
              },
              text: "Submit")
        ],
      ),
    );
  }
}

class AmountContainer extends StatelessWidget {
  const AmountContainer({super.key, required this.text, required this.amount});
  final String text;
  final RxDouble amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 100.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffdfdfdf)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 11, fontFamily: regular)),
          w1,
          Obx(() => Text("₹ ${amount.value.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w600,
              ))),
        ],
      ),
    );
  }
}
