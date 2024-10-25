import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/project_expense/controllers/updateprojectexpense_controller.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../common_widegt/datatimepicker.dart';
import '../../../../common_widegt/loading.dart';
import '../../../../utils/validators.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../../labour/labour_wageslip/views/component/addpayment_component.dart';

class UpdateProjectExpense extends StatelessWidget {
  var argumentData = Get.arguments;

  UpdateProjectExpense({Key? key}) : super(key: key);
  UpdateprojectexpenseController controller =
      Get.put(UpdateprojectexpenseController());
  // AddfficeExpenseController acontroller = Get.put(AddfficeExpenseController();

  final GlobalKey<FormState> key22 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
        ),
      ),
      body: GetBuilder<UpdateprojectexpenseController>(
        builder:
            // (controller) =>
            (controller) {
          if (controller.expenseHeadModel == null) {
            return loadingthreebounce;
          } else {
            controller.taxid = controller.argumnetData["taxid"].toString();
            controller.expenseHeadId =
                controller.argumnetData["expenseHeadId"].toString();
            controller.expTypeCtrl.text =
                controller.argumnetData["expTypeCtrl"].toString();
            controller.billNumber.text =
                controller.argumnetData["billNumber"].toString();
            controller.billAmountController.text =
                controller.argumnetData["billAmountController"].toString();
            controller.billAmounts.value =
                controller.argumnetData["billAmounts"] ?? 0;
            controller.totalGrossAmount.value =
                controller.argumnetData["payableAmount"] ?? 0;
            // controller.billAmounts.value =
            //     controller.argumnetData["grossAmount"] ?? 0;
            controller.taxAmount.value = argumentData["taxAmount"];
            controller.totalGrossAmount.value =
                controller.argumnetData["totalGrossAmount"] ?? 0;
            controller.taxpersentages.value =
                controller.argumnetData["taxpersentages"] ?? 0;
            controller.consineeName.text =
                controller.argumnetData["consineeName"].toString();
            controller.billremarks.text =
                controller.argumnetData["billremarks"].toString();
            controller.expenseHeader.text =
                controller.argumnetData["expenseHeader"].toString();
            controller.billDate.text =
                controller.argumnetData["billDate"].toString();
            controller.taxPersentage.text =
                controller.argumnetData["taxPercentage"].toString();
            return Padding(
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
                          // Remove the borderRadius or ensure it's uniform.
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        suggestionStyle: header11,
                        controller: controller.expTypeCtrl,
                        validator: Validators.noneEmptyValidator,
                        searchInputDecoration: InputDecoration(
                          labelText: 'Expense Type',
                          labelStyle: header11.copyWith(color: Colors.black54),
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
                                BorderSide(color: Colors.black38, width: 1.0),
                          ),
                        ),
                        suggestions: controller.expenseHeadModel!.expenseHeads!
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
                          controller.expenseHeadId = p0.item!.headId.toString();
                        },
                      ),
                      h3,
                      Row(
                        children: [
                          Expanded(
                            child: NewCaseTextField(
                                mediaquery: MediaQuery.of(context).size,
                                controller: controller.billNumber,
                                keyboard: TextInputType.number,
                                label: "Bill Number",
                                validator: Validators.noneEmptyValidator,
                                icon: billRemarks()),
                          ),
                          // DateTimePickers(
                          //   label: "Bill Date",
                          //   controller: controller.billDate,
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .45,
                            child: DateTimePickers(
                              labelStyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              style: header11.copyWith(
                                color: Colors.black,
                              ),
                              label: "Bill Date",
                              controller: controller.billDate,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: CommonIconTextFormField(mediaquery: MediaQuery.of(context).size,
                      //         controller: controller.billNumber,
                      //         keyboard: TextInputType.number,
                      //         label: "Bill Number",
                      //         validator: Validators.noneEmptyValidator,
                      //         icon: billRemarks(),
                      //       ),
                      //     ),
                      //     DateTimePickers(
                      //       label: "Bill Date",
                      //       controller: controller.billDate,
                      //     ),
                      //   ],
                      // ),
                      h3,
                      Row(
                        children: [
                          Expanded(
                            child: NewCaseTextField(
                              mediaquery: MediaQuery.of(context).size,
                              onChanged: (a) {
                                if (controller
                                    .billAmountController.text.isNotEmpty) {
                                  controller.billAmounts.value =
                                      double.parse(a.toString());
                                  controller.calculateGrossAmountss();
                                } else {
                                  controller.billAmounts.value = 0;
                                  controller.billAmountController.clear();
                                  controller.calculateGrossAmountss();
                                }
                              },
                              controller: controller.billAmountController,
                              keyboard: TextInputType.number,
                              label: "Bill Payable Amount",
                              validator: Validators.noneEmptyValidator,
                              icon: billPayableAmt(),
                            ),
                          ),
                          Expanded(
                            child: SearchField(
                              searchStyle: header11,
                              suggestionStyle: header11,
                              suggestionItemDecoration:
                                  BoxDecoration(color: bColor2),
                              controller: controller.taxPersentage,
                              validator: (value) {
                                if (controller.taxPersentage.text.isEmpty) {
                                  return 'taxPersentage required';
                                } else if (!controller
                                    .expenseHeadModel!.taxPercentagesNew!
                                    .any((e) =>
                                        e.taxPercentage.toString() == value)) {
                                  return 'Invalid taxPersentage';
                                } else {
                                  return null; // No error
                                }
                              },
                              searchInputDecoration: InputDecoration(
                                  labelText: 'Tax Percent',
                                  labelStyle:
                                      header10.copyWith(color: Colors.black54),
                                  suffixIcon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  icon: taxPersent(),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black26),
                                  )),
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
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.taxid = value.item!.taxId!;
                                controller.taxpersentages.value = double.parse(
                                    controller.taxPersentage.text.toString());
                                controller.calculateGrossAmountss();
                                log("${controller.totalGrossAmount.value}----${controller.tax.value}");
                              },
                            ),
                          ),
                        ],
                      ),
                      h3,
                      NewCaseTextField(
                        mediaquery: MediaQuery.of(context).size,
                        controller: controller.consineeName,
                        keyboard: TextInputType.name,
                        label: "Consignee Name",
                        icon: consinee(),
                      ),
                      h3,
                      NewCaseTextField(
                        mediaquery: MediaQuery.of(context).size,
                        controller: controller.billremarks,
                        keyboard: TextInputType.name,
                        label: "Bill Remarks",
                        icon: billRemarks(),
                      ),
                      h3,
                      AmountContainer(
                        text: "Gross Amount",
                        amount: controller.totalGrossAmount,
                      ),
                      h3,
                      SubmitButtons(
                        onTap: () async {
                          if (key22.currentState!.validate()) {
                            log("pppppppppppppppppppppp");
                            await controller
                                .updateExpense(argumentData["billid"]);
                          }
                        },
                        text: "Update",
                        isLoading: controller.isLoadingUpdate,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        init: UpdateprojectexpenseController(),
      ),
    );
  }
}
