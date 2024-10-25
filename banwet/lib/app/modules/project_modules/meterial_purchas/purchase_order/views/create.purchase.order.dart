// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/data/model/purchase/supplier_list.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../common_widegt/editedialoge.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../../purchase_request/views/component/addrequestcontainer.dart';
import '../controllers/purchase_order_controller.dart';
import 'component/addcategorydialog.order.dart';
import 'component/addmetrial_dialog.order.dart';
import 'component/indication.dart';

class AddPurchaseOrder extends StatelessWidget {
  AddPurchaseOrder({super.key});
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  ValueNotifier<bool> postionNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.postemetrislList.clear();
              controller.metrialList.clear();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Create Purchase Order",
          style: header15.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            h2,
            Indiaction(
                onTap: () {
                  postionNotifier.value = false;
                  postionNotifier.notifyListeners();
                },
                postionNotifier: postionNotifier),
            h2,
            GetBuilder<PurchaseOrderController>(
                builder: (context) {
                  return controller.supplierList == null ||
                          controller.requestModel == null ||
                          controller.requestCatModel == null
                      ? loadingthreebounce
                      : ValueListenableBuilder(
                          valueListenable: postionNotifier,
                          builder: (context, value, child) => value
                              ? AddMaterial()
                              : SelectSupplear(
                                  onTap: () {
                                    postionNotifier.value = true;
                                    postionNotifier.notifyListeners();
                                  },
                                ));
                },
                init: PurchaseOrderController()),
          ],
        ),
      ),
    );
  }
}

class SelectSupplear extends StatelessWidget {
  SelectSupplear({super.key, required this.onTap});
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  void Function() onTap;
  final RxInt count = 0.obs;
  TextEditingController text = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    final RxBool iserror = false.obs;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Form(
        key: controller.k1key,
        child: Column(
          children: [
            h2,
            Obx(
              () => SearchField<Data>(
                searchStyle: header11,
                suggestionItemDecoration: BoxDecoration(
                  color: bColor2,
                ),
                suggestionStyle: header10,
                controller: controller.supplierController,
                // validator: (p0) {
                //   if (controller.supplierController.text.isEmpty) {
                //     return '';
                //   } else if (!controller.supplierList!.data!
                //       .any((e) => e.name.toString() == p0)) {
                //     return '';
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
                        e.name ?? "",
                        child: Text(
                          '  ${e.name.toString()}',
                          style: header11,
                        ),
                        item: e,
                      ),
                    )
                    .toList(),
                onSuggestionTap: (val) {
                  controller.supplierid = val.item!.id ?? "";
                },
                // suggestionItemDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.invoiceNumber,
                keyboard: TextInputType.name,
                label: "Invoice Number",
                icon: cImage(
                    "https://cdn-icons-png.flaticon.com/512/3862/3862809.png")),
            h3,
            NewCaseTextField(
                labelstyle: header11.copyWith(color: Colors.black45),
                mediaquery: MediaQuery.of(context).size,
                controller: controller.vechicleNumber,
                keyboard: TextInputType.name,
                label: "Vechicle Number",
                icon: const Icon(
                  Icons.car_repair,
                  color: Colors.black45,
                )),
            h3,
            // NewCaseTextField(
            //     labelstyle: header11.copyWith(color: Colors.black45),
            //     mediaquery: MediaQuery.of(context).size,
            //     controller: controller.vechicleNumber,
            //     keyboard: TextInputType.name,
            //     label: "Expceted Delivery Date",
            //     icon: const Icon(
            //       Icons.calendar_month_outlined,
            //       color: Colors.black45,
            //     )),

            InkWell(
              onTap: () {
                count.value++;
              },
              child: SizedBox(
                width: mediaquery.width,
                child: DateTimePickers(
                  firstdate: DateTime.now(), lastdate: DateTime(2100),
                  onChanged: (p0) {
                    controller.delivarydated = p0.toString();
                    // print(controller.delivarydate.toString());
                    controller.delivarydated = controller.date
                        .format(controller.Converterdate.parse(p0));
                    //  print("this is the date $datess");
                    // print(controller.date.format(controller.delivarydated.toString()).toString());
                  },
                  style: header11.copyWith(
                    color: Colors.black,
                  ),
                  label: "Expceted Delivery Date",
                  controller: count.value >= 0 ? text : controller.delivarydate,
                  labelStyle: header11.copyWith(
                    color: Colors.black45,
                  ),

                  //  header10.copyWith(
                  //     color: Colors.black87, fontFamily: light),
                ),
              ),
            ),
            h4,
            h3,
            SubmitButton(
                onTap: () {
                  if (controller.k1key.currentState!.validate() &&
                      controller.supplierController.text.isNotEmpty) {
                    onTap();
                    controller.supplierController.clear();
                    controller.invoiceNumber.clear();
                    controller.vechicleNumber.clear();
                    iserror.value = false;
                  }
                  iserror.value = true;
                },
                text: "Continue to Add Materials")
          ],
        ),
      ),
    );
  }
}

