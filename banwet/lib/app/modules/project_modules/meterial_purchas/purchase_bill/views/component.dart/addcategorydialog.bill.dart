import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/RequestModel/request_cat_modele.dart';
import 'package:banwet/app/data/model/purchase/bill_post_model.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../data/model/purchase/samplemodel.dart';
import '../../../../../../utils/validators.dart';
import '../../controllers/purchase_bill_controller.dart';

addCategoryDialogeBill(BuildContext context) {
  final GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  PurchaseBillController controller = Get.put(PurchaseBillController());
  TextEditingController descriptionController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController taxpersentage = TextEditingController();
  List<String> materialIdList = [];
  List<BillOrder> orderList = [];
  List<MetName2> metList = [];
  String dropDwonValue = "0";
  RxDouble grossAmount = 0.0.obs;
  RxDouble taxamount = 0.0.obs;
  RxDouble taxPercentage = 0.0.obs;
  String taxPercentageid = "";
  RxDouble totalGrossAmount = 0.0.obs;
  void addOrUpdateItem(BillOrder newItem) {
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

  void addOrUpdateItem1(MetName2 newItem) {
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
                            // GestureDetector(
                            //   onTap: () => Get.back(),
                            //   child: const Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [Icon(Icons.close)],
                            //   ),
                            // ),
                            // Center(
                            //   child: Text(
                            //     'Add from categorys',
                            //     style: header16,
                            //   ),
                            // ),
                            height5,
                            Text(
                              'Select Category',
                              style: header4,
                            ),
                            height3,
                            SearchField<RequestCatModelData>(
                              // hasOverlay: false,

                              searchStyle: header11,
                              suggestionItemDecoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              suggestionStyle: header11,
                              // controller: _metController2,
                              validator: Validators.noneEmptyValidator,
                              searchInputDecoration: InputDecoration(
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black26),
                                  ),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black26),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.black26),
                                  ),
                                  hintText: 'Select Supplier',
                                  hintStyle:
                                      header11.copyWith(color: Colors.black54),
                                  suffixIcon: const Icon(Icons.arrow_drop_down,
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
                            h2,
                            selectedCategory != null
                                ? Text(
                                    'Items',
                                    style: header4,
                                  )
                                : const SizedBox(),
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
                                                addOrUpdateItem(BillOrder(
                                                    materialId: selectedCategory
                                                            ?.materials?[index]
                                                            .materialId ??
                                                        "",
                                                    quantity: value));
                                                addOrUpdateItem1(MetName2(
                                                    qunit: selectedCategory
                                                        ?.materials?[index]
                                                        .unitName,
                                                    taxPer: "",
                                                    totalAmt: "",
                                                    name: selectedCategory
                                                            ?.materials?[index]
                                                            .materialName ??
                                                        "",
                                                    qtext: value));
                                              },
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
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
                            h1,
                            Text(
                              'Unit Price',
                              style: header4,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enableInteractiveSelection: true,
                                    // initialValue: 'heloo',
                                    controller: unitPriceController,
                                    validator: Validators.noneEmptyValidator,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black26),
                                      ),
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black26),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black26),
                                      ),
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
                                      //  prefixIcon: Icon(Icons.event_note)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            h2,
                            h2,
                            Text(
                              'Tax Percentage',
                              style: header4,
                            ),
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton2(
                            //     // searchController: _met,
                            //     isExpanded: true,
                            //     hint: Row(
                            //       children: [
                            //         const SizedBox(
                            //           width: 0,
                            //         ),
                            //         Expanded(
                            //           child: Text(
                            //             '0',
                            //             style: header10.copyWith(
                            //                 color: Colors.grey),
                            //             overflow: TextOverflow.ellipsis,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     items: controller
                            //         .wageListModel!.taxPercentagesNew!
                            //         .map((items) => DropdownMenuItem(
                            //               value: items.taxPercentage.toString(),
                            //               onTap: () {},
                            //               child: Text(
                            //                 items.taxPercentage.toString(),
                            //                 style: header11,
                            //                 overflow: TextOverflow.ellipsis,
                            //               ),
                            //             ))
                            //         .toList(),
                            //     value: dropDwonValue,
                            //     onChanged: (value) {
                            //       taxPercentageid = value.
                            //       taxPercentage.value =
                            //           double.parse(value.toString());
                            //       controller.calculateGrossAmount();
                            //       dropDwonValue = value.toString();

                            //       controller.update();
                            //     },
                            //   ),
                            // ),

                            height3,
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
                                if (selectedCategory != null) {
                                  for (int index = 0;
                                      index < orderList.length;
                                      index++) {
                                    orderList[index].unitPrice =
                                        unitPriceController.text;
                                    orderList[index].taxPercentage =
                                        taxpersentage.text;

                                    grossAmount.value = double.parse(
                                            unitPriceController.text) *
                                        double.parse(
                                            orderList[index].quantity ?? "0");
                                    taxamount.value = grossAmount.value /
                                        (100.00 / taxPercentage.value);
                                    totalGrossAmount.value =
                                        grossAmount.value + taxamount.value;
                                    metList[index].totalAmt =
                                        totalGrossAmount.toString();

                                    controller
                                        .addpostemetrislList(orderList[index]);
                                    controller.addmetrialList(metList[index]);
                                    controller.calculateTotalAmount();
                                    controller.calculateBalanceAmount();

                                    controller.update();
                                  }
                                }
                                // // Implement your submit logic here
                                Get.back();
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





// addCategoryDialogeBill(BuildContext context) {
//   final GlobalKey<FormState> key1 = GlobalKey<FormState>();
//   PurchaseBillController controller = Get.put(PurchaseBillController());

//   TextEditingController meterialCOntroller = TextEditingController();
//   TextEditingController deScriptionController = TextEditingController();
//   TextEditingController unitController = TextEditingController();
//   List conData = [];
//   List conNos = [];
//   List conMet = [];
//   List dat = [];
//   String metName = "";
//   // TextEditingController meterialCOntroller = TextEditingController();
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         var dialogeList = <TextEditingController>[].obs;
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return SizedBox(
//             //height:80.h,
//             width: 100.w,
//             child: SimpleDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15)),
//                 contentPadding: EdgeInsets.zero,
//                 titlePadding: EdgeInsets.zero,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15)),
//                     padding: EdgeInsets.only(top: 2.h, left: 2.h, right: 2.h),
//                     //height: 100.h,
//                     width: 100.w,
//                     child: Form(
//                       key: key1,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             GestureDetector(
//                               onTap: () => Get.back(),
//                               child: const Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [Icon(Icons.close)],
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 'Add from category',
//                                 style: header16,
//                               ),
//                             ),
//                             height5,
//                             Text(
//                               'Select Category',
//                               style: header4,
//                             ),
//                             height3,
//                             SearchField<RequestCatModelData>(
//                               searchStyle: header11,
//                               suggestionItemDecoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black12),
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10)),
//                               suggestionStyle: header11,
//                               controller: meterialCOntroller,
//                               validator: Validators.noneEmptyValidator,
//                               searchInputDecoration: InputDecoration(
//                                 labelText: 'Select Category',
//                                 labelStyle:
//                                     header10.copyWith(color: Colors.black54),
//                                 suffixIcon: const Icon(Icons.arrow_drop_down,color: Colors.grey),
//                                 icon: cImage(
//                                     "https://cdn-icons-png.flaticon.com/512/7654/7654873.png"),
//                                 enabledBorder: const UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Colors.black87, width: 1.0),
//                                 ),
//                               ),
//                               suggestions: controller.requestCatModel!.data!
//                                   .map(
//                                     (e) => SearchFieldListItem(
//                                       e.categoryName.toString(),
//                                       child: Text(
//                                         "  ${e.categoryName.toString()}",
//                                         style: header11,
//                                       ),
//                                       item: e,
//                                     ),
//                                   )
//                                   .toList(),
//                               onSuggestionTap: (value) {
//                                 FocusScope.of(context).unfocus();
//                                 for (var i = 0;
//                                     i < value.item!.materials!.length;
//                                     i++) {
//                                   dialogeList.add(TextEditingController());
//                                   var length = value.item?.materials?.length;
//                                   dat = value.item!.materials!
//                                       .map((e) => e.materialName)
//                                       .toList();
//                                   conData = value.item!.materials!
//                                       .map((e) => e.materialId)
//                                       .toList();
//                                   conMet = value.item!.materials!
//                                       .map((e) => e.materialName)
//                                       .toList();
//                                   conNos = value.item!.materials!
//                                       .map((e) => e.unitName)
//                                       .toList();

