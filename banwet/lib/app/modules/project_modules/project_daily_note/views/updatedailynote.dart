import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/common_icontextform_feild.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../controllers/project_daily_note_controller.dart';

class UpdateProjectDailyNotd extends StatelessWidget {
  UpdateProjectDailyNotd({
    Key? key,
  }) : super(key: key);

  var argumnetData = Get.arguments;

  ProjectDailyNoteController controller = Get.put(ProjectDailyNoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Daily Notes",
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
      body: Padding(
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
            h5,
            h3,
            SubmitButtons(
              text: "Update",
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.updateprojectDayilinote(argumnetData["noteId"]);
              },
              isLoading: controller.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
