// ignore_for_file: unrelated_type_equality_checks
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/purchase_bill_controller.dart';
import 'component.dart/addmeterial_compoenent.dart';
import 'component.dart/addpayment.dart';

class AddPurchaseBill extends GetView<PurchaseBillController> {
  AddPurchaseBill({super.key});
  @override
  PurchaseBillController controller = Get.put(PurchaseBillController());
  @override
  Widget build(BuildContext context) {
    log(controller.postemetrislList.length.toString());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  controller.clear();
                  controller.postemetrislList.clear();
                  controller.metrialList.clear();
                  controller.activeStep.value = 0;
                  // controller.clear();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                )),
            title: Text("Create Purchase Bill ", style: header15),
          ),
          body: GetBuilder<PurchaseBillController>(
            builder: (controller) => controller.supplierList == null
                ? loadingthreebounce
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Obx(() => IconStepper(
                              activeStepBorderPadding: 0,
                              stepColor: bColor2,
                              // stepReachedAnimationEffect: Curves.ease,
                              //    steppingEnabled: controller.step.value,

                              activeStepColor: bColor2,
                              activeStepBorderColor: bColor,
                              activeStepBorderWidth: 1,
                              lineColor: bColor,
                              lineDotRadius: 1,

                              // enableStepTapping: controller.button.value,
                              // scrollingDisabled: true,
                              enableNextPreviousButtons: false,

                              icons: [
                                controller.activeStep == 0
                                    ? const Icon(Icons.edit)
                                    : Icon(
                                        Icons.circle,
                                        color: bColor,
                                      ),
                                controller.activeStep == 1
                                    ? const Icon(Icons.edit)
                                    : Icon(
                                        Icons.circle,
                                        color: bColor,
                                      ),
                                controller.activeStep == 2
                                    ? const Icon(Icons.edit)
                                    : Icon(
                                        Icons.circle,
                                        color: bColor,
                                      ),
                              ],
                              activeStep: controller.activeStep.value,
                              onStepReached: (index) {
                                controller.update();
                              },
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select Supplier",
                              style: header8,
                            ),
                            w7,
                            Text(
                              "Add Material",
                              style: header8,
                            ),
                            w7,
                            Text(
                              "Add Payment",
                              style: header8,
                            ),
                          ],
                        ),
                        h3,
                        GetBuilder<PurchaseBillController>(builder: (contect) {
                          return controller.requestCatModel == null
                              ? loadingthreebounce
                              : Obx(() {
                                  if (controller.activeStep.value == 0) {
                                    return Form(
                                        key: controller.key1,
                                        child: SelectSupplier());
                                  } else if (controller.activeStep.value == 1) {
                                    return AddMetrialComponent();
                                  } else {
                                    return AddPaymentComponets();
                                  }
                                });
                        }),
                      ],
                    ),
                  ),
          )),
    );
  }
}

class AddMeterial extends StatelessWidget {
  const AddMeterial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}

Container addMertialWidegt(String text) {
  return Container(
    height: 11.h,
    width: 43.w,
    decoration:
        BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.add_circle,
          color: Colors.white,
          size: 29.sp,
        ),
        Text(
          text,
          style: wheader5,
        )
      ],
    ),
  );
}

class SelectSupplier extends StatelessWidget {
  SelectSupplier({super.key});
  PurchaseBillController controller = Get.put(PurchaseBillController());

