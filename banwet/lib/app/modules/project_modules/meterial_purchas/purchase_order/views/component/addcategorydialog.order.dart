import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/RequestModel/request_cat_modele.dart';
import 'package:banwet/app/data/model/purchase/order_model.dart';
import 'package:banwet/app/data/model/purchase/samplemodel.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/purchase_order/controllers/purchase_order_controller.dart';

import '../../../../../../Style/const.dart';

addCategoryDialogOrder(BuildContext context) {
  final GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  TextEditingController descriptionController = TextEditingController();
  TextEditingController Controller = TextEditingController();
  List<String> materialIdList = [];
  List<Order> orderList = [];
  List<MetName> metList = [];

  void addOrUpdateItem(Order newItem) {
    int existingIndex =
        orderList.indexWhere((item) => item.materialId == newItem.materialId);

    if (existingIndex != -1) {
      // Update existing item
      orderList[existingIndex] = newItem;
    } else {
      // Add new item
      orderList.add(newItem);
    }
  }

  void addOrUpdateItem1(MetName newItem) {
    int existingIndex = metList.indexWhere((item) => item.name == newItem.name);

    if (existingIndex != -1) {
      // Update existing item
      metList[existingIndex] = newItem;
    } else {
      // Add new item
      metList.add(newItem);
    }
  }

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        RequestCatModelData? selectedCategory;

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          final RxBool iserror = false.obs;
          return SizedBox(
            //height:80.h,
            // width: 100.w,
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
                    // height: 78.h,
                    width: 100.w,
                    child: Form(
                      key: categoryKey,
                      child: SingleChildScrollView(
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
                            // Center(
                            //   child: Text(
                            //     'Add from category',
                            //     style: header16,
                            //   ),
                            // ),
                            height5,
                            Text(
                              'Select Category',
                              style: header4,
                            ),
                            height3,
                            Obx(
                              () => SearchField<RequestCatModelData>(
                                controller: Controller,
                                // hasOverlay: false,

                                searchStyle: header11,
                                suggestionItemDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                suggestionStyle: header11,
                                // controller: _metController2,
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
                                    hintText: 'Select Supplier',
                                    hintStyle: header11.copyWith(
                                        color: Colors.black54),
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    icon: cImage(
                                        "https://cdn-icons-png.flaticon.com/512/7654/7654873.png")),

                                suggestions: controller.requestCatModel!.data!
                                    .map(
                                      (e) => SearchFieldListItem(
                                        e.categoryName ?? "",
                                        child: Text(
                                          e.categoryName.toString(),
                                          style: header11,
                                        ),
                                        item: e,
                                      ),
                                    )
                                    .toList(),
                                onSuggestionTap: (value) {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    selectedCategory = value.item;
                                  }); //value.item.categoryName;
                                },
                              ),
                            ),
                            h2,
                            Text(
                              'Items',
                              style: header4,
                            ),
                            if (selectedCategory != null)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                height: 22.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade50,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount:
                                      selectedCategory?.materials?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    materialIdList.add(selectedCategory
                                            ?.materials?[index].materialId ??
                                        "");
                                    // TextEditingController quantityController =
                                    //     TextEditingController();
                                    return Row(
                                      children: [
                                        Expanded(
                                            child: Text(selectedCategory
                                                    ?.materials?[index]
                                                    .materialName ??
                                                "")),
                                        SizedBox(
                                          width: 25.w,
                                          height: 4.h,
                                          child: TextField(
                                              //   controller: quantityController,
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                addOrUpdateItem(Order(
                                                    materialId: selectedCategory
                                                            ?.materials?[index]
                                                            .materialId ??
                                                        "",
                                                    quantity: value));
                                                addOrUpdateItem1(MetName(
                                                    qunit: selectedCategory
                                                        ?.materials?[index]
                                                        .unitName,
                                                    name: selectedCategory
                                                            ?.materials?[index]
                                                            .materialName ??
                                                        "",
                                                    qtext: value));
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  hintText: selectedCategory
                                                          ?.materials?[index]
                                                          .unitName ??
                                                      "",
                                                  hintStyle: header10.copyWith(
                                                    color: Colors.black54,
                                                  ),
                                                  icon: const Icon(
                                                    Icons
                                                        .sticky_note_2_outlined,
                                                    size: 0,
                                                  ))),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(
                                      height: 0.5.h,
                                    );
                                  },
                                ),
                              ),
                            h2,
                            h2,
                            Text(
                              'Description',
                              style: header4,
                            ),
                            h1,
                            TextFormField(
                              enableInteractiveSelection: true,
                              controller: descriptionController,

                              maxLines: 5,
                              //  keyboardType: TextInputType.number,
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
                                if (categoryKey.currentState!.validate() &&
                                    Controller.text.isNotEmpty) {
                                  if (selectedCategory != null) {
                                    for (int index = 0;
                                        index < orderList.length;
                                        index++) {
                                      controller.addpostemetrislList(
                                          orderList[index]);
                                      controller.addmetrialList(metList[index]);
                                      controller.update();
                                    }
                                    for (var i = 0;
                                        i < materialIdList.length;
                                        i++) {
                                      controller.updateDescription(
                                          controller.postemetrislList,
                                          materialIdList[i] ?? "",
                                          descriptionController.text);
                                    }
                                  }
                                  iserror.value = false;
                                  // Implement your submit logic here
                                  Get.back();
                                }
                                iserror.value = true;
                              },
                              child: Container(
                                height: 6.h,
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
