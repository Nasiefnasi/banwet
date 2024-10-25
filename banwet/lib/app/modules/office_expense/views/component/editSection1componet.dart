// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../common_widegt/datatimepicker.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../../../project_modules/project_expense/views/component/image_upload_botoomsheet.dart';
import '../../controllers/add_officeexpence_controller.dart';

class EditSectionOne extends StatelessWidget {
  EditSectionOne({super.key});
  AddfficeExpenseController controller = Get.put(AddfficeExpenseController());
// AddfficeExpenseController().TaxPercentagesNew
  @override
  Widget build(BuildContext context) {
    TextEditingController taxPersentage = TextEditingController(
        text: controller.taxPersentage.text.isEmpty
            ? "0"
            : controller.taxPersentage.text);
    RxBool isSelected = false.obs;
    RxBool istaxpercents = false.obs;
    var mediaquery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: SearchField(
                searchStyle:
                    header11.copyWith(color: Colors.black, fontSize: 11.sp),
                suggestionItemDecoration: BoxDecoration(
                  color: bColor2,
                ),
                suggestionStyle: header11.copyWith(
                  color: Colors.black54,
                ),
                controller: controller.expTypeCtrl,
                validator: (p0) {
                  if (controller.expTypeCtrl.text.isEmpty) {
                    return '';
                  } else if (!controller.expType
                      .any((e) => e.toString() == p0)) {
                    return 'Invalid Expense Type';
                  } else {
                    return null;
                  }
                },
                searchInputDecoration: InputDecoration(
                  labelText: 'Expense Type',
                  hintStyle: header11.copyWith(
                    fontSize: 11.sp,
                    color: Colors.black54,
                  ),
                  labelStyle:
                      header11.copyWith(color: Colors.black54, fontSize: 12.sp),
                  suffixIcon:
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  icon: CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                    color: Colors.black38,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black26),
                  ),
                ),
                suggestions: controller.expType
                    .map(
                      (e) => SearchFieldListItem(
                        e.toString(),
                        child: Text('  ${e.toString()}', style: header11),
                        item: e.toString(),
                      ),
                    )
                    .toList(),
                // onSuggestionTap: (val){
                //   headId=val.item;
                //
                // },
              ),
            ),
            h3,
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: SizedBox(
                height: 55,
                // color: Colors.amber,
                child: Obx(
                  () => SearchField(
                    searchStyle:
                        header11.copyWith(color: Colors.black, fontSize: 11.sp),
                    suggestionItemDecoration: BoxDecoration(
                      color: bColor2,
                    ),
                    suggestionStyle: header11,
                    controller: controller.expenseHeader,
                    // validator: Validators.noneEmptyValidator,
                    validator: (value) {
                      // Your validation logic here
                      if (controller.expenseHeader.text.isEmpty) {
                        isSelected.value = true;
                      } else if (!controller.expenseHeadModel!.expenseHeads!
                          .any((e) => e.headName.toString() == value)) {
                        isSelected.value = true;
                      } else {
                        isSelected.value = false;
                      }
                      return null;
                    },

                    searchInputDecoration: InputDecoration(
                      labelText: 'Expense Head',
                      labelStyle: header10.copyWith(color: Colors.black54),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: CachedNetworkImage(
                        imageUrl:
                            "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                        color: Colors.black38,
                        height: 3.h,
                        width: 7.w,
                        placeholder: (context, url) => const SizedBox(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1,
                            color: isSelected.value != true
                                ? Colors.black26
                                : Colors.red),
                      ),
                    ),
                    suggestions: controller.expenseHeadModel!.expenseHeads!
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
                      controller.headId = val.item;
                      print(controller.headId);
                    },
                  ),
                ),
              ),
            ),
            h3,
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: NewCaseTextField(
                          prefix: null,
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          controller: controller.billNumber,
                          keyboard: TextInputType.number,
                          label: "Bill Number",
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     // return 'Please enter an email address';
                          //     return "";
                          //   }
                          //   return null;
                          // },
                          icon: billRemarks()),
                    ),
                  ),
                  w2,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: SizedBox(
                          width: mediaquery.width * .45,
                          child: DateTimePickers(
                            style: header11.copyWith(
                              color: Colors.black,
                            ),
                            label: "Bill Date",
                            controller: controller.billDate,
                            labelStyle: header11.copyWith(
                              color: Colors.black54,
                            ),

                            //  header10.copyWith(
                            //     color: Colors.black87, fontFamily: light),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            h3,
            Container(
              // height: 50,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: NewCaseTextField(
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          onChanged: (a) {
                            if (a.isNotEmpty) {
                              controller.grossAmount.value =
                                  double.parse(a.toString());
                              controller.calculateGrossAmount();
                              controller.calculateBalanceNumber();
                            }
                          },
                          controller: controller.billAmount,
                          keyboard: TextInputType.number,
                          label: "Bill Payable Amount",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please enter an email address';
                              return "";
                            }
                            return null;
                          },
                          icon: billPayableAmt()),
                    ),
                  ),
                  w1,
                  Expanded(
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: SearchField(
                            textInputAction: TextInputAction.next,
                            hint: "0",
                            // Set this to the initial value you want to display
                            searchStyle: header11,
                            suggestionStyle: header11,
                            suggestionItemDecoration:
                                BoxDecoration(color: bColor2),
                            controller: taxPersentage,
                            validator: (value) {
                              if (controller.taxPersentage.text.isEmpty) {
                                istaxpercents.value = true;
                              } else if (!controller
                                  .expenseHeadModel!.taxPercentagesNew!
                                  .any((e) =>
                                      e.taxPercentage.toString() == value)) {
                                istaxpercents.value = true;
                              } else {
                                istaxpercents.value = false;
                              }
                              return null;
                            },
                            searchInputDecoration: InputDecoration(
                              labelText: 'Tax Percent',
                              labelStyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              icon: taxPersent(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.black26),
                              ),
                            ),
                            suggestions:
                                controller.expenseHeadModel!.taxPercentagesNew!
                                    .map(
                                      (e) => SearchFieldListItem(
                                        e.taxPercentage.toString(),
                                        child: Text(
                                          '  ${e.taxPercentage.toString()}',
                                          style: header11,
                                        ),
                                        item: e,
                                      ),
                                    )
                                    .toList(),
                            onSuggestionTap: (value) {
                              taxPersentage.text = value.item!.taxPercentage!;
                              controller.taxPersentage.text =
                                  value.item!.taxPercentage!;
                              print(
                                  "helllo gysss dddddddddddddddddddddddddddddddddddddddddd ${controller.taxPersentage.text}");
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.taxid = value.item!.taxId!;
                              print("${controller.taxid}m,");
                              controller.taxAmount.value = double.parse(
                                  controller.taxPersentage.text.toString());
                              controller.calculateGrossAmount();
                              controller.calculateBalanceNumber();
                            },
                          )

                          // SearchField(
                          //   searchStyle: header11,
                          //   suggestionStyle: header11,
                          //   suggestionItemDecoration:
                          //       BoxDecoration(color: bColor2),
                          //   controller: controller.taxPersentage,
                          //   validator: (value) {
                          //     if (controller.taxPersentage.text.isEmpty) {
                          //       istaxpercents.value = true;
                          //     } else if (!controller
                          //         .expenseHeadModel!.taxPercentagesNew!
                          //         .any((e) =>
                          //             e.taxPercentage.toString() == value)) {
                          //       istaxpercents.value = true;
                          //     } else {
                          //       istaxpercents.value = false;
                          //     }
                          //   },
                          //   searchInputDecoration: InputDecoration(
                          //       labelText: 'Tax Percent',
                          //       labelStyle:
                          //           header10.copyWith(color: Colors.black54),
                          //       suffixIcon: const Icon(Icons.arrow_drop_down,
                          //           color: Colors.grey),
                          //       icon: taxPersent(),
                          //       enabledBorder: const UnderlineInputBorder(
                          //         borderSide:
                          //             BorderSide(width: 1, color: Colors.black26),
                          //       )),
                          //   suggestions:
                          //       controller.expenseHeadModel!.taxPercentagesNew!
                          //           .map(
                          //             (e) => SearchFieldListItem(
                          //                 e.taxPercentage.toString(),
                          //                 child: Text(
                          //                   '  ${e.taxPercentage.toString()}',
                          //                   style: header11,
                          //                 ),
                          //                 item: e),
                          //           )
                          //           .toList(),
                          //   onSuggestionTap: (value) {
                          //     FocusManager.instance.primaryFocus?.unfocus();
                          //     controller.taxid = value.item!.taxId!;

                          //     print("${controller.taxid}m,");
                          //     controller.taxAmount.value = double.parse(
                          //         controller.taxPersentage.text.toString());
                          //     controller.calculateGrossAmount();
                          //     controller.calculateBalanceNumber();
                          //   },
                          // ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.consineeName,
                keyboard: TextInputType.name,
                label: "Consignee Name",
                icon: consinee()),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.billremarks,
                keyboard: TextInputType.name,
                label: "Bill Remarks",
                icon: billRemarks()),
            h3,
            Obx(() => controller.fileValue.value == 1
                ? Container(
                    height: 10.h,
                    width: 25.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(
                            controller.pic!.path,
                          ),
                          fit: BoxFit.contain,
                        )),
                  )
                : ImageUploadContainer(
                    text: "Upload Bill",
                    onTap: () {
                      Get.bottomSheet(UploadBillBottomSheet());
                    },
                  )),
            h2,
            Obx(() {
              return controller.fileValue.value == 1
                  ? GestureDetector(
                      onTap: () {
                        controller.fileValue.value = 0;
                        controller.pic = null;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        width: 36.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: bColor),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            Text(
                              "Remove Photo",
                              style: wheader9,
                            ),
                          ],
                        )),
                      ),
                    )
                  : const SizedBox();
            }),
            h5,
            Container(
              height: 6.h,
              width: 100.w,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffdfdfdf)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bill Gross Amount",
                      style: TextStyle(fontSize: 11, fontFamily: regular)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('₹',
                          style: TextStyle(
                              fontSize: 11.sp, fontWeight: FontWeight.w500)),
                      w1,
                      Obx(() {
                        return Text(
                          controller.totalGrossAmount.value == 0.0
                              ? 0.toString()
                              : controller.totalGrossAmount.value
                                  .toDouble()
                                  .toStringAsFixed(2),
                          style: header12.copyWith(
                              fontSize: 9.5.sp, fontFamily: SemiBold),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            h3,
            SubmitButton(
              text: "Continue to Make Payment",
              onTap: () {
                if (controller.key.currentState!.validate()) {
                  if (controller.expenseHeader.text.isNotEmpty) {
                    controller.editUpdate();
                  }
                }
              },
            ),
            h3,
          ],
        ),
      ),
    );
  }
}