  @override
  Widget build(BuildContext context) {
    final RxBool iserror = false.obs;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0.h),
      child: Column(
        children: [
          h3,
          Obx(
            () => SearchField(
              //                searchStyle: header11,
              suggestionItemDecoration: BoxDecoration(
                color: bColor2,
              ),
              suggestionStyle: header11,
              controller: controller.supplierController,
              // validator: (p0) {
              //   if (controller.supplierController.text.isEmpty) {
              //     return 'supplier field is required';
              //   } else if (!controller.supplierList!.data!
              //       .any((e) => e.name.toString() == p0)) {
              //     return 'Invalid supplier';
              //   } else {
              //     return null; // No error
              //   }
              // },
              searchInputDecoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: iserror.value != false
                            ? Colors.red
                            : Colors.black26),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: iserror.value != false
                            ? Colors.red
                            : Colors.black26),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1,
                        color: iserror.value != false
                            ? Colors.red
                            : Colors.black26),
                  ),
                  hintText: 'Select Supplier',
                  hintStyle: header11.copyWith(color: Colors.black54),
                  suffixIcon:
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                  icon: cImage(
                      "https://cdn-icons-png.flaticon.com/512/3862/3862809.png")),

              suggestions: controller.supplierList!.data!
                  .map(
                    (e) => SearchFieldListItem(
                      e.name.toString(),
                      child: Text(
                        '  ${e.name.toString()}',
                        style: header11,
                      ),
                      item: e.id.toString(),
                    ),
                  )
                  .toList(),
              onSuggestionTap: (val) {
                // controller.step.value = true;
                controller.supplerId = val.item.toString();
                print(controller.supplerId);
              },
            ),
          ),
          h3,
          NewCaseTextField(
              labelstyle: header11.copyWith(color: Colors.black45),
              mediaquery: MediaQuery.of(context).size,
              icon: const Icon(
                Icons.sticky_note_2_outlined,
                color: Colors.grey,
              ),
              //validator: Validators.noneEmptyValidator,
              label: "Invoice Number",
              keyboard: TextInputType.name,
              controller: controller.invoiceNumber),
          h3,
          NewCaseTextField(
              labelstyle: header11.copyWith(color: Colors.black45),
              mediaquery: MediaQuery.of(context).size,
              icon: const Icon(
                Icons.car_repair,
                color: Colors.grey,
              ),
              //  validator: Validators.noneEmptyValidator,
              label: "Vechicle Number",
              keyboard: TextInputType.name,
              controller: controller.vechicleNumber),
          h5,
          h3,
          SubmitButton(
              onTap: () {
                if (controller.key1.currentState!.validate() &&
                    controller.supplierController.text.isNotEmpty) {
                  iserror.value = false;
                  controller.activeStep.value = 1;
                }
                iserror.value = true;
              },
              text: "Continue to Add Material")
        ],
      ),
    );
  }
}




// Padding(
//         padding: EdgeInsets.symmetric(horizontal: 2.0.h),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Obx(() => IconStepper(
//                     activeStepBorderPadding: 0,
//                     stepColor: bColor2,
//                     // stepReachedAnimationEffect: Curves.ease,
//                     //    steppingEnabled: controller.step.value,

//                     activeStepColor: bColor2,
//                     activeStepBorderColor: bColor,
//                     activeStepBorderWidth: 1,
//                     lineColor: bColor,
//                     lineDotRadius: 1,

//                     // enableStepTapping: controller.button.value,
//                     // scrollingDisabled: true,
//                     enableNextPreviousButtons: false,

//                     icons: [
//                       controller.activeStep == 0
//                           ? const Icon(Icons.edit)
//                           : Icon(
//                               Icons.circle,
//                               color: bColor,
//                             ),
//                       controller.activeStep == 1
//                           ? const Icon(Icons.edit)
//                           : Icon(
//                               Icons.circle,
//                               color: bColor,
//                             ),
//                       controller.activeStep == 2
//                           ? const Icon(Icons.edit)
//                           : Icon(
//                               Icons.circle,
//                               color: bColor,
//                             ),
//                     ],
//                     activeStep: controller.activeStep.value,
//                     onStepReached: (index) {
//                       controller.update();
//                     },
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Select Supplier",
//                     style: header8,
//                   ),
//                   w7,
//                   Text(
//                     "Add Material",
//                     style: header8,
//                   ),
//                   w7,
//                   Text(
//                     "Add Payment",
//                     style: header8,
//                   ),
//                 ],
//               ),
//               h3,
//               Obx(() {
//                 if (controller.activeStep.value == 0) {
//                   return Form(key: controller.key1, child: SelectSupplier());
//                 } else if (controller.activeStep.value == 1) {
//                   return AddMetrialComponent();
//                 } else {
//                   return AddPaymentComponets();
//                 }
//               }),
//             ],
//           ),
//         ),
//       ),