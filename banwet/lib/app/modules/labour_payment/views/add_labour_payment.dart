// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';

import '../../../Style/const.dart';
import '../controllers/labour_payment_controller.dart';

class AddLabourPayment extends StatelessWidget {
  AddLabourPayment({super.key});
  LabourPaymentController controller = Get.put(LabourPaymentController());
  final FocusNode _searchFieldFocus = FocusNode();
  final FocusNode _searchFieldFocus2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    TextEditingController paymentmode = TextEditingController(
        text: controller.payimentMode.text.isEmpty
            ? "Cash"
            : controller.payimentMode.text);
    RxBool isError = false.obs;
    controller.getLaborList();

    controller.paidAccount();
    return
        // color: bColor,
        Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Add Labour Payment",
          style: header15,
        ),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: GetBuilder<LabourPaymentController>(
          builder: (controller) => controller.labours.value == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Form(
                      key: controller.key1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Obx(
                              () => SearchField(
                                focusNode: _searchFieldFocus,
                                searchStyle: header11,
                                suggestionItemDecoration: BoxDecoration(
                                  color: bColor2,
                                ),
                                suggestionStyle:
                                    header11.copyWith(color: Colors.black54),
                                controller: controller.selectLabour,
                                // // validator: (p0) {
                                ////   if (controller
                                // //       .selectLabour.text.isEmpty) {
                                //*  } else if (!controller
                                //       .labourModel!.labours!
                                //       .any((e) =>
                                //           e.labourName.toString() == p0)) {
                                //     return 'Invalid Labour ';
                                //   } else {
                                //     return null; // No error
                                //   }
                                // },
                                searchInputDecoration: InputDecoration(
                                  labelText: 'Select Labour',
                                  labelStyle:
                                      header11.copyWith(color: Colors.black54),
                                  suffixIcon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  icon: cImage(
                                      "https://cdn-icons-png.flaticon.com/512/3716/3716527.png"),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isError.value != false
                                            ? Colors.red
                                            : Colors.black26,
                                        width: 1.0),
                                  ),
                                ),
                                suggestions: controller.labourModel!.labours!
                                    .map(
                                      (e) => SearchFieldListItem(
                                        e.labourName.toString(),
                                        child: Text(
                                          "  ${e.labourName.toString()}",
                                          style: header11,
                                        ),
                                        item: e,
                                      ),
                                    )
                                    .toList(),
                                onSuggestionTap: (val) {
                                  _searchFieldFocus.unfocus();

                                  controller.workType.value =
                                      val.item!.workType.toString();
                                  controller.currentBal.value = val
                                      .item!.currentBalancePersonal
                                      .toString();
                                  controller.labourId.value =
                                      val.item!.labourId.toString();
                                  controller.update();
                                },
                              ),
                            ),
                          ),
                          h2,
                          Obx(
                            () => controller.workType.value == ""
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 8.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  controller.workType
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                  )),
                                              h1,
                                              Text('Work type',
                                                  style: header10.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      w2,
                                      Expanded(
                                        child: Container(
                                          height: 8.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.black54)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  controller.currentBal
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                  )),
                                              h1,
                                              Text('Current Balance',
                                                  style: header10.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                          h3,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: NewCaseTextField(
                                      labelstyle: header11.copyWith(
                                          color: Colors.black54),
                                      mediaquery: MediaQuery.of(context).size,
                                      controller: controller.amountController,
                                      keyboard: TextInputType.number,
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
                              ),
                              Expanded(
                                child: DateTimePickers(
                                  style: header11.copyWith(color: Colors.black),
                                  labelStyle:
                                      header11.copyWith(color: Colors.black54),
                                  validator: Validators.noneEmptyValidator,
                                  label: "Paid Date",
                                  controller: controller.paiddateController,
                                ),
                              ),
                            ],
                          ),
                          h3,
                          Row(
                            children: [
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black54),
                                    mediaquery: MediaQuery.of(context).size,
                                    controller:
                                        controller.trReferenceController,
                                    keyboard: TextInputType.number,
                                    label: "TR Reference No",
                                    icon: paidAmount()),
                              ),
                              Expanded(
                                child: DateTimePickers(
                                  style: header11.copyWith(color: Colors.black),
                                  labelStyle:
                                      header11.copyWith(color: Colors.black54),
                                  label: "TR Reference Date",
                                  controller: controller.trRefernceDate,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      // return 'Please enter an email address';
                                      return "";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          h3,
                          CustomSerchField(
                              iconss: userAccount(),
                              label: "Paid From Account",
                              validator: Validators.noneEmptyValidator,
                              controller: controller.debitAccount1,
                              suggestions:
                                  controller.expenseHeadModel!.accountHeads!
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
                          // Obx(() {
                          //   // TextEditingController paymentmode =
                          //   //     TextEditingController(
                          //   //         text:
                          //   //             controller.payimentMode.text.isEmpty
                          //   //                 ? "Cash"
                          //   //                 : controller.payimentMode.text);
                          //   return;
                          SearchField(
                            focusNode: _searchFieldFocus2,
                            searchStyle: header11,
                            suggestionItemDecoration: BoxDecoration(
                              color: bColor2,
                            ),
                            suggestionStyle:
                                header11.copyWith(color: Colors.black54),
                            controller: TextEditingController(
                                text: controller.payimentMode.text.isEmpty
                                    ? "Cash"
                                    : controller.payimentMode.text),
                            searchInputDecoration: InputDecoration(
                              labelText: "Payment Mode",
                              labelStyle:
                                  header11.copyWith(color: Colors.black54),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              icon: paymentMode(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black26,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            suggestions:
                                controller.expenseHeadModel!.paymentModes!
                                    .map(
                                      (e) => SearchFieldListItem(
                                        e.name.toString(),
                                        child: Text(
                                          "  ${e.name.toString()}",
                                          style: header11,
                                        ),
                                        item: e.name,
                                      ),
                                    )
                                    .toList(),
                            onSuggestionTap: (val) {
                              // Unfocus the search field to close the dropdown
                              _searchFieldFocus2.unfocus();

                              // Set the selected value to the controller
                              controller.payimentMode.text =
                                  val.item.toString();

                              // Update any other states if needed
                              // controller.workType.value = val.item!.workType.toString();
                              // controller.currentBal.value = val.item!.currentBalancePersonal.toString();
                              // controller.labourId.value = val.item!.labourId.toString();

                              // Update the UI
                              controller.update();
                            },
                          ),
                          // SearchField(
                          //   focusNode: _searchFieldFocus2,
                          //   searchStyle: header11,
                          //   suggestionItemDecoration: BoxDecoration(
                          //     color: bColor2,
                          //   ),
                          //   suggestionStyle:
                          //       header11.copyWith(color: Colors.black54),
                          //   controller: paymentmode,
                          //   // validator: (p0) {
                          //   //   if (controller.selectLabour.text.isEmpty) {
                          //   //   } else if (!controller.labourModel!.labours!
                          //   //       .any((e) =>
                          //   //           e.labourName.toString() == p0)) {
                          //   //     return 'Invalid Labour ';
                          //   //   } else {
                          //   //     return null; // No error
                          //   //   }
                          //   // },
                          //   searchInputDecoration: InputDecoration(
                          //     labelText: "Payment Mode",
                          //     labelStyle: header11.copyWith(
                          //         color: Colors.black54),
                          //     suffixIcon: const Icon(
                          //         Icons.arrow_drop_down,
                          //         color: Colors.grey),
                          //     icon: paymentMode(),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //           color: isError.value != false
                          //               ? Colors.red
                          //               : Colors.black26,
                          //           width: 1.0),
                          //     ),
                          //   ),
                          //   suggestions:
                          //       controller.expenseHeadModel!.paymentModes!
                          //           .map(
                          //             (e) => SearchFieldListItem(
                          //               e.name.toString(),
                          //               child: Text(
                          //                 "  ${e.name.toString()}",
                          //                 style: header11,
                          //               ),
                          //               item: e.id,
                          //             ),
                          //           )
                          //           .toList(),
                          //   onSuggestionTap: (val) {
                          //     print(
                          //         "dddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${val.item.toString()}");
                          //     _searchFieldFocus.unfocus();
                          //     controller.payimentMode.text =
                          //         val.item.toString();
                          //     // controller.workType.value =
                          //     //     val.item!.workType.toString();
                          //     // controller.currentBal.value = val
                          //     //     .item!.currentBalancePersonal
                          //     //     .toString();
                          //     // controller.labourId.value =
                          //     //     val.item!.labourId.toString();
                          //     controller.update();
                          //   },
                          // );
                          // }),
                          // Obx(
                          //   () => CustomSerchField(
                          //       colors: isError.value != false
                          //           ? Colors.red
                          //           : Colors.black26,
                          //       iconss: paymentMode(),
                          //       label: "Payment Mode",
                          //       // validator: (p0) {
                          //       //   if (controller.payimentMode.text.isEmpty) {
                          //       //     return 'Payment Mode  is required';
                          //       //   } else if (!controller
                          //       //       .expenseHeadModel!.paymentModes!
                          //       //       .any((e) => e.name.toString() == p0)) {
                          //       //     return 'Invalid Payment Mode ';
                          //       //   } else {
                          //       //     return null; // No error
                          //       //   }
                          //       // },
                          //       controller: controller.payimentMode,
                          //       suggestions: controller
                          //           .expenseHeadModel!.paymentModes!
                          //           .map(
                          //             (e) => SearchFieldListItem(
                          //               e.name.toString(),
                          //               child: Text(
                          //                 "  ${e.name.toString()}",
                          //                 style: header11,
                          //               ),
                          //               item: e.name,
                          //             ),
                          //           )
                          //           .toList()),
                          // ),
                          h3,
                          NewCaseTextField(
                              labelstyle:
                                  header11.copyWith(color: Colors.black54),
                              mediaquery: MediaQuery.of(context).size,
                              controller: controller.remarkController,
                              keyboard: TextInputType.name,
                              label: "Payment Remarks",
                              icon: billRemarks()),
                          h7,
                          SubmitButtons(
                            isLoading: controller.isLoading,
                            text: "Submit",
                            onTap: () {
                              if (controller.key1.currentState!.validate() &&
                                  controller.selectLabour.text.isNotEmpty) {
                                isError.value = false;
                                controller.createLaborPayment();
                                // controller.clear();
                                // controller.labourPaymentModel = null;
                                // controller.getDetails();
                                // controller.update();

                                Get.to(
                                  () => const SubmitDone(),
                                );
                                controller.getDetails();
                                controller.update();
                              }
                              isError.value = true;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          init: LabourPaymentController(),
        ),
      ),
    );
  }
}
