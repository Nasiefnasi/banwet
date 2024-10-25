import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../../../Style/const.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/labour_activity_controller.dart';

class UpdateLabourActivity extends GetView<LabourActivityController> {
  var argumentData = Get.arguments;

  UpdateLabourActivity({super.key});
  @override
  LabourActivityController controller = Get.put(LabourActivityController());
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          "Edit Activity",
          style: header15,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              // NewCaseTextField(
              //     labelstyle: header11.copyWith(
              //       color: Colors.black54,
              //     ),
              //     mediaquery: MediaQuery.of(context).size,
              //     validator: Validators.noneEmptyValidator,
              //     controller: controller.titleController,
              //     keyboard: TextInputType.name,
              //     label: "Title",
              //     icon: const Icon(
              //       Icons.sticky_note_2_outlined,
              //       color: Colors.grey,
              //     )),
              // h3,
              // NewCaseTextField(
              //     labelstyle: header11.copyWith(
              //       color: Colors.black54,
              //     ),
              //     mediaquery: MediaQuery.of(context).size,
              //     validator: Validators.noneEmptyValidator,
              //     maxLine: 4,
              //     minlines: 3,
              //     controller: controller.descriptionController,
              //     keyboard: TextInputType.name,
              //     label: "Description",
              //     icon: billRemarks()),
              h3,
              NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                readOnly: true,
                controller: controller.selectLabour,
                keyboard: TextInputType.none,
                label: "labour Name",
                icon: cImage(
                    'https://cdn-icons-png.flaticon.com/512/3716/3716527.png'),
              ),
              h3,
              NewCaseTextField(
                  labelstyle: header11.copyWith(
                    color: Colors.black54,
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'Please enter an email address';
                      return "";
                    }
                    return null;
                  },
                  controller: controller.titleController,
                  keyboard: TextInputType.name,
                  label: "Title",
                  icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/titleicon.png"))),
              h3,
              NewCaseTextField(
                  keyboard: TextInputType.multiline,
                  descrip: TextInputAction.newline,
                  maxLine: 5,
                  minlines: 4,
                  labelstyle: header11.copyWith(
                    color: Colors.black54,
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'Please enter an email address';
                      return "";
                    }
                    return null;
                  },
                  controller: controller.descriptionController,
                  // keyboard: TextInputType.name,
                  label: "Description",
                  icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/Description.png"))),
              h6,
              h3,
              SubmitButtons(
                  isLoading: controller.isLoading,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    controller.updateActivity(argumentData["reportId"]);
                  },
                  text: "Update")
            ],
          ),
        ),
      ),
    );
  }
}
