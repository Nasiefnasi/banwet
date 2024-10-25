import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../common_widegt/loading.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../controllers/payment_controller.dart';

class AddSubContractPaymnet extends StatelessWidget {
  AddSubContractPaymnet({super.key});

  PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Add Payment",
              style: header15,
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
                controller.clear();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
            ),
          ),
          body: GetBuilder<PaymentController>(builder: (controller) {
            if (controller.expenseHeadModel == null) {
              return loadingthreebounce;
            } else {
              controller.paidAccount();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.key1,
                    child: Column(
                      children: [
                        h2,
                        NewCaseTextField(
                            labelstyle: header11.copyWith(
                              color: Colors.black54,
                            ),
                            mediaquery: MediaQuery.of(context).size,
                            controller: controller.paidAmount,
                            keyboard: TextInputType.number,
                            label: "Paid Amount",
                            validator: Validators.noneEmptyValidator,
                            icon: paidAmount()),
                        h3,
                        DateTimePicker(
                            autofocus: false,
                            controller: controller.billPaidDate,
                            //  initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                            // dateLabelText: 'Start Date',

                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.event_note,
                                color: Colors.grey,
                              ),
                              labelText: "Bill Date",
                              labelStyle:
                                  header11.copyWith(color: Colors.black54),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26, width: 1.0),
                              ),
                            ),
                            // dateLabelText: 'Start Date',
                            validator: Validators.noneEmptyValidator),
                        h3,
                        SearchField(
                          searchStyle: header10.copyWith(
                            color: Colors.black,
                          ),
                          suggestionItemDecoration: BoxDecoration(
                            color: bColor2,
                          ),
                          suggestionStyle: header11,
                          controller: controller.padiFromAccount,
                          validator: Validators.noneEmptyValidator,
                          searchInputDecoration: InputDecoration(
                            labelText: 'Paid From Account',
                            labelStyle: header11.copyWith(
                  color: Colors.black,
                ),
                            suffixIcon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey),
                            icon: CachedNetworkImage(
                              imageUrl:
                                  "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                              color: Colors.black,
                              height: 3.h,
                              width: 7.w,
                              placeholder: (context, url) => const SizedBox(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1.0),
                            ),
                          ),
                          suggestions:
                              controller.expenseHeadModel!.accountHeads!
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e.headName.toString(),
                                      child: Text('  ${e.headName.toString()}',
                                          style: header11),
                                      item: e.headId.toString(),
                                    ),
                                  )
                                  .toList(),
                          onSuggestionTap: (val) {
                            // controller.headId = val.item;
                            // print(controller.headId);
                          },
                        ),
                        h3,
                        SearchField(
                          searchStyle: header10.copyWith(
                            color: Colors.black,
                          ),
                          suggestionItemDecoration: BoxDecoration(
                            color: bColor2,
                          ),
                          suggestionStyle: header11,
                          controller: controller.paymentMode,
                          validator: (p0) {
                            if (controller.paymentMode.text.isEmpty) {
                              return 'Payment Mode is required';
                            } else if (!controller
                                .expenseHeadModel!.paymentModes!
                                .any((e) => e.name == p0)) {
                              return 'Invalid Payment Mode ';
                            } else {
                              return null; // No error
                            }
                          },
                          searchInputDecoration: InputDecoration(
                            labelText: 'Payment Mode',
                            labelStyle:
                                header11.copyWith(color: Colors.black54),
                            suffixIcon: const Icon(Icons.arrow_drop_down,
                                color: Colors.grey),
                            icon: paymentMode(),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1.0),
                            ),
                          ),
                          suggestions:
                              controller.expenseHeadModel!.paymentModes!
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e.name.toString(),
                                      child: Text('  ${e.name.toString()}',
                                          style: header11),
                                      item: e.name.toString(),
                                    ),
                                  )
                                  .toList(),
                          onSuggestionTap: (val) {
                            // controller.headId = val.item;
                            // print(controller.headId);
                          },
                        ),
                        h3,
                        NewCaseTextField(
                            labelstyle: header11.copyWith(
                              color: Colors.black54,
                            ),
                            mediaquery: MediaQuery.of(context).size,
                            controller: controller.remarks,
                            keyboard: TextInputType.name,
                            label: "Remark",
                            icon: const Icon(
                              Icons.sticky_note_2_outlined,
                              color: Colors.grey,
                            )),
                        h6,
                        SubmitButtons(
                            isLoading: controller.isLoading,
                            onTap: () {
                              if (controller.key1.currentState!.validate()) {
                                controller.addSubContractPayment();
                              }
                            },
                            text: "Submit")
                      ],
                    ),
                  ),
                ),
              );
            }
          })),
    );
  }
}
