import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/notification/controllers/notification_controller.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';

class NotifcationtoPurchaseRequest extends GetView<NotificationController> {
  const NotifcationtoPurchaseRequest(this.work_id, {super.key});
  final work_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          h1,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => ProjectNameTitile(
                addbutton: const SizedBox(),
                projectName: controller.projectname.value == ""
                    ? null
                    : controller.projectname.value,
                screenTitile: "Purchase Request",
                onTap: () {},
              ),
            ),
          ),
          h3,
          Expanded(
            child: Container(
              child: GetBuilder<NotificationController>(
                builder: (controller) => Obx(
                  () => controller.notifiLoading.value
                      ? Center(child: loadingthreebounce)
                      : controller.notificationRequestModel == null
                          ? Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            )
                          : Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Request ID : ",
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: Medium),
                                      ),
                                      Text(
                                        controller
                                            .notificationRequestModel!.orderId,
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: regular),
                                      ),
                                    ],
                                  ),
                                ),
                                h1,
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Requested by : ",
                                        style: TextStyle(
                                            fontSize: 15, fontFamily: Medium),
                                      ),
                                      SizedBox(
                                        // color:
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        child: Text(
                                          controller.notificationRequestModel!
                                              .createdBy,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: regular),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                h2,
                                Container(
                                  height: 5.h,
                                  width: 100.w,
                                  color: bColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 6.8.w,
                                      ),
                                      Text('Material',
                                          style: wheader4.copyWith(
                                              fontSize: 11.sp)),
                                      SizedBox(
                                        width: 25.w,
                                      ),
                                      Text('Qty',
                                          style: wheader4.copyWith(
                                              fontSize: 11.sp)),
                                      // Text('Material',
                                      //     style: wheader4.copyWith(fontSize:11.sp,color: bColor)
                                      // ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text('Edit',
                                          style: wheader4.copyWith(
                                              fontSize: 11.sp)),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Obx(
                                    () => ListView.builder(
                                      itemCount: controller
                                          .purchaseiteams.value.length,
                                      itemBuilder: (context, index) {
                                        var details = controller
                                            .purchaseiteams.value[index];
                                        return Container(
                                          padding: EdgeInsets.only(right: 2.w),
                                          height: 7.h,
                                          width: 100.w,
                                          color: Colors.white,
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 6.8.w,
                                                    ),
                                                    // SizedBox(
                                                    //   width: 2.w,
                                                    // ),
                                                    SizedBox(
                                                      // color: Colors.amber,
                                                      width: 28.w,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          h1,
                                                          h05,
                                                          Text(
                                                            details.materialName
                                                                .toString(),
                                                            // "controller.metrialList[index].name.toString(),",
                                                            style: header4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          Text(
                                                            details.unitName
                                                                // "controller.metrialList[index].qunit"
                                                                .toString(),
                                                            style: header4
                                                                .copyWith(
                                                                    fontFamily:
                                                                        Bold),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                SizedBox(
                                                  // color: Colors.amber,
                                                  width: 19.w,
                                                  child: Center(
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,

                                                      details.quantity
                                                          .toString(),
                                                      // "controller.metrialList[index].qtext.toString(),",
                                                      style: header4,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Container(
                                                  // color: Colors.red,
                                                  // width: 19.w,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      editsMaterials(
                                                          context, details);
                                                      // ordereditDialog(
                                                      //   context,
                                                      //   index,
                                                      //   // controller.metrialList[index].name,
                                                      //   // controller.metrialList[index].qtext,
                                                      //   // controller.postemetrislList[index].description,
                                                      //   () {},
                                                      // );
                                                    },
                                                    child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/1159/1159633.png',
                                                      height: 5.h,
                                                      width: 5.w,
                                                      //   color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 11.w,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.defaultDialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 10,
                                                        title: "Description",
                                                        titleStyle: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: Medium),
                                                        content: Column(
                                                          children: [
                                                            TextField(
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      regular),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              readOnly: true,
                                                              minLines: 1,
                                                              maxLines: 20,
                                                              controller:
                                                                  TextEditingController(
                                                                text: details
                                                                    .description,
                                                              ),
                                                            ),
                                                            // Text(
                                                            //   textAlign:
                                                            //       TextAlign
                                                            //           .center,
                                                            //   "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of e Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc",
                                                            //   style:
                                                            //       TextStyle(
                                                            //     fontSize:
                                                            //         14,
                                                            //     fontFamily:
                                                            //         regular,
                                                            //   ),
                                                            // )
                                                          ],
                                                        ));
                                                  },
                                                  child: const Icon(
                                                    Icons.info_outline,
                                                  ),
                                                ),
                                                //    Text('Item $item', style: textStyle),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                h05,
                                Container(
                                  // height: 10.h,
                                  // color: Colors.amber,
                                  child: Row(
                                    children: [
                                      w1,
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 161, 4, 4),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () {
                                              controller.postpurcharapprovel(
                                                  controller
                                                      .notificationRequestModel!
                                                      .orderId,
                                                  "2",
                                                  work_id);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.5.h),
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: Medium,
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                      w1,
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 16, 118, 1),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                            onPressed: () {
                                              controller.postpurcharapprovel(
                                                  controller
                                                      .notificationRequestModel!
                                                      .orderId,
                                                  "1",
                                                  work_id);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.5.h),
                                              child: Text(
                                                "Approve",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: Medium,
                                                    color: Colors.white),
                                              ),
                                            )),
                                      ),
                                      w1,
                                    ],
                                  ),
                                ),
                                h1,
                                h05,
                              ],
                            ),
                ),
                init: NotificationController(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

editsMaterials(context, PurchaseRequestList details) {
  final GlobalKey<FormState> metrialKey = GlobalKey<FormState>();
  String metrialName = "";
  String metrialid = "";

  TextEditingController meterialControler = TextEditingController();
  TextEditingController quantityControllers =
      TextEditingController(text: details.quantity);
  TextEditingController descriptionControllers =
      TextEditingController(text: details.description);
  NotificationController controller = Get.put(NotificationController());
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
                            // height5,
                            Text(
                              'Select Material',
                              style: header4,
                            ),
                            // height3,
                            Obx(
                              () => SearchField(
                                readOnly: true,
                                controller: meterialControler =
                                    TextEditingController(
                                        text: details.materialName),
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
                                // suggestions: controller.requestCatModel!.data!
                                //     .map(
                                //       (e) => SearchFieldListItem(
                                //         e.categoryName.toString(),
                                //         child: Text(
                                //           "  ${e.categoryName.toString()}",
                                //           style: header11,
                                //         ),
                                //         item: e,
                                //       ),
                                //     )
                                //     .toList(),
                                suggestions: const [],
                                onSuggestionTap: (value) {
                                  // controller.quantitytype.value =
                                  //     value.item!.unitName!;
                                  // FocusScope.of(context).unfocus();
                                  // metrialName = value.item!.materialName!;
                                  // metrialid = value.item!.materialId!;
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
                                    onChanged: (value) {
                                      details.quantity = value.toString();
                                    },
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
                                // Obx(
                                //   () => ,
                                Text(
                                  details.unitName.toString(),
                                  // controller.quantitytype.value == null
                                  //     ? ""
                                  //     : controller.quantitytype.value
                                  //         .toString(),
                                  style: header4,
                                ),
                                // )
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
                              readOnly: true,
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
                                print(quantityControllers.text);
                                var index =
                                    controller.purchaseiteams.value.indexWhere(
                                  (element) =>
                                      element.material_id ==
                                      details.material_id,
                                );
                                controller.purchaseiteams.value[index]
                                    .quantity = quantityControllers.text;
                                controller.purchaseiteams.refresh();
                                Get.back();
                              },
                              child: Container(
                                height: 5.h,
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
                  ),
                ]),
          );
        });
      });
}
