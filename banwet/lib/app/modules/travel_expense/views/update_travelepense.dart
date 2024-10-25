// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:banwet/app/common_widegt/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common_icontextform_feild.dart';
import '../../../common_widegt/loading.dart';
import '../../../utils/validators.dart';
import '../../daily_note/views/add_dailynote.dart';
import '../controllers/travel_expense_controller.dart';

class UpdateTravelExpense extends StatelessWidget {
  UpdateTravelExpense({super.key});
  var argumentData = Get.arguments;
  TravelExpenseController controller = Get.put(TravelExpenseController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: bColor),
    );
    return Container(
      color: bColor,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Edit Travel Expense",
            style: header15,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
                controller.clear();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<TravelExpenseController>(
          builder: (controller) => controller.travelHeadModel == null
              ? loadingthreebounce
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Form(
                    key: controller.key,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        children: <Widget>[
                          h3,
                          NewCaseTextField(
                              labelstyle: header11.copyWith(
                                  color: Colors.black54, fontSize: 12),
                              mediaquery: MediaQuery.of(context).size,
                              readOnly: true,
                              validator: Validators.noneEmptyValidator,
                              controller: controller.vehicleTypeCtrle,
                              keyboard: TextInputType.name,
                              label: "Vechicle Type",
                              icon: cImage(
                                  'https://cdn-icons-png.flaticon.com/512/846/846296.png')),
                          h4,
                          Row(
                            children: [
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black54, fontSize: 12),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    controller: controller.fromCtrl,
                                    keyboard: TextInputType.name,
                                    label: "From",
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    )),
                              ),
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black54, fontSize: 12),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    controller: controller.toCtrl,
                                    keyboard: TextInputType.name,
                                    label: "To",
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    )),
                              ),
                            ],
                          ),
                          h3,
                          Row(
                            children: [
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black54, fontSize: 12),
                                    mediaquery: MediaQuery.of(context).size,
                                    onChanged: (a) {
                                      if (controller
                                          .distanseCtrl.text.isNotEmpty) {
                                        if (controller.iseditable.value ==
                                            "1") {
                                          controller.add(a);
                                        }
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    controller: controller.distanseCtrl,
                                    keyboard: TextInputType.number,
                                    label: 'Distance[km]',
                                    icon: cImage(
                                        'https://cdn-icons-png.flaticon.com/512/503/503054.png')),
                              ),
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black54, fontSize: 12),
                                    mediaquery: MediaQuery.of(context).size,
                                    readOnly: controller.iseditable.value == "1"
                                        ? true
                                        : false,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    controller: controller.amtCtrl,
                                    keyboard: TextInputType.number,
                                    label: "Amount",
                                    onChanged: (p0) {
                                      print(controller.iseditable.value
                                          .toString());
                                    },
                                    icon: billPayableAmt()),
                              ),
                            ],
                          ),
                          h3,
                          NewCaseTextField(
                              labelstyle: header11.copyWith(
                                  color: Colors.black54, fontSize: 12),
                              mediaquery: MediaQuery.of(context).size,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     // return 'Please enter an email address';
                              //     return "";
                              //   }
                              //   return null;
                              // },

                              controller: controller.remarks,
                              keyboard: TextInputType.name,
                              label: 'Remarks',
                              icon: billRemarks()),
                          h5,
                          // h6,
                          Obx(
                            () => controller.fileValue2.value == 1
                                ? Container(
                                    height: 10.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(
                                            controller.pic2!.path,
                                          ),
                                          fit: BoxFit.contain,
                                        )),
                                  )
                                : ImageUploadContainer(
                                    bordercolor:
                                        Colors.black26.withOpacity(0.1),
                                    text: "Upload End Reading photo",
                                    onTap: () {
                                      Get.bottomSheet(uploadBill(
                                        onTapCamera: () {
                                          controller
                                              .pickImage2(ImageSource.camera);
                                          Get.back();
                                        },
                                        onTapGAllery: () {
                                          controller
                                              .pickImage2(ImageSource.gallery);
                                          Get.back();
                                        },
                                      ));
                                    },
                                  ),
                          ),
                          h2,
                          Obx(
                            () => controller.fileValue2.value == 1
                                ? GestureDetector(
                                    onTap: () {
                                      controller.fileValue2.value = 0;
                                      controller.pic2 = null;
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      width: 36.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: bColor),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                : const SizedBox(),
                          ),

                          h3, h3,
                          SubmitButtons(
                            isLoading: controller.isLoading,
                            text: "Submit",
                            onTap: () {
                              if (controller.key.currentState!.validate()) {
                                controller
                                    .editTravelAlevence(argumentData["id"]);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
