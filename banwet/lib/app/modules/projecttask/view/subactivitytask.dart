import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/projecttask/controllers/projecttask_controller.dart';
import 'package:banwet/app/style/const.dart';
import 'package:intl/intl.dart';

class SubProjectActivityTask extends GetView<ProjecttaskController> {
  const SubProjectActivityTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            h2,
            ProjectNameTitile(
              // addbutton: const SizedBox(),
              projectName: controller.arugumentData["workname"] ?? "",
              screenTitile: "Activity",
              onTap: () {
                controller.clear();
                addsubtask(context, "", "");
              },
            ),
            h1,
            Expanded(
              child: GetBuilder<ProjecttaskController>(
                builder: (controller) => controller.subtaskactivity.value
                    ? Center(child: loadingthreebounce)
                    : Obx(
                        () =>
                            controller.SubActivitylist.value.length == 0 ||
                                    controller
                                        .subTaskActivitys!.activities!.isEmpty
                                ? Center(
                                    child: Lottie.asset(
                                        repeat: false,
                                        "assets/images/qrbRtDHknE.json",
                                        height: 250),
                                  )
                                : ListView.builder(
                                    itemCount: controller
                                        .subTaskActivitys?.activities?.length,
                                    itemBuilder: (context, index) {
                                      var details = controller
                                          .subTaskActivitys!.activities![index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Container(
                                          padding:
                                              EdgeInsetsDirectional.symmetric(
                                                  horizontal: 1.h,
                                                  vertical: 1.5.h),
                                          // height: 150,
                                          // width: 60,
                                          //
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: bColor,
                                          ),
                                          child: Row(
                                            children: [
                                              w2,
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      details.title,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: Medium,
                                                          color: Colors.white),
                                                    ),
                                                    h1,
                                                    Text(
                                                      details.date,
                                                      style: TextStyle(
                                                        fontFamily: regular,
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Spacer(),
                                              Container(
                                                child: PopupMenuButton<String>(
                                                    onSelected: (value) {
                                                      if ("Edit" == value) {
                                                        controller.title.text =
                                                            details.title;
                                                        controller.description
                                                                .text =
                                                            details.description;

                                                        controller
                                                                .transferdate =
                                                            TextEditingController(
                                                          text: DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                            DateFormat(
                                                                    'dd-MM-yyyy')
                                                                .parse(
                                                                    '20-03-2022'),
                                                          ),
                                                        );
                                                        print(controller
                                                            .transferdate.text);
                                                        // controller.transferdate =
                                                        //     TextEditingController(
                                                        //         text: DateTime.parse(
                                                        //             controller
                                                        //                 .projectsubtsakactivity
                                                        //                 .value[index]
                                                        //                 .date
                                                        //                 .toString()));
                                                        //     controller.dateFormat
                                                        //         .format(
                                                        //   DateFormat('dd-MM-yyyy')
                                                        //       .parse(controller
                                                        //           .projectsubtsakactivity
                                                        //           .value[index]
                                                        //           .date),
                                                        // );

                                                        addsubtask(
                                                            context,
                                                            "edit",
                                                            controller
                                                                .SubActivitylist
                                                                .value[index]
                                                                .id);
                                                      }
                                                      if ("Delete" == value) {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return StatefulBuilder(builder:
                                                                  (BuildContext
                                                                          context,
                                                                      StateSetter
                                                                          setState) {
                                                                return SizedBox(
                                                                  //  height:80.h,
                                                                  width: 100.w,
                                                                  child: SimpleDialog(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              15)),
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      titlePadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      children: [
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(15)),
                                                                          padding: EdgeInsets.symmetric(
                                                                              vertical: 2.h,
                                                                              horizontal: 2.h),
                                                                          // height: 25.h,
                                                                          width:
                                                                              100.w,
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              h1,
                                                                              SvgPicture.asset(
                                                                                "assets/images/delete.svg",
                                                                                width: 5.w,
                                                                                height: 5.h,
                                                                              ),
                                                                              h1,
                                                                              Text(
                                                                                "Warning",
                                                                                style: header15,
                                                                              ),
                                                                              h1,
                                                                              Text(
                                                                                "Do you Want Delete?",
                                                                                style: header10.copyWith(color: const Color.fromARGB(255, 139, 131, 131)),
                                                                              ),
                                                                              const Divider(
                                                                                thickness: 1,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5.h,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: InkWell(
                                                                                        onTap: () async {
                                                                                          return controller.activtydelete(controller.SubActivitylist.value[index].id);
                                                                                        },

                                                                                        child: Center(
                                                                                            child: Text(
                                                                                          'Yes',
                                                                                          style: header12.copyWith(color: Colors.black),
                                                                                        )),
                                                                                        //  ),
                                                                                      ),
                                                                                    ),
                                                                                    const VerticalDivider(
                                                                                      thickness: 1,
                                                                                      color: Colors.black26,
                                                                                      endIndent: 5,
                                                                                      indent: 2,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: InkWell(
                                                                                        onTap: () {
                                                                                          return Get.back();
                                                                                        },
                                                                                        child: Center(
                                                                                          child: InkWell(
                                                                                            onTap: () {
                                                                                              Get.back();
                                                                                            },
                                                                                            // child: Container(
                                                                                            //   height: 4.h,
                                                                                            //   width: 30.w,
                                                                                            //   decoration: BoxDecoration(
                                                                                            //       color: bColor,
                                                                                            //       borderRadius: BorderRadius.circular(13)),
                                                                                            //   child: Center(
                                                                                            child: Text(
                                                                                              'No',
                                                                                              style: header12.copyWith(color: Colors.black),
                                                                                              // )
                                                                                              //),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ]),
                                                                );
                                                              });
                                                            });
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons.more_vert,
                                                        color: Colors.white),
                                                    surfaceTintColor:
                                                        Colors.white,
                                                    itemBuilder: (context) {
                                                      return [
                                                        // PopupMenuItem(
                                                        //     padding: EdgeInsets.only(),
                                                        //     value: "edite",
                                                        //     child: Container(
                                                        //       padding: EdgeInsets.only(left: 2.h),
                                                        //       width: 28.w,
                                                        //       // height: 3.h,
                                                        //       child: const Text(
                                                        //         "Edit",
                                                        //       ),
                                                        //     )),
                                                        const PopupMenuItem(
                                                            value: "Edit",
                                                            child:
                                                                Text("Edit")),
                                                        const PopupMenuItem(
                                                            value: "Delete",
                                                            child:
                                                                Text("Delete"))
                                                      ];
                                                    }),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                      ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void addsubtask(BuildContext context, edite, activityid) {
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
                  h5,
                  Text(
                    edite != "edit" ? "Add Activity" : "Edit Activity",
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
                    maxLine: 4,
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
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: DateTimePickers(
                        onChanged: (p0) {
                          print(controller.transferdate.text);
                        },
                        lastdate: DateTime(2035),
                        color: Colors.black38,
                        style: header11,
                        labelStyle: header11.copyWith(color: Colors.black26),
                        controller: controller.transferdate,
                        // validator: Validators.noneEmptyValidator,
                        label: " Transfer Date",
                      )),
                  h5,
                  SubmitButtons(
                      isLoading: controller.taskactivityloading,
                      onTap: () {
                        if (controller.key.currentState!.validate()) {
                          if (edite == "edit") {
                            controller.eitactivivty(activityid);
                          } else {
                            controller.createsubtaskactivitiy(
                                controller.subTaskActivitys!.taskId.toString());
                          }
                        }
                      },
                      text: edite != "edit" ? "Submit" : "Update")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
