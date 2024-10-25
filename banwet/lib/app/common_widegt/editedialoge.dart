import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../Style/const.dart';
import '../modules/project_modules/meterial_purchas/purchase_bill/controllers/purchase_bill_controller.dart';
import '../modules/project_modules/meterial_purchas/purchase_order/controllers/purchase_order_controller.dart';
import '../modules/project_modules/meterial_purchas/purchase_request/controllers/purchase_request_controller.dart';

editDialog(
  BuildContext context,
  int index,
  String? name,
  String? qCount,
  String? qdis,
  void Function() onTap,
  String? qname,
) {
  PurchaseRequestController controller = Get.put(PurchaseRequestController());

  TextEditingController quantity = TextEditingController(text: qCount);
  TextEditingController discription = TextEditingController(text: qdis);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          //  height:80.h,
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
                  padding: EdgeInsets.all(2.h),
                  // height: 67.h,
                  width: 100.w,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.close)],
                          ),
                        ),

                        Center(
                          child: Text('Edit Material', style: header16),
                        ),
                        h2,
                        Text(
                          'Select Materials',
                          style: header4,
                        ),
                        SearchField(
                          readOnly: true,
                          controller:
                              TextEditingController(text: name.toString()),
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
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black12,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black12, width: 1.0),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.black12,
                                    // controller.errormessage.value ??
                                    //     Color.fromARGB(255, 211, 211, 211),
                                    width: 1),
                              ),
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.red,
                                    width: 1),
                              ),
                              labelText: 'Select Material',
                              labelStyle:
                                  header10.copyWith(color: Colors.black54),
                              // suffixIcon: const Icon(Icons.arrow_drop_down,
                              //     color: Colors.grey),
                              icon: cImage(
                                  "https://cdn-icons-png.flaticon.com/512/7654/7654873.png")),
                          suggestions: const [],
                          // controller.requestModel!.data!
                          //     .map(
                          //       (e) => SearchFieldListItem(
                          //         e.materialName.toString(),
                          //         child: Text(
                          //           "  ${e.materialName.toString()}",
                          //           style: header11,
                          //         ),
                          //         item: e,
                          //       ),
                          //     )
                          //     .toList(),
                          onSuggestionTap: (value) {
                            // controller.quantitytype.value =
                            //     value.item!.unitName!;
                            // FocusScope.of(context).unfocus();
                            // metrialName = value.item!.materialName!;
                            // metrialid = value.item!.materialId!;
                          },
                        ),
                        // Text(
                        //   name.toString(),
                        //   style: header15,
                        // ),
                        h2,

                        //  h2,

                        Row(
                          children: [
                            Text(
                              'Quantity : ',
                              style: header4,
                            ),
                            w2,
                            Expanded(
                              child: TextField(
                                controller: quantity,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    )),
                              ),
                            ),
                            Text(
                              qname.toString(),
                              style: header4,
                            ),
                          ],
                        ),
                        h2,
                        Text(
                          'Description',
                          style: header4,
                        ),
                        h1,
                        TextField(
                          controller: discription,
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        h3, h2,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            controller.editItem(
                                index, discription.text, quantity.text);

                            print(controller.postemetrislList[index].quantity
                                .toString());
                          },
                          child: Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: bColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Update',
                                style: wheader4,
                              ),
                            ),
                          ),
                        ),
                        h3
                      ],
                    ),
                  ),
                ),
              ]),
        );
      });
}

editDialog1(
  BuildContext context,
  int index,
  String? name,
  String? qCount,
  String? qdis,
  void Function() onTap,
) {
  PurchaseRequestController controller = Get.find<PurchaseRequestController>();

  TextEditingController quantity = TextEditingController(text: qCount);
  TextEditingController discription = TextEditingController(text: qdis);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Material'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.toString(),
                style: header15,
              ),
              h2,
              // Text(
              //   'Quantity',
              //   style: header4,
              // ),
              Row(
                children: [
                  Text(
                    'Quantity : ',
                    style: header4,
                  ),
                  w2,
                  Expanded(
                    child: TextField(
                      controller: quantity,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(),
                    ),
                  ),
                ],
              ),
              h2,
              Text(
                'Description',
                style: header4,
              ),
              h1,
              TextField(
                controller: discription,
                maxLines: 5,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              controller.editItem(
                index,
                discription.text,
                quantity.text,
              );
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}

Row _edit() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: EdgeInsets.all(1.2.h),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 0.1.h,
          backgroundColor: bColor,
        ),
      ),
      w4,
      Container(
        height: 0.3.h,
        width: 19.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
      ),
      w4,
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: bColor, width: 2)),
        child: const Icon(Icons.edit),
      ),
    ],
  );
}

ordereditDialog(BuildContext context, int index, String? name, String? qCount,
    String? qdis, void Function() onTap) {
  PurchaseOrderController controller = Get.put(PurchaseOrderController());

  TextEditingController quantity = TextEditingController(text: qCount);
  TextEditingController discription = TextEditingController(text: qdis);
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          //  height:80.h,
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
                  padding: EdgeInsets.all(2.h),
                  // height: 62.h,
                  width: 100.w,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.close)],
                          ),
                        ),

                        Center(
                          child: Text(
                            'Edit Material',
                            style: header3,
                          ),
                        ),
                        h2,
                        Text(
                          name.toString(),
                          style: header15,
                        ),
                        h2,

                        // Text(
                        //   'Quantity',
                        //   style: header4,
                        // ),
                        //  h2,

                        Row(
                          children: [
                            Text(
                              'Quantity : ',
                              style: header4,
                            ),
                            w2,
                            Expanded(
                              child: TextField(
                                controller: quantity,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    )),
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
                        TextField(
                          controller: discription,
                          maxLines: 5,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                        h3,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            controller.editItem(
                                index, discription.text, quantity.text);

                            print(controller.postemetrislList[index].quantity
                                .toString());
                          },
                          child: Container(
                            height: 5.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: bColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Update',
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
              ]),
        );
      });
}

