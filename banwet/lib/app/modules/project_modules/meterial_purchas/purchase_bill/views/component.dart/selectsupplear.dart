import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../../controllers/purchase_bill_controller.dart';

class SelectSupplier extends StatelessWidget {
  SelectSupplier({super.key});
  PurchaseBillController controller = Get.put(PurchaseBillController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
          searchStyle: header10.copyWith(
            color: Colors.black45,
          ),
          suggestionItemDecoration: BoxDecoration(
              color: bColor2, borderRadius: BorderRadius.circular(10)),
          suggestionStyle: header11,
          controller: controller.supplierController,
          validator: Validators.noneEmptyValidator,
          searchInputDecoration: InputDecoration(
              hintText: 'Select Supplier',
              hintStyle: header11.copyWith(color: Colors.black54),
              suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
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
                  item: e,
                ),
              )
              .toList(),
          onSuggestionTap: (val) {
            // controller.step.value = true;
            controller.supplerId = val.item!.id!.toString();
            log("${controller.supplerId}sdvsdv");
            log(controller.supplierController.text);
          },
        ),
        h3,
        NewCaseTextField(mediaquery: MediaQuery.of(context).size,
            icon: const Icon(Icons.sticky_note_2_outlined),
            validator:  (value) {
                  if (value == null || value.isEmpty) {
                    // return 'Please enter an email address';
                    return "";
                  }
                  return null;
                },
            label: "Invoice Number",
            keyboard: TextInputType.name,
            controller: controller.invoiceNumber),
        h3,
        NewCaseTextField(mediaquery: MediaQuery.of(context).size,
            icon: const Icon(Icons.car_repair),
            validator:  (value) {
                  if (value == null || value.isEmpty) {
                    // return 'Please enter an email address';
                    return "";
                  }
                  return null;
                },
            label: "Vechicle Number",
            keyboard: TextInputType.name,
            controller: controller.vechicleNumber),
        h5,
        SubmitButton(
            onTap: () {
              if (controller.key1.currentState!.validate()) {
                controller.activeStep.value = 1;
              }
            },
            text: "Continue to Add Material")
      ],
    );
  }
}
