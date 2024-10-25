import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/project_expense/controllers/project_expense_controller.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../common_widegt/datatimepicker.dart';
import '../../../../../common_widegt/submitpage.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';

class EditSectionOne extends StatefulWidget {
  EditSectionOne({super.key, required this.onTap});
  void Function() onTap;

  @override
  _EditSectionOneState createState() => _EditSectionOneState();
}

class _EditSectionOneState extends State<EditSectionOne> {
  final ProjectExpenseController controller =
      Get.put(ProjectExpenseController());
  @override
  void dispose() {
    controller.taxPersentage;
    super.dispose();
  }

  TextEditingController taxPersentage = TextEditingController(text: "0");
  @override
  Widget build(BuildContext context) {
    RxBool iserror = false.obs;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.key,
        child: Column(
          children: [
            h3,
            Obx(
              () => SearchField(
                itemHeight: 40,
                // textInputAction: t,
                searchStyle: header11.copyWith(color: Colors.black),
                suggestionItemDecoration: BoxDecoration(color: bColor2),
                suggestionStyle: header11.copyWith(),
                controller: controller.expenseHeader,
                searchInputDecoration: InputDecoration(
                  labelText: 'Expense Head',
                  labelStyle: header11.copyWith(color: Colors.black54),
                  suffixIcon:
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
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
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: iserror.value != false
                            ? Colors.red
                            : Colors.black26,
                        width: 1.0),
                  ),
                ),
                suggestions: controller.expenseHeadModel!.expenseHeads!
                    .map(
                      (e) => SearchFieldListItem(
                        e.headName.toString(),
                        child:
                            Text('  ${e.headName.toString()}', style: header11),
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
            h3,
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      controller: controller.billNumber,
                      keyboard: TextInputType.number,
                      label: "Bill Number",
                      // validator: Validators.noneEmptyValidator,
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
            h3,
            Row(
              children: [
                Expanded(
                  child: NewCaseTextField(
                      labelstyle: header11.copyWith(color: Colors.black45),
                      mediaquery: MediaQuery.of(context).size,
                      onChanged: (a) {
                        if (controller.billAmount.text.isNotEmpty) {
                          controller.grossAmount.value =
                              double.parse(a.toString());
                          controller.calculateGrossAmount();
                        } else {
                          controller.grossAmount.value = 0;
                          controller.billAmount.clear();
                          controller.calculateGrossAmount();
                          controller.calculateBalanceNumber();
                        }
                      },
                      controller: controller.billAmount,
                      keyboard: TextInputType.number,
                      label: " Payable Amount",
                      validator: Validators.noneEmptyValidator,
                      icon: billPayableAmt()),
                ),
                Expanded(
                  child: SearchField(
                    searchStyle: header11,
                    suggestionStyle: header11,
                    suggestionItemDecoration: BoxDecoration(color: bColor2),
                    controller: taxPersentage,
                    //  controller.taxPersentage,
                    searchInputDecoration: InputDecoration(
                      labelText: 'Tax Percent',
                      labelStyle: header10.copyWith(color: Colors.black54),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: taxPersent(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black26, width: 1.0),
                      ),
                    ),
                    suggestions: controller.expenseHeadModel!.taxPercentagesNew!
                        .map(
                          (e) => SearchFieldListItem(e.taxPercentage.toString(),
                              child: Text(
                                '  ${e.taxPercentage.toString()}',
                                style: header11,
                              ),
                              item: e),
                        )
                        .toList(),
                    // validator: (value) {
                    //   if (controller.taxPersentage.text.isEmpty) {
                    //     // istaxpercents.value = true;
                    //   } else if (!controller
                    //       .expenseHeadModel!.taxPercentagesNew!
                    //       .any((e) => e.taxPercentage.toString() == value)) {
                    //     // istaxpercents.value = true;
                    //   } else {
                    //     // istaxpercents.value = false;
                    //   }
                    // },
                    onSuggestionTap: (value) {
                      taxPersentage.text = value.item!.taxPercentage.toString();
                      controller.taxPersentage.text = taxPersentage.text;
                      controller.taxid = value.item!.taxId!;
                      controller.taxAmount.value = double.parse(controller
                          .taxPersentage.text = taxPersentage.text.toString());
                      controller.calculateGrossAmount();
                      controller.calculateBalanceNumber();

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ],
            ),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.consineeName,
                keyboard: TextInputType.name,
                label: "Consignee Name",
                icon: consinee()),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.billremarks,
                keyboard: TextInputType.name,
                label: "Bill Remarks",
                icon: billRemarks()),
            h3,
            Obx(
              () => controller.fileValue.value == 1
                  ? Container(
                      height: 2.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(File(controller.pic!.path))),
                    )
                  : ImageUploadContainer(
                      text: "Add Photo",
                      onTap: () {
                        Get.bottomSheet(uploadBill(
                          onTapCamera: () {
                            controller.pickImage(ImageSource.camera);
                            Get.back();
                          },
                          onTapGAllery: () {
                            controller.pickImage(ImageSource.gallery);
                            Get.back();
                          },
                        ));
                      },
                    ),
            ),
            h3,
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
            h1,
            Container(
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
                      style: TextStyle(fontSize: 11, fontFamily: regular)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('₹',
                          style: TextStyle(
                              fontSize: 13.5.sp, fontWeight: FontWeight.w600)),
                      w1,
                      Obx(() {
                        return Text(
                          controller.totalGrossAmount.value == 0.0
                              ? 0.toString()
                              : controller.totalGrossAmount.value
                                  .toDouble()
                                  .toStringAsFixed(2),
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
            h3,
            SubmitButton(
              text: "Continue to Make Payment",
              onTap: () async {
                print("hththt");
                if (controller.key.currentState!.validate() &&
                    controller.expenseHeader.text.isNotEmpty) {
                  iserror.value = false;
                  print("hgfd");
                  controller.editUpdate();

                  widget.onTap();
                }
                iserror.value = true;
              },
            ),
            h3,
          ],
        ),
      ),
    );
  }
}