billeditDialog(BuildContext context, int index, String? name, String? qCount,
    String unitPrices, String tax, String? qdis, String? totalGrossAmounts) {
  PurchaseBillController controller = Get.put(PurchaseBillController());
  var selected = "0".obs;
  final GlobalKey<FormState> fkey = GlobalKey<FormState>();

  TextEditingController quantityController =
      TextEditingController(text: qCount);
  TextEditingController unitPriceController =
      TextEditingController(text: unitPrices);
  TextEditingController descriptionController =
      TextEditingController(text: qdis);
  TextEditingController taxpersentageController =
      TextEditingController(text: tax);
  RxDouble grossAmount = 0.0.obs;
  RxDouble unitPrice = 0.0.obs;
  RxDouble quantity = 0.0.obs;
  RxDouble taxpersentage = 0.0.obs;
  RxDouble taxAmount = 0.0.obs;
  RxDouble totalGrossAmount = 0.0.obs;
  String taxid = "";
  quantity.value = double.parse(qCount.toString());

  // grossAmount.value = double.parse(totalGrossAmounts.toString());
  unitPrice.value = double.parse(unitPrices.toString());
  taxpersentage.value = double.parse(tax.toString());
  // grossAmount.value = double.parse(totalGrossAmounts ?? "0");

  calculateGrossAmount() {
    grossAmount.value = unitPrice.value * quantity.value;
    taxAmount.value = grossAmount.value / (100.00 / taxpersentage.value);
    totalGrossAmount.value = grossAmount.value + taxAmount.value;
    log("-----------------${taxAmount.value}----------------taxamount---mmmmmmmmmmmmmmm");
    log("-----------------${grossAmount.value}----------------grosss---mmmmmmmmmmmmmmm");
    log("-----------------${totalGrossAmount.value}--------total--------grosss---mmmmmmmmmmmmmmm");
  }

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          //  height:80.h,
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
                  padding: EdgeInsets.all(2.h),
                  // height: 67.h,
                  width: 100.w,
                  child: SingleChildScrollView(
                    child: Form(
                      key: fkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.close)],
                            ),
                          ),

                          Center(
                            child: Text(
                              'Edit Material',
                              style: header3,
                            ),
                          ),
                          h2,
                          Text(
                            name.toString(),
                            style: header15,
                          ),
                          h2,

                          // Text(
                          //   'Quantity',
                          //   style: header4,
                          // ),
                          //  h2,
                          h2,
                          Row(
                            children: [
                              Text(
                                'Quantity : ',
                                style: header4,
                              ),
                              w2,
                              Expanded(
                                child: TextFormField(
                                  enableInteractiveSelection: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: quantityController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (quantityController.text.isNotEmpty) {
                                      quantity.value = double.parse(value);
                                      // calculateGrossAmount();
                                    } else {}
                                  },
                                ),
                              ),
                            ],
                          ),
                          h2,
                          // Text(
                          //   'Unit price',
                          //   style: header4,
                          // ),
                          h1,
                          Row(
                            children: [
                              Text(
                                'Unit price : ',
                                style: header4,
                              ),
                              Expanded(
                                child: TextFormField(
                                  enableInteractiveSelection: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: unitPriceController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black26),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (unitPriceController.text.isNotEmpty) {
                                      unitPrice.value = double.parse(value);
                                      // calculateGrossAmount();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          h2,
                          Text(
                            'Tax Persentage',
                            style: header4,
                          ),

                          SearchField(
                            searchStyle: header11,
                            suggestionStyle: header11,
                            suggestionItemDecoration:
                                BoxDecoration(color: bColor2),
                            controller: taxpersentageController,
                            validator: (value) {
                              if (taxpersentageController.text.isEmpty) {
                                return 'Please Fill Field';
                              } else {
                                return null;
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
                                    color: Colors.black26, width: 1.0),
                              ),
                            ),
                            suggestions:
                                controller.wageListModel!.taxPercentagesNew!
                                    .map((e) => SearchFieldListItem(
                                          e.taxPercentage.toString(),
                                          child: Text(e.taxPercentage ?? ""),
                                          item: e,
                                        ))
                                    .toList(),
                            onSuggestionTap: (value) {
                              FocusScope.of(context).unfocus();
                              taxid = value.item!.taxId!;
                              taxpersentage.value =
                                  double.parse(value.item!.taxPercentage!);
                              log("${value.item?.taxPercentage!}------qqqqqqqqqqqqq ee-------------");
                            },
                          ),
                          h2,
                          Text(
                            'Description',
                            style: header4,
                          ),
                          h1,
                          TextField(
                            controller: descriptionController,
                            maxLines: 5,
                            keyboardType: TextInputType.number,
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
                              if (fkey.currentState!.validate()) {
                                calculateGrossAmount();
                                Get.back();

                                controller.editItem(
                                    index,
                                    descriptionController.text,
                                    quantityController.text,
                                    taxpersentageController.text.toString(),
                                    taxid,
                                    unitPriceController.text,
                                    totalGrossAmount.value.toString());

                                controller.calculateTotalAmount();
                                controller.calculateBalanceAmount();
                              }
                            },
                            child: Container(
                              height: 5.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: bColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Update',
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
              ]),
        );
      });
}
