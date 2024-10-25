import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../common_widegt/submitpage.dart';
import '../../../../utils/validators.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../controllers/project_daily_note_controller.dart';

class ProjectAddDayilyNote extends GetView<ProjectDailyNoteController> {
  ProjectAddDayilyNote({super.key});
  @override
  ProjectDailyNoteController controller = Get.put(ProjectDailyNoteController());
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
              title: Text(
                "Add Daily Note",
                style: header15,
              ),
              leading: IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Form(
                  key: controller.key,
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
                      NewCaseTextField(
                          descrip: TextInputAction.newline,
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          validator: Validators.noneEmptyValidator,
                          maxLine: 5,
                          minlines: 4,
                          controller: controller.descriptionController,
                          keyboard: TextInputType.multiline,
                          label: "Description",
                          icon: SizedBox(
                              height: 25,
                              width: 25,
                              child: Image.asset(
                                  "assets/images/Description.png"))),
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
                      h3,
                      Obx(() {
                        return controller.fileValue.value == 1
                            ? GestureDetector(
                                onTap: () {
                                  controller.fileValue.value = 0;
                                  controller.pic = null;
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 1.h),
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
                      h6,
                      SubmitButtons(
                        isLoading: controller.isLoading,
                        text: "Submit",
                        onTap: () {
                          if (controller.key.currentState!.validate()) {
                            FocusManager.instance.primaryFocus?.unfocus();

                            controller.addNotess();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

class ImageUploadContainer extends StatelessWidget {
  ImageUploadContainer({super.key, required this.text, required this.onTap});
  final String text;
  void Function() onTap;
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
            border: Border.all(color: Colors.black54.withOpacity(0.1)),
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
              text,
              style: header12,
            ),
            // h03,
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
