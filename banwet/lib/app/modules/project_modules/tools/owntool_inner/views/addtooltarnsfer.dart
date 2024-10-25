import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/modules/office_expense/views/component/showDialog.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/project_modules/tools/own_tools/controllers/own_tools_controller.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/owntool_inner_controller.dart';

class AddToolTransfer extends GetView<OwntoolInnerController> {
  AddToolTransfer({super.key, this.tooltransfer, this.tooltype});
  dynamic tooltransfer = '';
  String? tooltype = "";
  @override
  OwntoolInnerController controller = Get.put(OwntoolInnerController());
  OwnToolsController controller1 = Get.put(OwnToolsController());
  OwntoolInnerController controller3 = Get.find<OwntoolInnerController>();
  @override
  Widget build(BuildContext context) {
    FocusNode tooltypeFocusNode = FocusNode();
    FocusNode selecttoolFocusNode = FocusNode();
    FocusNode fromFocusNode = FocusNode();
    FocusNode toFocusNode = FocusNode();
    // RxString addfile = 'TransferIn'.obs;

    RxDouble qut = 0.0.obs;
    RxBool iserror = false.obs;
    List<dynamic> name = [
      'TransferIn',
      'TransferOut',
      'Rented in',
    ];

    var mediqurey = MediaQuery.of(context).size;
    if (tooltransfer == "tooltransfer") {
      if (controller1.addtooltransfer.value.isNotEmpty) {
        controller.toolName.text = controller1.addtooltransfer.value.first.name;
      } else {
        controller.toolName.text = "";
      }
    } else {
      controller.toolName.text = controller.argumnetData["toolname"];
    }
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SubmitButtons(
            isLoading: controller.addtoolloading,
            onTap: () {
              if (controller.key.currentState!.validate()) {
                if (controller.addfileerrorfinder.value == 'Rented in') {
                  iserror.value = false;
                  controller.addOwntoolrentedin(
                    controller.argumnetData["toolid"].toString(),
                  );
                } else if (controller.addfileerrorfinder.value ==
                        'TransferIn' ||
                    controller.addfileerrorfinder.value == 'TransferOut') {
                  iserror.value = false;
                  controller.addOwntoolTransfer(
                    controller.argumnetData["toolid"].toString(),
                  );
                } else {
                  iserror.value = true;
                }
              } else {
                iserror.value = true;
              }
              // iserror.value = true;
            },
            text: "Submit"),
      ),
      body: GetBuilder<OwntoolInnerController>(
        builder: (controller) => SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: controller.key,
              child: Column(
                children: [
                  Container(
                    // height: mediaquery.height * .2,
                    width: double.infinity,
                    color: bColor,
                    child: Column(
                      children: [
                        h1,
                        // Obx(
                        //   () => ;
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: ProjectNameTitile(
                              lefticon: Colors.white,
                              projectcolor: Colors.white,
                              titlecolors: Colors.white,
                              addbutton: const SizedBox(),
                              projectName: tooltransfer == "tooltransfer"
                                  ? controller.argumnetData["workname"]
                                      .toString()
                                  : controller.argumnetData["workname"],
                              screenTitile: "Add Transfer",
                              // screenTitile: tooltransfer != "tooltransfer"
                              //     ? "Add ${controller.argumnetData["toolname"] ?? "Tools"}"
                              //     : controller1.addtooltransfer.value.length ==
                              //             0
                              //         ? "Add Tools"
                              //         : controller1
                              //             .addtooltransfer.value.first.name
                              //             .toString(),
                              onTap: () {}),
                        ),
                        // ),
                        h3,
                        tooltransfer == "tooltransfer"
                            ? Obx(() =>
                                controller1.addtooltransfer.value.isNotEmpty
                                    ? SizedBox(
                                        height: mediqurey.height * .06,
                                        // color: Colors.white,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            w1,
                                            iteams(
                                                "Office",
                                                controller1
                                                        .addtooltransfer
                                                        .value
                                                        .first
                                                        .totalatoffice ??
                                                    0),
                                            const VerticalDivider(
                                              endIndent: 1,
                                              indent: 10,
                                            ),
                                            iteams(
                                                "Worksite",
                                                controller1
                                                        .addtooltransfer
                                                        .value
                                                        .first
                                                        .totalatsite ??
                                                    0),
                                            const VerticalDivider(
                                              endIndent: 1,
                                              indent: 10,
                                            ),
                                            iteams(
                                                "Other Worksite",
                                                controller1
                                                        .addtooltransfer
                                                        .value
                                                        .first
                                                        .total_at_other_sites ??
                                                    0),
                                            const VerticalDivider(
                                              endIndent: 1,
                                              indent: 10,
                                            ),
                                            iteams(
                                                "Rentals",
                                                controller1
                                                        .addtooltransfer
                                                        .value
                                                        .first
                                                        .totalrentedatsite ??
                                                    0),
                                            w1,
                                          ],
                                        ),
                                      )
                                    : const SizedBox())
                            : SizedBox(
                                height: mediqurey.height * .06,
                                // color: Colors.white,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    w1,
                                    iteams(
                                        "Office", controller.officecount.value),
                                    const VerticalDivider(
                                        endIndent: 1, indent: 10),
                                    iteams("Worksite",
                                        controller.worksitecount.value),
                                    const VerticalDivider(
                                        endIndent: 1, indent: 10),
                                    iteams("Other Worksite",
                                        controller.otherworksitecount.value),
                                    const VerticalDivider(
                                        endIndent: 1, indent: 10),
                                    iteams("Rentals",
                                        controller.rentalscount.value),
                                    // w1,
                                    // iteams("Office",
                                    //     controller.argumnetData["Office"]),
                                    // const VerticalDivider(
                                    //   endIndent: 1,
                                    //   indent: 10,
                                    // ),
                                    // iteams("Worksite",
                                    //     controller.argumnetData["Worksite"]),
                                    // const VerticalDivider(
                                    //   endIndent: 1,
                                    //   indent: 10,
                                    // ),
                                    // iteams(
                                    //     "Other Worksite",
                                    //     controller
                                    //         .argumnetData["Other Worksite"]),
                                    // const VerticalDivider(
                                    //   endIndent: 1,
                                    //   indent: 10,
                                    // ),
                                    // iteams("Rentals",
                                    //     controller.argumnetData["Rentals"]),
                                    w1,
                                  ],
                                ),
                              ),
                        h3,
                      ],
                    ),
                  ),
                  h2,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Obx(
                      () => SearchField(
                        focusNode: tooltypeFocusNode,
                        searchStyle: header11.copyWith(
                          color: Colors.black,
                        ),
                        suggestionStyle: header11,
                        suggestionItemDecoration: BoxDecoration(color: bColor2),
                        controller: controller.selectaddform,
                        validator: Validators.noneEmptyValidator,
                        searchInputDecoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelText: "Tool Type",
                          labelStyle: header11.copyWith(color: Colors.black54),
                          suffixIcon: const Icon(Icons.arrow_drop_down,
                              color: Colors.grey),
                          icon: SizedBox(
                            // height: 30,
                            width: 25,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                              color: Colors.black45,
                              height: 3.h,
                              width: 7.w,
                              placeholder: (context, url) => const SizedBox(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: iserror.value == true
                                    ? Colors.red
                                    : Colors.black26,
                                width: 1.0),
                          ),
                        ),
                        suggestions: name
                            .map(
                              (e) => SearchFieldListItem(e, item: e.toString()),
                            )
                            .toList(),
                        onSuggestionTap: (value) {
                          controller.clearss();
                          if (tooltransfer != "tooltransfer") {
                            controller.toolName.text =
                                controller.argumnetData["toolname"];
                          }

                          // FocusScope.of(context).unfocus();
                          print(value.item);
                          controller.addfileerrorfinder.value =
                              value.item.toString();
                          controller.addfile.value = value.item.toString();
                          controller.from.text = controller.addfile.value !=
                                  'TransferIn'
                              ? controller.argumnetData["workname"].toString()
                              : controller.from.text;
                          if (value.item == "TransferOut") {
                            controller.availableqty.value = controller
                                .toolDetailsModel2!.data.totalQtyRemains;
                          } else if (controller.addfile.value == 'Rented in') {
                            controller.from.clear();
                          }
                        },
                      ),
                    ),
                  ),
                  h1,
                  tooltransfer == "tooltransfer"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SearchField(
                            focusNode: selecttoolFocusNode,
                            searchStyle: header11.copyWith(
                              color: Colors.black,
                            ),
                            suggestionStyle: header11,
                            suggestionItemDecoration:
                                BoxDecoration(color: bColor2),
                            validator: Validators.noneEmptyValidator,
                            searchInputDecoration: InputDecoration(
                              labelText: "Select Tool",
                              labelStyle:
                                  header10.copyWith(color: Colors.black54),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              icon: SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset(
                                    "assets/images/clarity_tools-line.png"),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26, width: 1.0),
                              ),
                            ),
                            suggestions: controller1.toolsHomeModel!.data!
                                .map(
                                  (e) => SearchFieldListItem(
                                    e.name.toString(),
                                    item: e,
                                    child: Text(e.name.toString()),
                                  ),
                                )
                                .toList(),
                            onSuggestionTap: (value) {
                              var selectiteam = value.item;
                              controller1.addtooltransfer.value.clear();
                              if (!controller1.addtooltransfer.value
                                  .contains(value.item)) {
                                controller.update();
                                controller1.addtooltransfer.value
                                    .add(selectiteam!);

                                controller.toolName.text = controller1
                                    .addtooltransfer.value.first.name
                                    .toString();
                                controller.getDtetails(
                                  controller.argumnetData["workid"],
                                  controller1
                                      .addtooltransfer.value.first.toolId,
                                );

                                controller1.addtooltransfer.refresh();
                                controller.update();
                                print(controller1
                                    .addtooltransfer.value.first.categoryName);
                              } else {
                                // Optionally show a message or feedback that the item is already added
                                print('Item already added');
                              }

                              // Refresh the dropdown by refocusing on the field
                              Future.delayed(const Duration(milliseconds: 300),
                                  () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode()); // Remove focus
                                FocusScope.of(context).requestFocus(
                                    FocusNode()); // Request focus again
                              });
                            },
                          ),
                        )
                      : const SizedBox(),

                  h2,
                  tooltransfer == "tooltransfer"
                      ? const SizedBox()
                      // : Obx(() {
                      //     return controller.addfile.value == 'TransferIn'
                      //         ? ,
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: NewCaseTextField(
                            labelstyle: header11.copyWith(
                              color: Colors.black38,
                            ),
                            mediaquery: MediaQuery.of(context).size,
                            // readOnly: true,
                            validator: Validators.noneEmptyValidator,
                            controller: controller.toolName,
                            keyboard: TextInputType.none,
                            label: "Tool Name",
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: SizedBox(
                                  // color: Colors.amber,
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      "assets/images/iconoir_tools.png")),
                            ),
                          ),
                        ),
                  //       : const SizedBox();
                  // }),
                  h2,

                  controller.toolDetailsModel2 != null
                      ? Obx(
                          () => controller.addfile.value == 'Rented in'
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: NewCaseTextField(
                                    // readOnly: true,
                                    labelstyle: header11.copyWith(
                                      color: Colors.black54,
                                    ),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: Validators.noneEmptyValidator,
                                    controller: controller.from,
                                    keyboard: TextInputType.text,
                                    label: 'From',
                                    icon: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                        "assets/images/carbon_location.png",
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                )
                              : Obx(() {
                                  controller.from.text =
                                      controller.addfile.value != 'TransferIn'
                                          ? controller.argumnetData["workname"]
                                              .toString()
                                          : controller.from.text;

                                  return controller.addfile.value ==
                                          'TransferIn'
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: SearchField(
                                            focusNode: fromFocusNode,
                                            searchStyle: header11.copyWith(
                                              color: Colors.black,
                                            ),
                                            suggestionStyle: header11,
                                            suggestionItemDecoration:
                                                BoxDecoration(color: bColor2),
                                            controller: controller.from,
                                            validator:
                                                Validators.noneEmptyValidator,
                                            searchInputDecoration:
                                                InputDecoration(
                                              labelText: 'From',
                                              labelStyle: header10.copyWith(
                                                  color: Colors.black54),
                                              suffixIcon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey),
                                              icon: SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: Image.asset(
                                                  "assets/images/carbon_location.png",
                                                  color: Colors.black38,
                                                ),
                                              ),
                                              enabledBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black26,
                                                    width: 1.0),
                                              ),
                                            ),
                                            suggestions: controller
                                                .toolDetailsModel2!
                                                .data
                                                .availableLocations
                                                .map(
                                                  (e) => SearchFieldListItem(
                                                      e.name.toString(),
                                                      child: Text(
                                                        '  ${e.name.toString()}',
                                                        style: header11,
                                                      ),
                                                      item: e),
                                                )
                                                .toList(),
                                            onSuggestionTap: (value) {
                                              controller.from.text =
                                                  value.item!.name;
                                              controller.availableqty.value =
                                                  value.item!.availableQty;
                                              FocusScope.of(context).unfocus();
                                            },
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: NewCaseTextField(
                                            readOnly: true,
                                            labelstyle: header11.copyWith(
                                              color: Colors.black54,
                                            ),
                                            mediaquery:
                                                MediaQuery.of(context).size,
                                            validator:
                                                Validators.noneEmptyValidator,
                                            controller: controller.from,
                                            keyboard: TextInputType.text,
                                            label: 'From',
                                            icon: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: Image.asset(
                                                "assets/images/carbon_location.png",
                                                color: Colors.black38,
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                        )
                      : const SizedBox(),
                  h2,
                  controller.toolDetailsModel2 != null
                      ? Obx(() {
                          controller.to.text = controller.addfile.value ==
                                  'TransferIn'
                              ? controller.argumnetData["workname"].toString()
                              : controller.to.text;
                          controller.to.text = controller.addfile.value ==
                                  'Rented in'
                              ? controller.argumnetData["workname"].toString()
                              : controller.to.text;
                          return controller.addfile.value != 'TransferIn'
                              ? controller.addfile.value == 'Rented in'
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: NewCaseTextField(
                                        readOnly: true,
                                        labelstyle: header11.copyWith(
                                          color: Colors.black54,
                                        ),
                                        mediaquery: MediaQuery.of(context).size,
                                        validator:
                                            Validators.noneEmptyValidator,
                                        controller: controller.to,
                                        keyboard: TextInputType.text,
                                        label: 'To',
                                        icon: SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: cImage(
                                              'https://cdn-icons-png.flaticon.com/512/503/503054.png',
                                            )),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: SearchField(
                                        focusNode: toFocusNode,
                                        searchStyle: header11.copyWith(
                                          color: Colors.black,
                                        ),
                                        suggestionStyle: header11,
                                        suggestionItemDecoration:
                                            BoxDecoration(color: bColor2),
                                        controller: controller.to,
                                        validator:
                                            Validators.noneEmptyValidator,
                                        searchInputDecoration: InputDecoration(
                                          labelText: 'To',
                                          labelStyle: header10.copyWith(
                                              color: Colors.black54),
                                          suffixIcon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey),
                                          icon: SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: cImage(
                                              'https://cdn-icons-png.flaticon.com/512/503/503054.png',
                                            ),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                        ),
                                        suggestions: controller
                                            .toolDetailsModel2!
                                            .data
                                            .availableLocations
                                            .map(
                                              (e) => SearchFieldListItem(
                                                  e.name.toString(),
                                                  child: Text(
                                                    '  ${e.name.toString()}',
                                                    style: header11,
                                                  ),
                                                  item: e),
                                            )
                                            .toList(),
                                        onSuggestionTap: (value) {
                                          FocusScope.of(context).unfocus();
                                        },
                                      ),
                                    )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: NewCaseTextField(
                                    readOnly: true,
                                    labelstyle: header11.copyWith(
                                      color: Colors.black54,
                                    ),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: Validators.noneEmptyValidator,
                                    controller: controller.to,
                                    keyboard: TextInputType.text,
                                    label: 'To',
                                    icon: SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: cImage(
                                          'https://cdn-icons-png.flaticon.com/512/503/503054.png',
                                        )),
                                  ),
                                );
                        })
                      : const SizedBox(),
                  h3,

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      // height: 70,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          Expanded(
                            child: NewCaseTextField(
                              onChanged: (p0) {
                                if (controller.addfile.value == 'Rented in') {
                                  // if (controller
                                  //     .transferQunatity.text.isNotEmpty) {
                                  //   if (int.parse(p0) <=
                                  //           controller.availableqty.value &&
                                  //       p0 != "") {
                                  //   } else {
                                  //     controller.transferQunatity.clear();
                                  //     warningDialogue(context);
                                  //   }
                                  // }
                                } else {
                                  if (controller
                                      .transferQunatity.text.isNotEmpty) {
                                    if (int.parse(p0) <=
                                            controller.availableqty.value &&
                                        p0 != "") {
                                    } else {
                                      controller.transferQunatity.clear();
                                      warningDialoguetooltransfer(context);
                                    }
                                  }
                                }

                                // if (controller
                                //     .transferQunatity.text.isNotEmpty) {
                                //   if (double.parse(p0) <= controller.s.value &&
                                //       p0 != "") {
                                //     controller.payableAmount.value =
                                //         double.parse(p0);

                                //     // controller.calculateBalanceNumber();
                                //   } else {
                                //     // controller.payableAmount.value = 0.0;
                                //     // controller.paidAmount.clear();
                                //     warningDialogue(context);
                                //     // controller.calculateBalanceNumber();
                                //   }
                                // } else {
                                //   // controller.payableAmount.value = 0.0;
                                //   // controller.calculateBalanceNumber();
                                // }
                              },
                              labelstyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              mediaquery: MediaQuery.of(context).size,
                              validator: Validators.noneEmptyValidator,
                              controller: controller.transferQunatity,
                              keyboard: TextInputType.number,
                              label: 'Transfer Quantity',
                              icon: const ImageIcon(
                                AssetImage(
                                  "assets/images/quantity1.png",
                                ),
                                color: Colors.black38,
                              ),
                            ),
                          ),
                          Obx(
                            () => controller.addfile.value == 'Rented in'
                                ? Expanded(
                                    child: NewCaseTextField(
                                        labelstyle: header11.copyWith(
                                          color: Colors.black54,
                                        ),
                                        mediaquery: MediaQuery.of(context).size,
                                        validator: controller.addfile.value ==
                                                'Rented in'
                                            ? Validators.noneEmptyValidator
                                            : null,
                                        controller: controller.priceperday,
                                        keyboard: TextInputType.number,
                                        label: 'Price Per Day',
                                        icon: paidAmount()
                                        // .SizedBox(
                                        //   height: 25,
                                        //   child: Image.asset(
                                        //     "assets/images/ic_outline-price-change.png",
                                        //     color: Colors.black38,
                                        //   ),
                                        // ),
                                        ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                  h3,
                  // NewCaseTextField(
                  //     labelstyle: header11.copyWith(
                  //       color: Colors.black54,
                  //     ),
                  //     mediaquery: MediaQuery.of(context).size,
                  //     validator: Validators.noneEmptyValidator,
                  //     controller: controller.transferQunatity,
                  //     keyboard: TextInputType.number,
                  //     label: 'Transfer Quantity',
                  //     icon: const Icon(Icons.sticky_note_2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: mediqurey.height * .09,
                      // color: Colors.amber,
                      child: Obx(
                        () => DateTimePickers(
                          bodercolor: iserror.value == true
                              ? Colors.red
                              : Colors.black26,
                          color: Colors.black26,
                          style: header11,
                          labelStyle: header11.copyWith(
                            color: Colors.black38,
                          ),
                          controller: controller.transferDate,
                          validator: Validators.noneEmptyValidator,
                          label: " Transfer Date",
                        ),
                      ),
                    ),
                  ),
                  //     ],
                  //   ),
                  // ),
                  h3,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: NewCaseTextField(
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      // validator: Validators.noneEmptyValidator,
                      controller: controller.remarks,
                      keyboard: TextInputType.text,
                      label: "Remarks",
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: SizedBox(
                            height: 25,
                            // width: 22,
                            child:
                                Image.asset("assets/images/Description.png")),
                      ),
                    ),
                  ),
                  h3,
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: SubmitButton(
                  //       onTap: () {
                  //         if (controller.key.currentState!.validate()) {
                  //           controller.addOwntoolTransfer(
                  //             controller.argumnetData["toolid"],
                  //           );
                  //         }
                  //       },
                  //       text: "Submit"),
                  // )
                ],
              ),
            ),
          ),
        ),
        init: OwntoolInnerController(),
      ),
    );
  }

  iteams(title, amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              TextStyle(fontFamily: Medium, fontSize: 12, color: Colors.white),
        ),
        h03,
        Text(
          amount.toString(),
          style:
              TextStyle(fontFamily: Medium, fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final controller = Get.put(OwntoolInnerController());

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              horizontalTitleGap: 0,
              title: const Text('Transfer In'),
              leading: Radio(
                value: true,
                groupValue: controller.isOption1Selected.value,
                onChanged: (value) {
                  controller.selectOption1();
                },
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              title: const Text('Transfer Out'),
              leading: Radio(
                value: false,
                groupValue: controller.isOption1Selected.value,
                onChanged: (value) {
                  controller.selectOption2();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
