import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/projecttask/controllers/projecttask_controller.dart';
import 'package:banwet/app/modules/projecttask/view/peojecttask.dart';
import 'package:banwet/app/modules/projecttask/view/subactivitytask.dart';
import 'package:banwet/app/style/const.dart';

class TasktitlePage extends GetView<ProjecttaskController> {
  const TasktitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            h1,
            ProjectNameTitile(
                // addbutton: const SizedBox(),
                projectName: controller.arugumentData["workname"] ?? "",
                screenTitile: "Sub Task",
                onTap: () {
                  controller.clear();
                  addsubtask(context);
                }),
            h1,
            Expanded(
                child: GetBuilder<ProjecttaskController>(
              builder: (controller) => Obx(
                () => controller.projecttaskworking.value
                    ? Center(child: loadingthreebounce)
                    : controller.projectDetailsModel == null
                        ? Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          )
                        : controller.subtask.value == null
                            ? Center(
                                child: Lottie.asset(
                                    repeat: false,
                                    "assets/images/qrbRtDHknE.json",
                                    height: 250),
                              )
                            : ListView.builder(
                                itemCount: controller.subtask.value.length,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: InkWell(
                                        onTap: () async {
                                          controller.subActivitytaskID.value =
                                              controller
                                                  .subtask.value[index].taskId;
                                          controller.getActivitydetails();
                                          Get.to(
                                              const SubProjectActivityTask());
                                        },
                                        child: ProjectTaskIteamCard(
                                          data: controller.subtask.value[index],
                                          mediaquery: mediaquery,
                                          task: "2task",
                                        ),
                                      ),
                                    )),
              ),
              init: ProjecttaskController(),
            ))
          ],
        )),
      ),
    );
  }

  void addsubtask(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        insetPadding:
            EdgeInsets.zero, // Removes padding to make dialog full-screen
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Form(
          key: controller.key,
          child: SizedBox(
            width: 300,
            height: MediaQuery.of(context).size.height * .53,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  h3,
                  Text(
                    "Add Sub Task",
                    style: TextStyle(fontFamily: Medium, fontSize: 18),
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
                    controller: controller.title,
                    keyboard: TextInputType.name,
                    label: "Title",
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/images/titleicon.png")),
                    ),
                  ),
                  h1,
                  NewCaseTextField(
                    minlines: 4,
                    maxLine: 4,
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
                    controller: controller.description,
                    keyboard: TextInputType.multiline,
                    descrip: TextInputAction.newline,
                    label: "Description",
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset("assets/images/Description.png")),
                    ),
                  ),
                  h1,
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DateTimePickers(
                              lastdate: DateTime(2035),
                              color: Colors.black38,
                              style: header11,
                              labelStyle:
                                  header11.copyWith(color: Colors.black26),
                              controller: controller.stratdate,
                              validator: Validators.noneEmptyValidator,
                              label: " Start Date",
                            )),
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: DateTimePickers(
                              lastdate: DateTime(2035),
                              color: Colors.black45,
                              style: header11,
                              labelStyle:
                                  header11.copyWith(color: Colors.black26),
                              controller: controller.enddate,
                              validator: Validators.noneEmptyValidator,
                              label: " End Date",
                            )),
                      )
                    ],
                  ),
                  h5,
                  SubmitButtons(
                      isLoading: controller.createprojectloading,
                      onTap: () {
                        if (controller.key.currentState!.validate()) {
                          controller.createproject();
                        }
                      },
                      text: "Submit")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
