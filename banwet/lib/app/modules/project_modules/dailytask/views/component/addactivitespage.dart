// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/addactivites_controller.dart';
import 'package:banwet/app/style/const.dart';

class AddActivites extends StatelessWidget {
  const AddActivites({super.key, this.taskid});
  final taskid;

  @override
  Widget build(BuildContext context) {
    AddActivitiesController controller = Get.put(AddActivitiesController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Activity",
          style: TextStyle(fontSize: 22, fontFamily: Medium),
        ),
      ),
      body: SafeArea(
          child: Form(
        key: controller.key1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              h4,
              NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                validator: Validators.noneEmptyValidator,
                controller: controller.title,
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
                  controller: controller.description,
                  keyboard: TextInputType.multiline,
                  label: "Description",
                  icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/Description.png"))),
              const Spacer(),
              SubmitButtons(
                isLoading: controller.loading,
                text: "Submit",
                onTap: () {
                  if (controller.key1.currentState!.validate()) {
                    controller.postAddActivities(taskid);
                  }
                },
              ),
              h2,
            ],
          ),
        ),
      )),
    );
  }
}

class EditActivites extends StatelessWidget {
  const EditActivites({super.key, this.taskid, this.activityids});
  final taskid;
  // final title;
  // final description;
  final activityids;

  @override
  Widget build(BuildContext context) {
    AddActivitiesController controller = Get.put(AddActivitiesController());
    // TextEditingController edittitles = TextEditingController(text: title ?? "");
    // TextEditingController editdescription =
    //     TextEditingController(text: description ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Activity",
          style: TextStyle(fontSize: 22, fontFamily: Medium),
        ),
      ),
      body: SafeArea(
          child: Form(
        key: controller.key1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NewCaseTextField(
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                validator: Validators.noneEmptyValidator,
                controller: controller.title,
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
                  controller: controller.description,
                  keyboard: TextInputType.multiline,
                  label: "Description",
                  icon: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/Description.png"))),
              h4,
              // NewCaseTextField(
              //   labelstyle: header11.copyWith(
              //     color: Colors.black54,
              //   ),
              //   mediaquery: MediaQuery.of(context).size,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       // return 'Please enter an email address';
              //       return "";
              //     }
              //     return null;
              //   },
              //   controller: controller.title,
              //   keyboard: TextInputType.name,
              //   label: "Title",
              //   prefix: SizedBox(
              //       height: 20,
              //       width: 20,
              //       child: Padding(
              //         padding: const EdgeInsets.only(top: 5, bottom: 15),
              //         child: Image.asset("assets/images/titleicon.png"),
              //       )),
              // ),
              // h3,
              // NewCaseTextField(
              //   labelstyle: header11.copyWith(
              //     color: Colors.black54,
              //   ),
              //   mediaquery: MediaQuery.of(context).size,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       // return 'Please enter an email address';
              //       return "";
              //     }
              //     return null;
              //   },
              //   maxLine: 5,
              //   minlines: 4,
              //   controller: controller.description,
              //   keyboard: TextInputType.name,
              //   label: "Description",
              //   prefix: SizedBox(
              //       height: 20,
              //       width: 20,
              //       child: Padding(
              //         padding: const EdgeInsets.only(top: 5, bottom: 15),
              //         child: Image.asset("assets/images/Description.png"),
              //       )),
              // ),
              const Spacer(),
              SubmitButtons(
                  isLoading: controller.loading,
                  text: "Update",
                  onTap: () {
                    if (controller.key1.currentState!.validate()) {
                      controller.posteditactivites(activityids);
                    }
                  }),
              h2,
            ],
          ),
        ),
      )),
    );
  }
}
