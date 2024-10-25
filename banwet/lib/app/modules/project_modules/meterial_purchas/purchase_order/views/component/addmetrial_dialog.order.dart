// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../data/model/purchase/order_model.dart';
import '../../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../../utils/validators.dart';
import '../../controllers/purchase_order_controller.dart';

addMaterials(context) {
  final GlobalKey<FormState> metrialKey = GlobalKey<FormState>();
  String metrialName = "";
  String metrialid = "";

  TextEditingController meterialControler = TextEditingController();
  TextEditingController quantityControllers = TextEditingController();
  TextEditingController descriptionControllers = TextEditingController();
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        final RxBool iserror = false.obs;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            // color: Colors.white,
            // height: 70.h,
            width: 100.w,
            child: SimpleDialog(
                backgroundColor: Colors.white,
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
                      key: metrialKey,
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
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
                            // GestureDetector(
                            //   onTap: () => Get.back(),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: const [Icon(Icons.close)],
                            //   ),
                            // ),
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
                                controller: meterialControler,
                                searchStyle: header11,
                                suggestionItemDecoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black26, width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                suggestionStyle: header11,
                                // controller: _metController,
                                // validator: Validators.noneEmptyValidator,

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
                                    hintText: 'Select Material',
                                    hintStyle: header11.copyWith(
                                        color: Colors.black54),
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    icon: cImage(
                                        "https://cdn-icons-png.flaticon.com/512/7654/7654873.png")),

                                // searchInputDecoration: InputDecoration(
                                //     labelText: 'Select Material',
                                //     labelStyle:
                                //         header10.copyWith(color: Colors.black54),
                                //     suffixIcon: const Icon(Icons.arrow_drop_down,
                                //         color: Colors.grey),
                                //     icon: cImage(
                                //         "https://cdn-icons-png.flaticon.com/512/7654/7654873.png")),
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
                                  child: TextFormField(
                                    enableInteractiveSelection: true,
                                    controller: quantityControllers,
                                    validator: Validators.noneEmptyValidator,
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
                                      // border: OutlineInputBorder(
                                      //     borderSide: BorderSide(
                                      //         color: Colors.black12, width: 1)),

                                      icon: ImageIcon(AssetImage(
                                          "assets/images/quantity1.png")),

                                      //  prefixIcon: Icon(Icons.event_note)
                                    ),
                                  ),
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
                            // TextFormField(
                            //     enableInteractiveSelection: true,
                            //     controller: descriptionControllers,
                            //     maxLines: 5,
                            //     // keyboardType: TextInputType.number,
                            //     decoration: InputDecoration(
                            //       focusedBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             width: 1, color: Colors.black26),
                            //       ),
                            //       border: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             width: 1, color: Colors.black26),
                            //       ),
                            //       enabledBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             width: 1, color: Colors.black26),
                            //       ),
                            //     )),

                            TextFormField(
                              enableInteractiveSelection: true,
                              controller: descriptionControllers,
                              maxLines: 5,
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
                              onTap: () async {
                                if (metrialKey.currentState!.validate() &&
                                    meterialControler.text.isNotEmpty) {
                                  controller.addmetrialList(MetName(
                                      qunit: controller.quantitytype.value,
                                      name: metrialName,
                                      qtext: quantityControllers.text));
                                  controller.addpostemetrislList(Order(
                                    description: descriptionControllers.text,
                                    materialId: metrialid,
                                    quantity: quantityControllers.text,
                                  ));
                                  iserror.value = false;
                                  Get.back();
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
                            h2,
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          );
        });
      });
}
