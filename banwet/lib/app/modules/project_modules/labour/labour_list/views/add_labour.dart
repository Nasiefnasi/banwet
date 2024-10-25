import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';

import '../../../../../Style/const.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/labour_list_controller.dart';

class AddLobour extends StatelessWidget {
  AddLobour({super.key});
  LabourListController controller = Get.put(LabourListController());
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();

  String isFixed = "0";
  @override
  Widget build(BuildContext context) {
    RxBool iserror = false.obs;
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          elevation: 0,
          title: Text(
            "Add New Labour",
            style:
                header2.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder(
          builder: (controller) => controller.wageListModel == null
              ? Center(child: loadingthreebounce)
              : SingleChildScrollView(
                  //   keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: key1,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NewCaseTextField(
                              labelstyle:
                                  header11.copyWith(color: Colors.black38),
                              mediaquery: MediaQuery.of(context).size,
                              controller: controller.labourName,
                              keyboard: TextInputType.name,
                              label: "Labour Name",
                              icon: CachedNetworkImage(
                                imageUrl:
                                    "https://cdn-icons-png.flaticon.com/512/3716/3716527.png",
                                color: Colors.black,
                                height: 3.h,
                                width: 9.w,
                                placeholder: (context, url) => const SizedBox(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )),
                          h3,
                          Container(
                            constraints: const BoxConstraints(maxHeight: 63),
                            child: Obx(
                              () => SearchField(
                                suggestionItemDecoration:
                                    BoxDecoration(color: bColor2),
                                // validator: Validators.noneEmptyValidator,
                                controller: controller.workType,
                                suggestionStyle: header10.copyWith(
                                    color: Colors.black87, fontFamily: light),
                                searchInputDecoration: InputDecoration(
                                  labelText: 'Select Work Type',
                                  labelStyle:
                                      header11.copyWith(color: Colors.black38),
                                  suffixIcon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  icon: cImage(
                                      "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: iserror.value != false
                                            ? Colors.red
                                            : Colors.black26,
                                        width: 1.0),
                                  ),
                                ),
                                suggestions:
                                    controller.wageListModel!.workTypes!
                                        .map(
                                          (e) => SearchFieldListItem(
                                            e.typeName.toString(),
                                            child: Text(
                                              "  ${e.typeName}",
                                              style: header10,
                                            ),
                                            item: e.typeId,
                                          ),
                                        )
                                        .toList(),
                                onSuggestionTap: (value) {
                                  controller.wageType.text =
                                      value.item.toString();
                                  // type = value.item;
                                  // print(_workType.text);
                                  // print(type);
                                },
                              ),
                            ),
                          ),
                          h3,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: NewCaseTextField(
                                        labelstyle: header11.copyWith(
                                            color: Colors.black38),
                                        mediaquery: MediaQuery.of(context).size,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            // return 'Please enter an email address';
                                            return "";
                                          }
                                          return null;
                                        },

                                        // prefix: "+91",
                                        controller: controller.contactNumber,
                                        keyboard: TextInputType.number,
                                        label: "Contact No",
                                        icon: cImage(
                                            "https://cdn-icons-png.flaticon.com/512/657/657099.png")),
                                  ),
                                  Expanded(
                                    child: NewCaseTextField(
                                      labelstyle: header11.copyWith(
                                          color: Colors.black38),
                                      mediaquery: MediaQuery.of(context).size,
                                      // prefix: "+91",
                                      controller: controller.alternativeNumber,
                                      keyboard: TextInputType.number,
                                      label: "Alternate Contact",
                                      icon: CachedNetworkImage(
                                        imageUrl:
                                            "https://cdn-icons-png.flaticon.com/512/953/953831.png",
                                        color: Colors.black54,
                                        height: 3.h,
                                        width: 9.w,
                                        placeholder: (context, url) =>
                                            const SizedBox(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  w4
                                ],
                              ),
                            ),
                          ),
                          h3,
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: NewCaseTextField(
                                labelstyle:
                                    header11.copyWith(color: Colors.black38),
                                mediaquery: MediaQuery.of(context).size,
                                //    validator: Validators.noneEmptyValidator,
                                controller: controller.aadharNumber,
                                keyboard: TextInputType.number,
                                label: 'Aadhar Number',
                                icon: CachedNetworkImage(
                                  imageUrl:
                                      "https://cdn-icons-png.flaticon.com/512/3716/3716527.png",
                                  color: Colors.black26,
                                  height: 3.h,
                                  width: 9.w,
                                  placeholder: (context, url) =>
                                      const SizedBox(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )),
                          ),
                          h3,
                          NewCaseTextField(
                              labelstyle:
                                  header11.copyWith(color: Colors.black38),
                              mediaquery: MediaQuery.of(context).size,
                              //      validator: Validators.noneEmptyValidator,

                              // prefix: "+91",
                              controller: controller.address,
                              keyboard: TextInputType.name,
                              label: "Address",
                              icon: cImage(
                                  "https://cdn-icons-png.flaticon.com/512/5654/5654521.png")),
                          h3,
                          NewCaseTextField(
                              labelstyle:
                                  header11.copyWith(color: Colors.black45),
                              mediaquery: MediaQuery.of(context).size,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return 'Please enter an email address';
                                  return "";
                                }
                                return null;
                              },
                              controller: controller.balance,
                              keyboard: TextInputType.number,
                              label: "Opening/Old Balance",
                              icon: cImage(
                                  "https://cdn-icons-png.flaticon.com/512/1642/1642128.png")),
                          h3,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SearchField(
                                  suggestionItemDecoration:
                                      BoxDecoration(color: bColor2),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      // return 'Please enter an email address';
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: controller.fixedwage,
                                  suggestionStyle: header4,
                                  searchInputDecoration: InputDecoration(
                                    labelText: 'Wage',
                                    labelStyle: header11.copyWith(
                                      color: Colors.black38,
                                    ),
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    icon: billPayableAmt(),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1.0),
                                    ),
                                  ),
                                  suggestions: controller.item
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e.toString(),
                                          child: Text("  $e"),
                                          item: e,
                                        ),
                                      )
                                      .toList(),
                                  onSuggestionTap: (value) {
                                    if (value.item == 'Fixed') {
                                      isFixed = 1.toString();
                                    } else {
                                      isFixed = 0.toString();
                                    }
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: NewCaseTextField(
                                      labelstyle: header11.copyWith(
                                          color: Colors.black38),
                                      mediaquery: MediaQuery.of(context).size,
                                      controller: controller.wageperday,
                                      keyboard: TextInputType.number,
                                      label: 'Wage per day',
                                      icon: billPayableAmt()),
                                ),
                              )
                            ],
                          ),
                          h3,
                          Row(
                            children: [
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black45),
                                    mediaquery: MediaQuery.of(context).size,
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     // return 'Please enter an email address';
                                    //     return "";
                                    //   }
                                    //   return null;
                                    // },
                                    // prefix: "+91",
                                    controller: controller.wageRate,
                                    keyboard: TextInputType.number,
                                    label: 'Overtime Rate/Hr',
                                    icon: billPayableAmt()),
                              ),
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black45),
                                    mediaquery: MediaQuery.of(context).size,
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     // return 'Please enter an email address';
                                    //     return "";
                                    //   }
                                    //   return null;
                                    // },
                                    // prefix: "+91",
                                    controller: controller.ta,
                                    keyboard: TextInputType.number,
                                    label: 'TA/Day',
                                    icon: cImage(
                                        "https://cdn-icons-png.flaticon.com/512/3772/3772696.png")),
                              )
                            ],
                          ),
                          h6,
                          SubmitButtons(
                              isLoading: controller.isLoading,
                              onTap: () {
                                if (key1.currentState!.validate() &&
                                    controller.workType.text.isNotEmpty) {
                                  iserror.value = false;
                                  log("message");
                                  controller.addLabour(isFixed);
                                }
                                iserror.value = true;
                              },
                              text: "Submit"),
                          h1,
                        ],
                      ),
                    ),
                  ),
                ),
          init: LabourListController(),
        ));
  }
}
