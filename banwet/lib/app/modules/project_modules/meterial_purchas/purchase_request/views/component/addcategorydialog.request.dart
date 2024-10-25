import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/RequestModel/request_cat_modele.dart';
import 'package:banwet/app/data/model/purchase/samplemodel.dart';

import '../../../../../../Style/const.dart';
import '../../controllers/purchase_request_controller.dart';

addCategory(BuildContext context) {
  final GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  PurchaseRequestController controller = Get.put(PurchaseRequestController());
  TextEditingController descriptionController = TextEditingController();
  List<String> materialIdList = [];
  List<Item> itemList = [];
  TextEditingController category = TextEditingController();
  List<MetName> metList = [];
  void addOrUpdateItem(newItem) {
    int existingIndex =
        itemList.indexWhere((item) => item.materialId == newItem.materialId);

    if (existingIndex != -1) {
      // Update existing item
      itemList[existingIndex] = newItem;
    } else {
      // Add new item
      itemList.add(newItem);
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
                            //     style: header15,
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
                                controller: category,
                                // hasOverlay: false,

                                searchStyle: header11,
                                suggestionItemDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: const Color.fromARGB(0, 0, 0, 0)),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                suggestionStyle: header11,
                                // controller: _metController2,
                                // validator: Validators.noneEmptyValidator,

                                searchInputDecoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: iserror.value != false
                                              ? Colors.red
                                              : Colors.black26,
                                          width: 1.0),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(color: bColor),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: iserror.value != false
                                              ? Colors.red
                                              : Colors.black26,
                                          width: 1.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: iserror.value != false
                                              ? Colors.red
                                              : Colors.black26,
                                          // controller.errormessage.value ??
                                          //     Color.fromARGB(255, 211, 211, 211),
                                          width: 1),
                                    ),
                                    focusedErrorBorder:
                                        const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Color.fromARGB(
                                              255, 211, 211, 211),
                                          width: 1),
                                    ),
                                    labelText: 'Select Category',
                                    labelStyle: header10.copyWith(
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
                            // SearchField<RequestCatModelData>(
                            //   searchStyle: header11,
                            //   suggestionItemDecoration: BoxDecoration(
                            //     border: Border.all(
                            //         color:
                            //             Colors.transparent), // Removing border
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   suggestionStyle: header11,
                            //   validator: Validators.noneEmptyValidator,
                            //   searchInputDecoration: InputDecoration(
                            //     focusedBorder: const UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //           color: Colors.black26, width: 1.0),
                            //     ),
                            //     border: UnderlineInputBorder(
                            //       borderSide: BorderSide(color: bColor),
                            //     ),
                            //     enabledBorder: const UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //           color: Colors.black26, width: 1.0),
                            //     ),
                            //     errorBorder: const UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //           style: BorderStyle.solid,
                            //           color: Colors.red,
                            //           // controller.errormessage.value ??
                            //           //     Color.fromARGB(255, 211, 211, 211),
                            //           width: 1),
                            //     ),
                            //     focusedErrorBorder: const UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //           style: BorderStyle.solid,
                            //           color: Color.fromARGB(255, 211, 211, 211),
                            //           width: 1),
                            //     ),
                            //     labelText: 'Select Category',
                            //     labelStyle:
                            //         header10.copyWith(color: Colors.black54),
                            //     suffixIcon: const Icon(Icons.arrow_drop_down,
                            //         color: Colors.grey),
                            //     icon: cImage(
                            //         "https://cdn-icons-png.flaticon.com/512/7654/7654873.png"),
                            //   ),
                            //   suggestions: controller.requestCatModel!.data!
                            //       .map(
                            //         (e) => SearchFieldListItem(
                            //           e.categoryName ?? "",
                            //           child: Text(
                            //             e.categoryName.toString(),
                            //             style: header11,
                            //           ),
                            //           item: e,
                            //         ),
                            //       )
                            //       .toList(),
                            //   onSuggestionTap: (value) {
                            //     FocusScope.of(context).unfocus();
                            //     setState(() {
                            //       selectedCategory = value.item;
                            //     });
                            //   },
                            // ),

                            h2,
                            selectedCategory != null
                                ? Text(
                                    'Items',
                                    style: header4,
                                  )
                                : const SizedBox(),
                            h1,
                            if (selectedCategory != null)
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.h),
                                height: 24.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(60, 105, 126, 137),
                                    borderRadius: BorderRadius.circular(5)),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount:
                                      selectedCategory?.materials?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    materialIdList.add(selectedCategory
                                            ?.materials?[index].materialId ??
                                        "");

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
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                addOrUpdateItem(Item(
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
                                                errorBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                border:
                                                    const UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent)),
                                                hintText: selectedCategory
                                                        ?.materials?[index]
                                                        .unitName ??
                                                    "",
                                                hintStyle: header10.copyWith(
                                                  color: Colors.black54,
                                                ),
                                                icon: const Icon(
                                                  Icons.sticky_note_2_outlined,
                                                  size: 10,
                                                  color: Colors.transparent,
                                                ),
                                              )),
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

                            Text(
                              'Description',
                              style: header4,
                            ),
                            h1,
                            TextFormField(
                                controller: descriptionController,
                                enableInteractiveSelection: true,
                                maxLines: 5,
                                //  keyboardType: TextInputType.number,
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
                                )),
                            h3,
                            GestureDetector(
                              onTap: () {
                                if (categoryKey.currentState!.validate() &&
                                    category.text.isNotEmpty) {
                                  if (selectedCategory != null) {
                                    for (int index = 0;
                                        index < itemList.length;
                                        index++) {
                                      controller
                                          .addpostemetrislList(itemList[index]);
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
                                  Get.back();
                                }
                                iserror.value = true;

                                // Implement your submit logic here
                                // Get.back();
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
