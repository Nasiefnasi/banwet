import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/settings/controllers/settings_controller.dart';
import 'package:banwet/app/style/const.dart';
import 'package:banwet/app/utils/index.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //       statusBarIconBrightness: Brightness.light,
    //       statusBarColor: bColor), // Change to your desired color
    // );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Profile",
          style: header15,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: GetBuilder<SettingsController>(
            builder: (controller) => controller.userDetailsModel == null
                ? Center(child: loadingthreebounce)
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        h3,
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: controller.userDetailsModel?.photo ?? "",
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundColor: bColor,
                            radius: 80,
                            backgroundImage: imageProvider,
                          ),
                          errorWidget: (context, url, error) => CircleAvatar(
                            backgroundColor: bColor,
                            radius: 80,
                          ),
                        ),
                        h3,
                        Text(
                          controller.userDetailsModel?.name ?? "",
                          style: header18,
                        ),
                        Text(
                          controller.userDetailsModel?.userType ?? "",
                          style: header15,
                        ),
                        NewCaseTextField(
                            mediaquery: MediaQuery.of(context).size,
                            readOnly: true,
                            validator: Validators.noneEmptyValidator,
                            controller: TextEditingController(
                                text:
                                    controller.userDetailsModel?.address ?? ""),
                            keyboard: TextInputType.name,
                            label: "Address",
                            icon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            )),
                        h3,
                        NewCaseTextField(
                            mediaquery: MediaQuery.of(context).size,
                            readOnly: true,
                            validator: Validators.noneEmptyValidator,
                            controller: TextEditingController(
                                text: controller.userDetailsModel?.phone ?? ""),
                            keyboard: TextInputType.name,
                            label: "Phone Number",
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            )),
                        h3,
                        NewCaseTextField(
                            mediaquery: MediaQuery.of(context).size,
                            readOnly: true,
                            validator: Validators.noneEmptyValidator,
                            controller: TextEditingController(
                                text: controller.userDetailsModel?.email ?? ""),
                            keyboard: TextInputType.name,
                            label: "Email Id",
                            icon: const Icon(
                              Icons.email,
                              color: Colors.grey,
                            )),
                        h3,
                        Row(
                          children: [
                            Expanded(
                              child: NewCaseTextField(
                                  mediaquery: MediaQuery.of(context).size,
                                  readOnly: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: TextEditingController(
                                      text: controller.userDetailsModel?.dob ??
                                          ""),
                                  keyboard: TextInputType.name,
                                  label: "Date Of Birth",
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.grey,
                                  )),
                            ),
                            Expanded(
                              child: NewCaseTextField(
                                  mediaquery: MediaQuery.of(context).size,
                                  readOnly: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: TextEditingController(
                                      text: controller
                                              .userDetailsModel?.joinedDate ??
                                          ""),
                                  keyboard: TextInputType.name,
                                  label: "Joined Date",
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.grey,
                                  )),
                            ),
                          ],
                        ),
                        h3,
                        Row(
                          children: [
                            Expanded(
                              child: NewCaseTextField(
                                  mediaquery: MediaQuery.of(context).size,
                                  readOnly: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: TextEditingController(
                                      text: controller.userDetailsModel
                                              ?.dutyStartTime ??
                                          ""),
                                  keyboard: TextInputType.name,
                                  label: "Duty Start Time",
                                  icon: cImage(
                                      "https://cdn-icons-png.flaticon.com/512/7477/7477542.png")),
                            ),
                            Expanded(
                              child: NewCaseTextField(
                                  mediaquery: MediaQuery.of(context).size,
                                  readOnly: true,
                                  validator: Validators.noneEmptyValidator,
                                  controller: TextEditingController(
                                      text: controller
                                              .userDetailsModel?.dutyEndTime ??
                                          ""),
                                  keyboard: TextInputType.name,
                                  label: "Duty End Time",
                                  icon: cImage(
                                      "https://cdn-icons-png.flaticon.com/512/7477/7477542.png")),
                            ),
                          ],
                        ),
                        h3,
                      ],
                    ),
                  ),
            init: SettingsController(),
          )),
    );
  }
}
