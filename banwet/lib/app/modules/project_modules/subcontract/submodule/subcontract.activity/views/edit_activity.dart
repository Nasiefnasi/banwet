import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../daily_note/views/add_dailynote.dart';
import '../controllers/activity_controller.dart';

class EditActivity extends StatelessWidget {
  var argumentData = Get.arguments;

  EditActivity({super.key});
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
            "Sub Activity Edit",
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  h4,
                  NewCaseTextField(
                      validator: Validators.noneEmptyValidator,
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      controller: controller.titleController,
                      keyboard: TextInputType.name,
                      label: "Title",
                      icon: const Icon(Icons.sticky_note_2_outlined)),
                  h3,
                  NewCaseTextField(
                      validator: Validators.noneEmptyValidator,
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      maxLine: 3,
                      controller: controller.descriptionController,
                      keyboard: TextInputType.multiline,
                      descrip: TextInputAction.newline,
                      label: "Description",
                      icon: billRemarks()),
                  h5,
                  h6,
                  SubmitButtons(
                    isLoading: controller.isLoading,
                    text: "Submit",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        controller.updateSubActivity(argumentData["reportId"]);
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
