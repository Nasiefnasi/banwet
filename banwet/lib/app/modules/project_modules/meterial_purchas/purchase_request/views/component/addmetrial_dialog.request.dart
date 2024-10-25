// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../../utils/validators.dart';
import '../../controllers/purchase_request_controller.dart';

addMaterials(context) {
  RxBool iserror = false.obs;
  var mediaquery = MediaQuery.of(context).size;
  final GlobalKey<FormState> metrialKey = GlobalKey<FormState>();
  String metrialName = "";
  String metrialid = "";
  PurchaseRequestController controller = Get.put(PurchaseRequestController());
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: 70.h,
            width: 100.w,
            child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.only(top: 2.h, left: 2.h, right: 2.h),
                    // height: 66.h,
                    width: 100.w,
                    child: Form(
                      // key: _metKey,
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Form(
                          key: metrialKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    return Get.back();
                                  },
                                  child: const SizedBox(
                                    height: 30,
                                    width: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [Icon(Icons.close)],
                                    ),
                                  ),
                                ),
                              ),
                              height5,
                              Text(
                                'Select Materials',
                                style: header4,
                              ),
                              height3,
                              Obx(
                                () => SearchField(
                                  searchStyle: header11,
                                  suggestionItemDecoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  suggestionStyle: header11,
                                  // controller: _metController,
                                  // validator: (p0) {
                                  //   if (p0 == null || p0.isEmpty) {
                                  //     // return 'Please enter an email address';
                                  //     iserror.value = true;
                                  //     return"";
                                  //   }
                                  //   iserror.value = false;
                                  // },
                                  searchInputDecoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: iserror.value
                                                ? Colors.red
                                                : Colors.black12,
                                            width: 1.0),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: iserror.value
                                              ? Colors.red
                                              : Colors.black12,
                                        ),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: iserror.value
                                                ? Colors.red
                                                : Colors.black12,
                                            width: 1.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: iserror.value
                                                ? Colors.red
                                                : Colors.black12,
                                            // controller.errormessage.value ??
                                            //     Color.fromARGB(255, 211, 211, 211),
                                            width: 1),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color: iserror.value
                                                ? Colors.black12
                                                : Colors.red,
                                            width: 1),
                                      ),
                                      labelText: 'Select Material',
                                      labelStyle: header10.copyWith(
                                          color: Colors.black54),
                                      suffixIcon: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.grey),
                                      icon: cImage(
                                          "https://cdn-icons-png.flaticon.com/512/7654/7654873.png")),
                                  suggestions: controller.requestModel!.data!
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e.materialName.toString(),
                                          child: Text(
                                            "  ${e.materialName.toString()}",
                                            style: header11,
                                          ),
                                          item: e,
                                        ),
                                      )
                                      .toList(),
                                  onSuggestionTap: (value) {
                                    controller.quantitytype.value =
                                        value.item!.unitName!;
                                    FocusScope.of(context).unfocus();
                                    metrialName = value.item!.materialName!;
                                    metrialid = value.item!.materialId!;
                                  },
                                ),
                              ),
                              h2,
                              Text(
                                'Quantity',
                                style: header4,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: NewCaseTextField(
                                      mediaquery: mediaquery,
                                      controller:
                                          controller.quantityControllers,
                                      keyboard: TextInputType.number,
                                      label: "",
                                      validator: Validators.noneEmptyValidator,
                                      icon: const ImageIcon(AssetImage(
                                          "assets/images/quantity1.png")),
                                    ),
                                    // TextFormField(
                                    //     enableInteractiveSelection: true,
                                    //     controller:
                                    //         controller.quantityControllers,
                                    //     validator: Validators.noneEmptyValidator,
                                    //     keyboardType: TextInputType.number,
                                    //     decoration: InputDecoration(
                                    //       focusedBorder:
                                    //           const UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             color: Colors.black26,
                                    //             width: 1.0),
                                    //       ),
                                    //       border: UnderlineInputBorder(
                                    //         borderSide: BorderSide(color: bColor),
                                    //       ),
                                    //       enabledBorder:
                                    //           const UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             color: Colors.black26,
                                    //             width: 1.0),
                                    //       ),
                                    //       errorBorder: const UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             style: BorderStyle.solid,
                                    //             color: Colors.red,
                                    //             // controller.errormessage.value ??
                                    //             //     Color.fromARGB(255, 211, 211, 211),
                                    //             width: 1),
                                    //       ),
                                    //       focusedErrorBorder:
                                    //           const UnderlineInputBorder(
                                    //         borderSide: BorderSide(
                                    //             style: BorderStyle.solid,
                                    //             color: Color.fromARGB(
                                    //                 255, 211, 211, 211),
                                    //             width: 1),
                                    //       ),
                                    //       icon: ImageIcon(AssetImage(
                                    //           "assets/images/quantity1.png")),

                                    //       //  prefixIcon: Icon(Icons.event_note)
                                    //     ),
                                    //   ),
                                  ),
                                  Obx(
                                    () => Text(
                                      controller.quantitytype.value == null
                                          ? ""
                                          : controller.quantitytype.value
                                              .toString(),
                                      style: header4,
                                    ),
                                  )
                                ],
                              ),
                              h2,
                              Text(
                                'Description',
                                style: header4,
                              ),
                              h1,
                              TextFormField(
                                enableInteractiveSelection: true,
                                controller: controller.descriptionControllers1,
                                maxLines: 5,
                                // keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black26),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black26),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.black26),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              h3,
                              GestureDetector(
                                onTap: () async {
                                  if (metrialKey.currentState!.validate() &&
                                      controller.quantitytype.value != "") {
                                    iserror.value = false;
                                    controller.addmetrialList(MetName(
                                        qunit: controller.quantitytype.value,
                                        name: metrialName,
                                        qtext: controller
                                            .quantityControllers.text));
                                    controller.addpostemetrislList(Item(
                                      description: controller
                                          .descriptionControllers1.text,
                                      materialId: metrialid,
                                      quantity:
                                          controller.quantityControllers.text,
                                    ));

                                    Get.back();

                                    controller.quantityControllers.clear();
                                    controller.descriptionControllers1.clear();
                                    // controller.quantitytype.value = "";
                                  }
                                  iserror.value = true;
                                },
                                child: Container(
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: wheader4,
                                    ),
                                  ),
                                ),
                              ),
                              h4,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          );
        });
      });
}
