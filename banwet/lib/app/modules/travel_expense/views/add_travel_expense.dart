import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../Style/const.dart';
import '../../daily_note/views/add_dailynote.dart';
import '../controllers/travel_expense_controller.dart';

class AddTravelExpense extends StatelessWidget {
  AddTravelExpense({super.key});
  TravelExpenseController controller = Get.put(TravelExpenseController());

  @override
  Widget build(BuildContext context) {
    final RxBool iserror = false.obs;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: bColor), // Change to your desired color
    );
    return Scaffold(
      // backgroundColor: bColor,
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        title: Text(
          "Add Travel Expense",
          style: header15,
        ),
        leading: IconButton(
            onPressed: () {
              controller.clear();

              Get.back();
              controller.clear();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: GetBuilder<TravelExpenseController>(
          builder: (controller) => controller.travelHeadModel == null
              ? Center(child: loadingthreebounce)
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Form(
                    key: controller.key,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        children: <Widget>[
                          h3,
                          Obx(() => _vehicleType(iserror)),
                          h4,
                          Row(
                            children: [
                              Expanded(
                                child: NewCaseTextField(
                                    // style: header11,
                                    labelstyle: header11.copyWith(
                                        color: Colors.black45),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    controller: controller.fromCtrl,
                                    keyboard: TextInputType.name,
                                    label: "From",
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    )),
                              ),
                              Expanded(
                                child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                        color: Colors.black45),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: Validators.noneEmptyValidator,
                                    controller: controller.toCtrl,
                                    keyboard: TextInputType.name,
                                    label: "To",
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    )),
                              ),
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
                                    onChanged: (a) async {
                                      if (a.isNotEmpty) {
                                        // if (controller.isfiexd.value == 1 ) {
                                        // If the string starts with a dot, add a leading zero before parsing
                                        // ignore: await_only_futures
                                        var b = await '0${a.trim()}';
                                        controller.distance = double.parse(b);
                                        controller.calculateAmount();
                                        // }
                                      }
                                    },
                                    validator: Validators.noneEmptyValidator,
                                    controller: controller.distanseCtrl,
                                    keyboard: TextInputType.number,
                                    label: 'Distance[km]',
                                    icon: cImage(
                                      'https://cdn-icons-png.flaticon.com/512/503/503054.png',
                                    )),
                              ),
                              Expanded(
                                  child: Obx(
                                () => NewCaseTextField(
                                  labelstyle:
                                      header11.copyWith(color: Colors.black45),
                                  mediaquery: MediaQuery.of(context).size,
                                  readOnly: controller.isfiexd.value == 1
                                      ? true
                                      : false,
                                  validator: Validators.noneEmptyValidator,
                                  controller: controller.amtCtrl,
                                  keyboard: TextInputType.number,
                                  label: "Amount",
                                  icon: billPayableAmt(),
                                ),
                              )),
                            ],
                          ),
                          h3,
                          NewCaseTextField(
                              labelstyle:
                                  header11.copyWith(color: Colors.black45),
                              mediaquery: MediaQuery.of(context).size,
                              controller: controller.remarks,
                              keyboard: TextInputType.name,
                              label: 'Remarks',
                              icon: billRemarks()),
                          h5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Obx(
                                () => controller.fileValue.value == 1
                                    ? Container(
                                        height: 10.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.file(
                                              File(
                                                controller.pic!.path,
                                              ),
                                              fit: BoxFit.contain,
                                            )),
                                      )
                                    : ImageUploadContainer(
                                        bordercolor: iserror.value != false
                                            ? Colors.redAccent
                                            : Colors.black26.withOpacity(0.1),
                                        text: "Upload Start Reading photo",
                                        onTap: () {
                                          Get.bottomSheet(uploadBill(
                                            onTapCamera: () {
                                              controller.pickImage(
                                                  ImageSource.camera);
                                              Get.back();
                                            },
                                            onTapGAllery: () {
                                              controller.pickImage(
                                                  ImageSource.gallery);
                                              Get.back();
                                            },
                                          ));
                                        },
                                      ),
                              ),
                              // w05,
                              // Obx(
                              //   () => controller.fileValue2.value == 1
                              //       ? Container(
                              //           height: 10.h,
                              //           width: double.infinity,
                              //           decoration: BoxDecoration(
                              //               borderRadius:
                              //                   BorderRadius.circular(20)),
                              //           child: ClipRRect(
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //               child: Image.file(
                              //                 File(
                              //                   controller.pic2!.path,
                              //                 ),
                              //                 fit: BoxFit.contain,
                              //               )),
                              //         )
                              //       : ImageUploadContainer(
                              //           bordercolor:
                              //               Colors.black26.withOpacity(0.1),
                              //           // bordercolor:
                              //           //     Colors.black26.withOpacity(0.1),
                              //           text: "Upload end Reading photo",
                              //           onTap: () {
                              //             Get.bottomSheet(uploadBill(
                              //               onTapCamera: () {
                              //                 controller.pickImage2(
                              //                     ImageSource.camera);
                              //                 Get.back();
                              //               },
                              //               onTapGAllery: () {
                              //                 controller.pickImage2(
                              //                     ImageSource.gallery);
                              //                 Get.back();
                              //               },
                              //             ));
                              //           },
                              //         ),
                              // ),
                            ],
                          ),
                          h2,
                          Obx(() {
                            return controller.fileValue.value == 1 ||
                                    controller.fileValue2.value == 1
                                ? GestureDetector(
                                    onTap: () {
                                      controller.fileValue.value = 0;
                                      controller.pic = null;
                                      controller.fileValue2.value = 0;
                                      controller.pic2 = null;
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      width: 36.w,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: bColor),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Remove Photo",
                                            style: wheader9,
                                          ),
                                        ],
                                      )),
                                    ),
                                  )
                                : const SizedBox();
                          }),
                          h6,
                          SubmitButtons(
                            isLoading: controller.isLoading,
                            text: "Submit",
                            onTap: () {
                              if (controller.key.currentState!.validate() &&
                                  controller.vehicleTypeCtrle.text.isNotEmpty &&
                                  controller.pic != null) {
                                iserror.value = false;

                                controller.addTravelAlevences();
                              } else {
                                iserror.value = true;
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  SearchField _vehicleType(RxBool iserror) {
    return SearchField(
      searchStyle: header11.copyWith(fontSize: 13.sp),
      suggestionItemDecoration: BoxDecoration(
        color: bColor2,
      ),
      suggestionStyle: header11,
      controller: controller.vehicleTypeCtrle,
      // validator: (value) {
      //   if (controller.vehicleTypeCtrle.text.isEmpty) {
      //     return "";
      //   } else if (!controller.travelHeadModel!.taVehicleType!
      //       .any((e) => e.type.toString() == value)) {
      //     return "";
      //   } else {
      //     return null; // No error
      //   }
      // },
      searchInputDecoration: InputDecoration(
        labelText: 'Vehicle',
        labelStyle: header11.copyWith(
          color: Colors.black54,
        ),
        suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
        icon: CachedNetworkImage(
          imageUrl: "https://cdn-icons-png.flaticon.com/512/846/846296.png",
          color: Colors.grey,
          height: 3.h,
          width: 7.w,
          placeholder: (context, url) => const SizedBox(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: iserror.value != false ? Colors.redAccent : Colors.black26,
              width: 1.0),
        ),
      ),
      suggestions: controller.travelHeadModel!.taVehicleType!
          .map(
            (e) => SearchFieldListItem(
              e.type.toString(),
              child: Text('  ${e.type.toString()}', style: header11),
              item: e,
            ),
          )
          .toList(),
      onSuggestionTap: (val) {
        controller.isfiexd.value = int.parse(val.item!.fixedRate.toString());
        print(
            "DDDDDDDDddddddddddddddddddddddddddddaaaaaaaaaaaaaaaaaaaaaaa           iiiiiiiiiiiiiiiiiiiii${controller.isfiexd.value}");
        controller.fixededRate.value = double.parse(val.item!.rate.toString());
        controller.calculateAmount();
      },
    );
  }
}
