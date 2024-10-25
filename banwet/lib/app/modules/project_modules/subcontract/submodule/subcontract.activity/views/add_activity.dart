import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../controllers/activity_controller.dart';

class AddActivity extends GetView<ActivityController> {
  AddActivity({super.key});
  @override
  ActivityController controller = Get.put(ActivityController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Add Activity",
            style: header15,
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Get.back();
                controller.clear();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  h4,
                  NewCaseTextField(
                      mediaquery: MediaQuery.of(context).size,
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      validator: Validators.noneEmptyValidator,
                      controller: controller.titleController,
                      keyboard: TextInputType.name,
                      label: "Title",
                      prefix: SizedBox(
                          height: 20,
                          width: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 15),
                            child: Image.asset("assets/images/titleicon.png"),
                          ))),
                  h3,
                  NewCaseTextField(
                    minlines: 3,
                    mediaquery: MediaQuery.of(context).size,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    validator: Validators.noneEmptyValidator,
                    maxLine: 5,
                    controller: controller.descriptionController,
                    keyboard: TextInputType.multiline,
                    descrip: TextInputAction.newline,
                    label: "Description",
                    prefix: SizedBox(
                        height: 20,
                        width: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 15),
                          child: Image.asset("assets/images/Description.png"),
                        )),
                  ),
                  h5,
                  h6,
                  SubmitButtons(
                    isLoading: controller.isLoading,
                    text: "Submit",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        controller.addSubContactActivity();
                      }
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