class AddMaterial extends StatelessWidget {
  AddMaterial({super.key});
  PurchaseOrderController controller = Get.put(PurchaseOrderController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        h2,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  addMaterials(context);
                },
                child: const AddRquestContainer(text: 'Add Single Material')),
            GestureDetector(
                onTap: () {
                  addCategoryDialogOrder(context);
                },
                child: const AddRquestContainer(text: 'Add From Category'))
          ],
        ),
        h2,
        Obx(() => controller.metrialList.isEmpty
            ? const SizedBox()
            : Container(
                height: 5.h,
                width: 100.w,
                color: bColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 6.8.w,
                    ),
                    Text('Material', style: wheader4.copyWith(fontSize: 11.sp)),
                    SizedBox(
                      width: 34.w,
                    ),
                    Text('Qty', style: wheader4.copyWith(fontSize: 11.sp)),
                    // Text('Material',
                    //     style: wheader4.copyWith(fontSize:11.sp,color: bColor)
                    // ),
                  ],
                ),
              )),
        Obx(() => ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(right: 2.w),
                  height: 7.h,
                  width: 100.w,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'https://cdn-icons-png.flaticon.com/512/4693/4693937.png',
                              height: 5.h,
                              width: 5.w,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  h1,
                                  h05,
                                  Text(
                                    controller.metrialList[index].name
                                        .toString(),
                                    style: header4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    controller.metrialList[index].qunit
                                        .toString(),
                                    style: header4.copyWith(fontFamily: Bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              controller.metrialList[index].qtext.toString(),
                              style: header4,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                ordereditDialog(
                                  context,
                                  index,
                                  controller.metrialList[index].name,
                                  controller.metrialList[index].qtext,
                                  controller
                                      .postemetrislList[index].description,
                                  () {},
                                );
                              },
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/1159/1159633.png',
                                height: 5.h,
                                width: 5.w,
                                //   color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Get.defaultDialog(
                                //   backgroundColor: Colors.white,
                                //   radius: 10, // Dialog border radius
                                //   title: 'Delete',
                                //   titlePadding: const EdgeInsets.all(16.0),
                                //   content: Column(
                                //     children: [
                                //       const Text(
                                //         'Are you sure you want to delete?',
                                //         textAlign: TextAlign.center,
                                //         style: TextStyle(color: Colors.black38),
                                //       ),
                                //       h5,
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceEvenly,
                                //         children: [
                                //           ElevatedButton(
                                //             onPressed: () {
                                //               Get.back();
                                //               controller.postemetrislList
                                //                   .removeAt(index);
                                //               controller.metrialList
                                //                   .removeAt(index);
                                //               // controller
                                //               //     .metrialList
                                //               //     .removeAt(
                                //               //         index);
                                //               // controller
                                //               //     .postemetrislList
                                //               //     .removeAt(
                                //               //         index);
                                //             },
                                //             child: const Text(
                                //               'Delete',
                                //               style:
                                //                   TextStyle(color: Colors.red),
                                //             ),
                                //             style: ButtonStyle(
                                //               elevation:
                                //                   const WidgetStatePropertyAll(0),
                                //               backgroundColor:
                                //                   WidgetStateProperty.all(
                                //                       Colors.white),
                                //               // foregroundColor:
                                //               //     WidgetStateProperty
                                //               //         .all(Colors
                                //               //             .white),
                                //               shape: WidgetStateProperty.all(
                                //                 RoundedRectangleBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           12), // Button border radius
                                //                 ),
                                //               ),
                                //               padding: WidgetStateProperty.all(
                                //                   const EdgeInsets.symmetric(
                                //                       horizontal: 20,
                                //                       vertical:
                                //                           12)), // Button padding
                                //             ),
                                //           ),
                                //           ElevatedButton(
                                //             onPressed: () {
                                //               Get.back(); // Close the dialog
                                //             },
                                //             child: const Text(
                                //               'Cancel',
                                //               style:
                                //                   TextStyle(color: Colors.grey),
                                //             ),
                                //             style: ButtonStyle(
                                //               elevation:
                                //                   const WidgetStatePropertyAll(0),
                                //               backgroundColor:
                                //                   WidgetStateProperty.all(
                                //                       Colors.white),
                                //               foregroundColor:
                                //                   WidgetStateProperty.all(
                                //                       Colors.white),
                                //               shape: WidgetStateProperty.all(
                                //                 RoundedRectangleBorder(
                                //                   borderRadius:
                                //                       BorderRadius.circular(
                                //                           12), // Button border radius
                                //                 ),
                                //               ),
                                //               padding: WidgetStateProperty.all(
                                //                   const EdgeInsets.symmetric(
                                //                       horizontal: 20,
                                //                       vertical:
                                //                           12)), // Button padding
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                //   barrierDismissible:
                                //       false, // Prevents closing the dialog by tapping outside
                                // );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return SizedBox(
                                          //  height:80.h,
                                          width: 100.w,
                                          child: SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              contentPadding: EdgeInsets.zero,
                                              titlePadding: EdgeInsets.zero,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.h,
                                                      horizontal: 2.h),
                                                  // height: 25.h,
                                                  width: 100.w,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      h1,
                                                      SvgPicture.asset(
                                                        "assets/images/delete.svg",
                                                        width: 5.w,
                                                        height: 5.h,
                                                      ),
                                                      h1,
                                                      Text(
                                                        "Warning",
                                                        style: header15,
                                                      ),
                                                      h1,
                                                      Text(
                                                        "Do you Want Delete?",
                                                        style: header10.copyWith(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                139, 131, 131)),
                                                      ),
                                                      const Divider(
                                                        thickness: 1,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  Get.back();
                                                                  controller
                                                                      .postemetrislList
                                                                      .removeAt(
                                                                          index);
                                                                  controller
                                                                      .metrialList
                                                                      .removeAt(
                                                                          index);
                                                                  // Get.back();
                                                                },
                                                                // child: Container(
                                                                //   height: 4.h,
                                                                //   width: 30.w,
                                                                //   decoration: BoxDecoration(
                                                                //       color: bColor,
                                                                //       borderRadius: BorderRadius.circular(13)),
                                                                child: Center(
                                                                    child: Text(
                                                                  'Yes',
                                                                  style: header12
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                )),
                                                                //  ),
                                                              ),
                                                            ),
                                                            const VerticalDivider(
                                                              color: Colors
                                                                  .black26,
                                                              endIndent: 5,
                                                              indent: 2,
                                                              thickness: 1,
                                                            ),
                                                            Expanded(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  return Get
                                                                      .back();
                                                                },
                                                                child: Center(
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    // child: Container(
                                                                    //   height: 4.h,
                                                                    //   width: 30.w,
                                                                    //   decoration: BoxDecoration(
                                                                    //       color: bColor,
                                                                    //       borderRadius: BorderRadius.circular(13)),
                                                                    //   child: Center(
                                                                    child: Text(
                                                                      'No',
                                                                      style: header12.copyWith(
                                                                          color:
                                                                              Colors.black),
                                                                      // )
                                                                      //),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        );
                                      });
                                    });
                              },
                              child: const Icon(
                                Icons.delete,
                              ),
                            )
                          ],
                        ),
                        //    Text('Item $item', style: textStyle),
                      ],
                    ),
                  ),
                ),
            // separatorBuilder: (context, index) => Divider(
            //       height: 0.1.h,
            //     ),
            itemCount: controller.metrialList.length)),
        h4,
        h2,
        h5,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Obx(() => controller.metrialList.isEmpty
              ? const SizedBox()
              : SubmitButtons(
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (controller.metrialList.isNotEmpty) {
                      controller
                          .createPurchaseRequest(controller.delivarydated);
                    }
                  },
                  text: "Submit")),
        )
      ],
    );
  }
}
