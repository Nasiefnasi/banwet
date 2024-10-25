import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/common_icontextform_feild.dart';
import '../controllers/daily_note_controller.dart';
import 'add_dailynote.dart';

class UpdateDailyNotd extends GetView<DailyNoteController> {
  var argumentData = Get.arguments;
  UpdateDailyNotd({super.key});
  @override
  DailyNoteController controller = Get.put(DailyNoteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Edit Daily Note",
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                children: [
                  h3,
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
                          child: Image.asset("assets/images/Description.png"))),
                  const SizedBox(
                    height: 30,
                  ),
                  SubmitButtons(
                    isLoading: controller.isLoadingUpdate,
                    text: "Update",
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.updateNote(argumentData["noteid"]);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