//                                   metName = value.item!.categoryName.toString();
//                                 }
//                               },
//                             ),
//                             h2,
//                             Text(
//                               'Items',
//                               style: header4,
//                             ),
//                             h3,
//                             Obx(() => dialogeList.value.isEmpty
//                                 ? const SizedBox()
//                                 : Container(
//                                     margin:
//                                         const EdgeInsets.symmetric(vertical: 2),
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 2.h, vertical: 2.h),
//                                     //height: 13.h,
//                                     width: 100.w,
//                                     decoration: BoxDecoration(
//                                         color: Colors.blueGrey.shade50,
//                                         borderRadius:
//                                             BorderRadius.circular(10)),
//                                     child: ListView.separated(
//                                       shrinkWrap: true,
//                                       itemCount: dialogeList.value.length,
//                                       itemBuilder: (context, index) {
//                                         return Row(
//                                           children: [
//                                             Expanded(
//                                                 child: Text(
//                                                     dat[index].toString())),
//                                             SizedBox(
//                                               width: 23.w,
//                                               height: 4.h,
//                                               child: TextField(
//                                                   controller:
//                                                       dialogeList[index],
//                                                   keyboardType:
//                                                       TextInputType.number,
//                                                   decoration: InputDecoration(
//                                                     hintText: conNos[index]
//                                                         .toString(),
//                                                     hintStyle:
//                                                         header10.copyWith(
//                                                       color: Colors.black54,
//                                                     ),
//                                                     icon: const ImageIcon(
//                                                         AssetImage(
//                                                             "assets/images/quantity1.png")),
//                                                   )),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                       separatorBuilder: (context, index) {
//                                         return Divider(
//                                           height: 0.5.h,
//                                         );
//                                       },
//                                     ),
//                                   )),
                            // h1,
                            // Text(
                            //   'Unit Price',
                            //   style: header4,
                            // ),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: TextFormField(
                            //         // initialValue: 'heloo',
                            //         controller: unitController,
                            //         validator: Validators.noneEmptyValidator,
                            //         keyboardType: TextInputType.number,
                            //         decoration: InputDecoration(
                            //           icon: CachedNetworkImage(
                            //             imageUrl:
                            //                 "https://cdn-icons-png.flaticon.com/512/5479/5479278.png",
                            //             color: Colors.black,
                            //             height: 3.h,
                            //             width: 9.w,
                            //             placeholder: (context, url) =>
                            //                 const SizedBox(),
                            //             errorWidget: (context, url, error) =>
                            //                 const Icon(Icons.error),
                            //           ),
                            //           //  prefixIcon: Icon(Icons.event_note)
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // h2,
                            // Text(
                            //   'Tax Percentage',
                            //   style: header4,
                            // ),
                            // DropdownButtonHideUnderline(
                            //   child: DropdownButton2(
                            //     // searchController: _met,
                            //     isExpanded: true,
                            //     hint: Row(
                            //       children: [
                            //         const SizedBox(
                            //           width: 0,
                            //         ),
                            //         Expanded(
                            //           child: Text(
                            //             '0',
                            //             style: header10.copyWith(
                            //                 color: Colors.grey),
                            //             overflow: TextOverflow.ellipsis,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //     items: controller
                            //         .wageListModel!.taxPercentagesNew!
                            //         .map((items) => DropdownMenuItem(
                            //               value: items.taxPercentage.toString(),
                            //               onTap: () {},
                            //               child: Text(
                            //                 items.taxPercentage.toString(),
                            //                 style: header11,
                            //                 overflow: TextOverflow.ellipsis,
                            //               ),
                            //             ))
                            //         .toList(),
                            //     value: controller.dropDwonValue,
                            //     onChanged: (value) {
                            //       controller.taxAmount.value =
                            //           double.parse(value.toString());
                            //       controller.calculateGrossAmount();
                            //       controller.dropDwonValue = value.toString();

                            //       controller.update();
                            //     },
                            //   ),
                            // ),
                            // height3,
