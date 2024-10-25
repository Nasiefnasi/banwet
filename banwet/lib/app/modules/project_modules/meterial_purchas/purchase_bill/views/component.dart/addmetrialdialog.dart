import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../data/model/purchase/bill_post_model.dart';
import '../../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../../utils/validators.dart';
import '../../controllers/purchase_bill_controller.dart';

addMaterial(context) {
  var mediaquery = MediaQuery.of(context).size;

  TextEditingController quanityController = TextEditingController();
  TextEditingController metrialController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController taxPersentageController =
      TextEditingController(text: "0");
  var meterialId = "".obs;
  var meterialName = "".obs;
  var uniteName = "".obs;
  String dropDwonValue = "0";

  RxDouble grossAmount = 0.0.obs;
  RxDouble unitPrice = 0.0.obs;
  RxDouble quantity = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  String taxPersentage = "";
  String taxPersentageid = "";
  RxDouble tax = 0.0.obs;
  RxBool isError = false.obs;
  RxBool isTaxError = false.obs;

  calculateGrossAmount() {
    grossAmount.value = unitPrice.value * quantity.value;
    tax.value = grossAmount.value / (100.00 / taxAmount.value);
    totalGrossAmount.value = grossAmount.value + tax.value;
  }

  PurchaseBillController controller = Get.put(PurchaseBillController());
  final GlobalKey<FormState> dialogkey = GlobalKey<FormState>();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
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
                  height: 90.h,
                  width: 100.w,
                  child: Form(
                    key: controller.key2,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Form(
                        key: dialogkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // GestureDetector(
                            //   onTap: () => Get.back(),
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [Icon(Icons.close)],
                            //   ),
                            // ),
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
                            // Center(
                            //   child: Text(
                            //     'Add Material',
                            //     style: header16,
                            //   ),
                            // ),
                            height5,
                            Text(
                              'Select Material',
                              style: header4,
                            ),
                            height3,
                            Obx(
                              () => SearchField(
                                // hasOverlay: false,

                                searchStyle: header11,
                                suggestionItemDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                suggestionStyle: header11,
                                controller: metrialController,
                                // validator: (p0) {
                                //   if (p0 == null || p0.isEmpty) {
                                //     // return 'Please enter an email address';
                                //     isError.value = true;
                                //   }
                                //   isError.value = false;
                                //   return null;
                                // },
                                searchInputDecoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: isError.value
                                              ? Colors.red
                                              : Colors.black26),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: isError.value
                                              ? Colors.red
                                              : Colors.black26),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: isError.value
                                              ? Colors.red
                                              : Colors.black26),
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
                                  FocusScope.of(context).unfocus();
                                  meterialId.value =
                                      value.item!.materialId.toString();
                                  meterialName.value =
                                      value.item!.materialName.toString();
                                  uniteName.value =
                                      value.item!.unitName.toString();
                                  controller.update();
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
                                  icon: const ImageIcon(AssetImage(
                                      "assets/images/quantity1.png")),
                                  mediaquery: mediaquery,
                                  controller: quanityController,
                                  keyboard: TextInputType.number,
                                  label: "",
                                  validator: Validators.noneEmptyValidator,
                                  onChanged: (p0) {
                                    if (quanityController.text.isNotEmpty) {
                                      quantity.value = double.parse(
                                          quanityController.text.toString());
                                      calculateGrossAmount();
                                    }
                                  },
                                )

                                    //  TextFormField(
                                    //   enableInteractiveSelection: true,
                                    //   controller: quanityController,
                                    //   validator: Validators.noneEmptyValidator,
                                    //   keyboardType: TextInputType.number,
                                    //   decoration: const InputDecoration(
                                    //     focusedBorder: UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     border: UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     enabledBorder: UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     icon: ImageIcon(AssetImage(
                                    //         "assets/images/quantity1.png")),
                                    //     //  prefixIcon: Icon(Icons.event_note)
                                    //   ),
                                    //   onChanged: (v) {
                                    //     if (quanityController.text.isNotEmpty) {
                                    //       quantity.value = double.parse(
                                    //           quanityController.text.toString());
                                    //       calculateGrossAmount();
                                    //     }
                                    //   },
                                    // ),
                                    ),
                                Obx(() => Text(
                                      uniteName.value == ""
                                          ? ""
                                          : uniteName.value,
                                      // qtext2 == null ? "" : qtext2.toString(),
                                      style: header4,
                                    )),
                              ],
                            ),
                            h2,
                            Text(
                              'Unit Price',
                              style: header4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: NewCaseTextField(
                                  icon: CachedNetworkImage(
                                    imageUrl:
                                        "https://cdn-icons-png.flaticon.com/512/5479/5479278.png",
                                    color: Colors.black,
                                    height: 3.h,
                                    width: 9.w,
                                    placeholder: (context, url) =>
                                        const SizedBox(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  mediaquery: mediaquery,
                                  controller: unitPriceController,
                                  keyboard: TextInputType.number,
                                  label: "",
                                  validator: Validators.noneEmptyValidator,
                                  onChanged: (p0) {
                                    if (unitPriceController.text.isNotEmpty) {
                                      unitPrice.value = double.parse(
                                          unitPriceController.text.toString());
                                      calculateGrossAmount();
                                    }
                                  },
                                )

                                    // TextFormField(
                                    //   enableInteractiveSelection: true,
                                    //   // initialValue: 'heloo',
                                    //   controller: unitPriceController,
                                    //   validator: Validators.noneEmptyValidator,
                                    //   keyboardType: TextInputType.number,
                                    //   onChanged: (v) {
                                    //     if (unitPriceController.text.isNotEmpty) {
                                    //       unitPrice.value = double.parse(
                                    //           unitPriceController.text
                                    //               .toString());
                                    //       calculateGrossAmount();
                                    //     }
                                    //   },

                                    //   decoration: InputDecoration(
                                    //     focusedBorder: const UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     border: const UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     enabledBorder: const UnderlineInputBorder(
                                    //       borderSide: BorderSide(
                                    //           width: 1, color: Colors.black26),
                                    //     ),
                                    //     icon: CachedNetworkImage(
                                    //       imageUrl:
                                    //           "https://cdn-icons-png.flaticon.com/512/5479/5479278.png",
                                    //       color: Colors.black,
                                    //       height: 3.h,
                                    //       width: 9.w,
                                    //       placeholder: (context, url) =>
                                    //           const SizedBox(),
                                    //       errorWidget: (context, url, error) =>
                                    //           const Icon(Icons.error),
                                    //     ),
                                    //     //  prefixIcon: Icon(Icons.event_note)
                                    //   ),
                                    // ),
                                    ),
                              ],
                            ),
                            h2,
                            Text(
                              'Tax Percentage',
                              style: header4,
                            ),
                            height3,
                            Obx(
                              () => SearchField(
                                searchStyle: header11,
                                suggestionStyle: header11,
                                suggestionItemDecoration:
                                    BoxDecoration(color: bColor2),
                                controller: taxPersentageController,
                                // validator: (value) {
                                //   if (taxPersentageController.text.isEmpty) {
                                //     return '}';
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                searchInputDecoration: InputDecoration(
                                  labelText: 'Tax Percent',
                                  labelStyle:
                                      header10.copyWith(color: Colors.black54),
                                  suffixIcon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  icon: taxPersent(),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: isTaxError.value
                                            ? Colors.red
                                            : Colors.black26),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: isTaxError.value
                                            ? Colors.red
                                            : Colors.black26),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: isTaxError.value
                                            ? Colors.red
                                            : Colors.black26),
                                  ),
                                ),
                                suggestions: controller
                                    .wageListModel!.taxPercentagesNew!
                                    .map((e) => SearchFieldListItem(
                                          e.taxPercentage.toString(),
                                          child: Text(e.taxPercentage ?? ""),
                                          item: e,
                                        ))
                                    .toList(),
                                onSuggestionTap: (value) {
                                  FocusScope.of(context).unfocus();
                                  log(taxPersentageid);
                                  taxPersentageid =
                                      taxPersentage = value.item?.taxId ?? "0";
                                  taxPersentage =
                                      value.item?.taxPercentage ?? "0";
                                  taxAmount.value = double.parse(
                                      value.item?.taxPercentage ??
                                          "0".toString());
                                  calculateGrossAmount();
                                  dropDwonValue = value.item?.taxPercentage ??
                                      "0".toString();
                                  controller.update();
                                },
                              ),
                            ),
                            h2,
                            Container(
                              //  margin: EdgeInsets.symmetric(horizontal: 2.h),
                              height: 8.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black54)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total Amount', style: header10),
                                  Obx(() {
                                    return Text(
                                        totalGrossAmount.value.toString(),
                                        style: header9);
                                  }),
                                ],
                              ),
                            ),
                            h2,
                            Text(
                              'Description',
                              style: header4,
                            ),
                            h1,
                            // TextFormField(
                            //   enableInteractiveSelection: true,
                            //   controller: descriptionController,
                            //   // validator: Validators.noneEmptyValidator,
                            //   maxLines: 5,
                            //   //keyboardType: TextInputType.number,
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(10))),
                            // ),
                            TextFormField(
                              enableInteractiveSelection: true,
                              controller: descriptionController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black26, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black26, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black26, width: 1),
                                ),
                              ),
                            ),

                            h3,
                            GestureDetector(
                              onTap: () {
                                if (dialogkey.currentState!.validate() &&
                                    metrialController.text.isNotEmpty &&
                                    taxPersentageController.text.isNotEmpty) {
                                  isTaxError.value = false;
                                  isError.value = false;
                                  controller.addpostemetrislList(BillOrder(
                                    description: descriptionController.text,
                                    materialId: meterialId.value,
                                    quantity: quanityController.text,
                                    taxPercentage: taxPersentageid.toString(),
                                    unitPrice: unitPrice.value.toString(),
                                  ));
                                  controller.addmetrialList(MetName2(
                                      qunit: uniteName.value,
                                      name: meterialName.value,
                                      qtext: quanityController.text,
                                      totalAmt:
                                          totalGrossAmount.value.toString(),
                                      taxPer: taxPersentage.toString()));
                                  // controller.quanityController.clear();
                                  // controller.metrialController.clear();
                                  // controller.unitPriceController.clear();
                                  // controller.descriptionController.clear();
                                  // controller.totalGrossAmount.value = 0;
                                  // controller.calculate();
                                  controller.calculateTotalAmount();
                                  controller.calculateBalanceAmount();

                                  Get.back();
                                }
                                isError.value = true;
                                isTaxError.value = true;
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
                            h2,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        );

        //             );
      });
}
