import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common_icontextform_feild.dart';
import '../../../common_widegt/submitpage.dart';
import '../controllers/daily_note_controller.dart';

class AddDayilyNote extends GetView<DailyNoteController> {
  AddDayilyNote({super.key});
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();

  @override
  DailyNoteController controller = Get.put(DailyNoteController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Add Daily Note", style: header15),
            leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Get.back();
                  controller.fileValue.value = 0;
                  controller.clear();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Form(
                key: key1,
                child: Column(
                  children: [
                    h4,
                    NewCaseTextField(
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      validator: Validators.noneEmptyValidator,
                      controller: controller.titleController,
                      keyboard: TextInputType.name,
                      label: "Title",
                      icon: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/images/titleicon.png")),
                    ),
                    h3,
                    // NewCaseTextField(
                    //     labelstyle: header11.copyWith(
                    //       color: Colors.black54,
                    //     ),
                    //     mediaquery: MediaQuery.of(context).size,
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         // return 'Please enter an email address';
                    //         return "";
                    //       }
                    //       return null;
                    //     },
                    //     maxLine: 3,
                    //     controller: controller.descriptionController,
                    //     keyboard: TextInputType.name,
                    //     label: "Description",
                    //     icon: SizedBox(
                    //         height: 30,
                    //         width: 30,
                    //         child:
                    //             Image.asset("assets/images/Description.png"))),
                    NewCaseTextField(
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        validator: Validators.noneEmptyValidator,
                        maxLine: 5,
                        minlines: 4,
                        controller: controller.descriptionController,
                        keyboard: TextInputType.multiline,
                        descrip: TextInputAction.newline,
                        label: "Description",
                        icon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset("assets/images/Description.png"))),
                    h5,
                    Obx(
                      () => controller.fileValue.value == 1
                          ? Container(
                              height: 10.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child:
                                      Image.file(File(controller.pic!.path))),
                            )
                          : ImageUploadContainer(
                              text: "Add Photo",
                              onTap: () {
                                Get.bottomSheet(uploadBill(
                                  onTapCamera: () {
                                    controller.pickImage(ImageSource.camera);
                                    Get.back();
                                  },
                                  onTapGAllery: () {
                                    controller.pickImage(ImageSource.gallery);
                                    Get.back();
                                  },
                                ));
                              },
                            ),
                    ),
                    // Obx(
                    //   () => controller.fileValue.value == 1
                    //       ? Container(
                    //           height: 10.h,
                    //           width: 25.w,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(20),
                    //               child: Image.file(
                    //                 File(
                    //                   controller.pic!.path,
                    //                 ),
                    //                 fit: BoxFit.contain,
                    //               )),
                    //         )
                    //       : ImageUploadContainer(
                    //           text: "Add Photo",
                    //           onTap: () {
                    //             Get.bottomSheet(uploadBill(
                    //               onTapCamera: () {
                    //                 controller.pickImage(ImageSource.camera);
                    //                 Get.back();
                    //               },
                    //               onTapGAllery: () {
                    //                 controller.pickImage(ImageSource.gallery);
                    //                 Get.back();
                    //               },
                    //             ));
                    //           },
                    //         ),
                    // ),
                    h2,
                    Obx(() {
                      return controller.fileValue.value == 1
                          ? GestureDetector(
                              onTap: () {
                                controller.fileValue.value = 0;
                                controller.pic = null;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 1.h),
                                width: 36.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                    // Obx(() {
                    //   return controller.fileValue.value == 1
                    //       ? GestureDetector(
                    //           onTap: () {
                    //             controller.fileValue.value = 0;
                    //             controller.pic = null;
                    //           },
                    //           child: Container(
                    //             padding: EdgeInsets.symmetric(horizontal: 1.h),
                    //             width: 36.w,
                    //             height: 5.h,
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(5),
                    //                 color: bColor),
                    //             child: Center(
                    //                 child: Row(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceEvenly,
                    //               children: [
                    //                 const Icon(
                    //                   Icons.delete,
                    //                   color: Colors.white,
                    //                 ),
                    //                 Text(
                    //                   "Remove Photo",
                    //                   style: wheader9,
                    //                 ),
                    //               ],
                    //             )),
                    //           ),
                    //         )
                    //       : const SizedBox();
                    // }),
                    h6,
                    SubmitButtons(
                      isLoading: controller.isLoading,
                      text: "Submit",
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        if (key1.currentState!.validate()) {
                          controller.addNotes();
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
}

class ImageUploadContainer extends StatelessWidget {
  ImageUploadContainer(
      {super.key, required this.text, required this.onTap, this.bordercolor});
  final String text;
  void Function() onTap;
  final bordercolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 14.h,
        width: 45.w,
        decoration: BoxDecoration(
            color: bColor2,
            border: Border.all(color: bordercolor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            h1,
            Icon(
              Icons.add_circle,
              color: bColor,
              size: 29.sp,
            ),
            h05,
            Text(
              textAlign: TextAlign.center,
              text,
              style: header10,
            ),
            h03,
            // Text(
            //   'Upload Live Image',
            //   style: header7,
            // ),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  RxBool isLoading = false.obs;
  void Function() onTap;
  final String text;
  SubmitButton({super.key, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          //  margin: EdgeInsets.symmetric(horizontal: 3.h),
          height: 7.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: bColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: isLoading.isFalse
                ? Text(
                    text,
                    style: header12.copyWith(color: Colors.white),
                  )
                : SpinKitThreeBounce(
                    size: 25.sp,
                    color: Colors.white,
                  ),
          ),
        ),
      );
    });
  }
}

class SubmitButtons extends StatelessWidget {
  RxBool isLoading;
  void Function() onTap;
  final String text;
  final color;
  final radius;
  SubmitButtons(
      {super.key,
      required this.isLoading,
      required this.onTap,
      required this.text,
      this.radius,
      this.color});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();

          log("----->");
          if (isLoading.value == false) {
            log("----->");

            onTap();
          } else {
            log("//////////");
          }
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 3.h),
          height: 7.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: color ?? bColor,
              borderRadius: BorderRadius.circular(radius ?? 10)),
          child: Center(
            child: isLoading.isFalse
                ? Text(
                    text,
                    style: header14.copyWith(color: Colors.white),
                  )
                : SpinKitThreeBounce(
                    size: 20.sp,
                    color: Colors.white,
                  ),
          ),
        ),
      );
    });
  }
}