//                             Text(
//                               'Description',
//                               style: header4,
//                             ),
//                             h1,
//                             TextFormField(
//                               controller: deScriptionController,

//                               maxLines: 5,
//                               // keyboardType: TextInputType.number,
//                               decoration: InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                             ),
//                             h3,
//                             GestureDetector(
//                               onTap: () {
//                                 if (key1.currentState!.validate()) {
//                                   for (var i = 0; i < conData.length; i++) {
//                                     controller.addpostemetrislList(BillOrder(
//                                         materialId: conData[i],
//                                         quantity: dialogeList[i].text,
//                                         description:
//                                             deScriptionController.text));
//                                     // addOrder(BillOrder(
//                                     //     materialId: _conData[i],
//                                     //     quantity: _con[i].text,
//                                     //     description: _dec1.text));
//                                   }
//                                   for (var i = 0; i < dialogeList.length; i++) {
//                                     controller.metrialList.add(
//                                       MetName2(
//                                           name: conMet[i],
//                                           qtext: conNos[i],
//                                           totalAmt: "",
//                                           // totalAmt: controller.grossTotal
//                                           // .toString(),
//                                           taxPer: 'j'),
//                                     );
//                                   }
//                                 }
//                                 Get.back();
//                               },
//                               child: Container(
//                                 height: 5.h,
//                                 decoration: BoxDecoration(
//                                     color: bColor,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Center(
//                                   child: Text(
//                                     'Submit',
//                                     style: wheader4,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             h2
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//           );
//         });
//       });
// }
