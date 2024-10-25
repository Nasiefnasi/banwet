// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../routes/app_pages.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../../splash/views/sunpages/leave_splash.dart';
import '../controllers/attendance_marking_controller.dart';
import 'component/welcometext_component.dart';

class AttendanceMarkingView extends GetView<AttendanceMarkingController> {
  AttendanceMarkingView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var storage = GetStorage();
  bool isLo = true;
  bool isLoo = true;
  @override
  Widget build(BuildContext context) {
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;
    return Container(
      color: bColor,
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height25,
              WelcomeTextWidegt(),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 220,
                    width: dWidth,
                    child: Center(
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (contex, index) {
                            return Row(
                              children: [
                                InkWell(
                                  child: GestureDetector(
                                    onTap: () async {
                                      controller.onSelectedAnimation.reset();
                                      controller.onSelectedAnimation
                                          .forward()
                                          .then((value) => Get.bottomSheet(
                                              _bottomSheet1(contex),
                                              enterBottomSheetDuration:
                                                  const Duration(
                                                      milliseconds: 600)));
                                      Position position =
                                          await controller.determinePosition();
                                      controller
                                          .getAddressFromLatLong(position);
                                      storage.write(
                                          'longitude', position.longitude);
                                      storage.write(
                                          'latitude', position.latitude);

                                      print(position.longitude);

                                      // onChangedAnimation.value = 1;
                                      controller.previousIndex =
                                          controller.selectedIndex;
                                      controller.selectedIndex.value = index;
                                    },
                                    child: Lottie.asset(
                                      'assets/images/nF6.json',
                                      height: 42.h,
                                      width: 47.w,
                                      animate: controller.isTrue.value,
                                      repeat: controller.isTrue.value,
                                      controller: controller.selectedIndex == 0
                                          ? controller.onSelectedAnimation
                                          : controller.previousIndex == 0
                                              ? controller.onChangedAnimation
                                              : controller.idleAnimation,
                                    ),
                                  ),
                                ),
                                // width25,
                                Obx(() {
                                  return GestureDetector(
                                    onTap: () async {
                                      controller.onSelectedAnimation1.reset();
                                      controller.onSelectedAnimation1
                                          .forward()
                                          .then((value) => Get.bottomSheet(
                                              bottomSheet2(contex),
                                              enterBottomSheetDuration:
                                                  const Duration(
                                                      milliseconds: 600)));
                                      Position position =
                                          await controller.determinePosition();
                                      controller
                                          .getAddressFromLatLong(position);
                                      storage.write(
                                          'longitude', position.longitude);
                                      storage.write(
                                          'latitude', position.latitude);

                                      print(position.longitude);

                                      controller.onChangedAnimation1.value = 1;
                                      controller.previousIndex =
                                          controller.selectedIndex1;
                                      controller.selectedIndex1.value = index;
                                    },
                                    child: Lottie.asset(
                                      'assets/images/nF4.json',
                                      height: 42.h,
                                      width: 47.w,
                                      animate: controller.isTrue.value,
                                      repeat: controller.isTrue.value,
                                      controller: controller.selectedIndex1 == 0
                                          ? controller.onSelectedAnimation1
                                          : controller.previousIndex == 0
                                              ? controller.onChangedAnimation1
                                              : controller.idleAnimation1,
                                    ),
                                  );
                                }),
                              ],
                            );
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'I AM ON DUTY',
                        style: header2.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: bColor),
                      ),
                      Text(
                        'I AM ON LEAVE',
                        style: header2.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: bColor),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  _bottomSheet1(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        height: dHeight! * 0.33,
        width: dWidth,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                ),
                child: Center(
                    child: Text(
                  'Enter Your Landmark',
                  style: header2.copyWith(fontFamily: Medium, fontSize: 20),
                )),
              ),
              // const Divider(
              //   thickness: 1,
              //   height: 0,
              //   color: Colors.black12,
              // ),
              height5,

              CustomTextFormFields(
                obscureText: false,
                hinttexts: 'Landmark',
                icons: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.black26,
                ),
                mediaquery: mediaquery,
                controller: controller.landmarkController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // return 'Please enter an email address';
                    return "";
                  }
                  return null;
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 18),
              //   child: TextFormField(
              //     onChanged: (value) {
              //       // You can perform any additional logic on value change if needed.
              //     },
              //     controller: controller.landmarkController,
              //     decoration: InputDecoration(
              //       labelText: 'Landmark',
              //       labelStyle: header4.copyWith(color: Colors.grey),
              //       prefixIcon: const Icon(Icons.location_on_rounded),
              //       border: UnderlineInputBorder(
              //         // borderRadius: BorderRadius.circular(10),
              //         borderSide: BorderSide(color: bColor),
              //       ),
              //       enabledBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.black87, width: 1.0),
              //       ),
              //     ),
              //     validator: Validators.noneEmptyValidator,
              //   ),
              // ),
              height10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SubmitButtons(
                  isLoading: controller.isLoading,
                  text: "Submit",
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, continue with the submission logic

                      Position position = await controller.determinePosition();

                      var result = await controller.attendancePost(
                          attendance: "1",
                          address: controller.address ?? "",
                          landmark:
                              controller.landmarkController.text.toString(),
                          latitude: position.latitude.toString(),
                          longitude: position.longitude.toString(),
                          userId: storage.read('uid'));

                      if (result) {
                        storage.write('address', controller.address);
                        print(controller.address);
                        // storage.write('atte', true);
                        storage.write('atte', 1);

                        Get.offAllNamed(Routes.HOME_LAYOUT);
                      } else {
                        Get.offAllNamed(Routes.HOME_LAYOUT);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  bottomSheet2(BuildContext context) {
    final GlobalKey<FormState> key1 = GlobalKey<FormState>();
    var mediaquery = MediaQuery.of(context).size;

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          height: dHeight! * 0.35,
          width: dWidth,
          child: Form(
            key: key1,
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  child: Center(
                      child: Text(
                    'Enter Your Landmark',
                    style: header2.copyWith(fontFamily: Medium, fontSize: 20),
                  )),
                ),
                height5,
                CustomTextFormFields(
                  obscureText: false,
                  hinttexts: 'Landmark',
                  icons: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black26,
                  ),
                  mediaquery: mediaquery,
                  controller: controller.landmarkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // return 'Please enter an email address';
                      return "";
                    }
                    return null;
                  },
                ),
                // Confirmlocation(
                //   controller: controller,
                //   validator: Validators.noneEmptyValidator,
                // ),
                height10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: SubmitButtons(
                    isLoading: controller.isLoading,
                    text: "Submit",
                    onTap: () async {
                      Position position = await controller.determinePosition();
                      if (key1.currentState!.validate()) {
                        var result = await controller.attendancePost(
                            attendance: "2",
                            address: controller.address ?? "loo",
                            landmark:
                                controller.landmarkController.text.toString(),
                            latitude: position.latitude.toString(),
                            longitude: position.longitude.toString(),
                            userId: storage.read('uid').toString());

                        if (result) {
                          Get.offAll(() => const LeavePage());
                        } else {
                          Get.offAll(() => const LeavePage());
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

// class Confirmlocation extends StatelessWidget {
//   const Confirmlocation({
//     super.key,
//     required this.controller,
//     required this.validator,
//   });

//   final AttendanceMarkingController controller;
//   final String? Function(String?) validator;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 18),
//       child: Container(
//         child: TextFormField(
//           validator: validator,
//           controller: controller.landmarkController,
//           decoration: InputDecoration(
//             labelText: 'Landmark',
//             labelStyle: header4.copyWith(color: Colors.grey),
//             prefixIcon: const Icon(
//               Icons.location_on_outlined,
//               color: Colors.black26,
//             ),
//             border: UnderlineInputBorder(
//               borderSide: BorderSide(color: bColor),
//             ),
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black87, width: 1.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields(
      {Key? key,
      required this.mediaquery,
      this.hinttexts,
      this.icons,
      this.controller,
      this.keyboard,
      this.validator,
      this.sufixicon,
      this.inputFormatter,
      this.errorcolors,
      this.boxcolor,
      this.contentPadding,
      this.bordercolor,
      this.obscureText,
      this.maxLine,
      this.minline})
      : super(key: key);

  final Size mediaquery;

  final String? hinttexts;
  final errorcolors;
  final icons;
  final controller;
  final Widget? sufixicon;
  final validator;
  final keyboard;
  final inputFormatter;
  final boxcolor;
  final contentPadding;
  final bordercolor;
  final obscureText;
  final maxLine;
  final minline;

  @override
  Widget build(BuildContext context) {
    final errorText = validator != null ? validator(controller.text) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: boxcolor ?? Colors.white,
            // border: Border.all(
            //     width: 1, color: Colors.black12), // Black border color
            // color: const Color.fromARGB(31, 255, 255, 255).withOpacity(0.02),
            borderRadius: BorderRadius.circular(12),
          ),
          width: mediaquery.width * 0.85,
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            // ignore: prefer_const_constructors
            child: TextFormField(
              toolbarOptions: const ToolbarOptions(
                  copy: false, paste: false, cut: false, selectAll: false),
              // enableInteractiveSelection: false,
              obscureText: obscureText,
              inputFormatters: inputFormatter,
              keyboardType: keyboard,
              controller: controller,
              validator: validator,
              textAlign: TextAlign.left,
              minLines: minline ?? 1,
              maxLines: maxLine ?? 2,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: bordercolor ?? Colors.black12, width: 1.0),
                ),
                contentPadding: contentPadding,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: bColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: bordercolor ?? Colors.black12, width: 1.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: errorcolors ?? Colors.red,
                      // controller.errormessage.value ??
                      //     Color.fromARGB(255, 211, 211, 211),
                      width: 1),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid,
                      color: errorcolors ??
                          const Color.fromARGB(255, 211, 211, 211),
                      width: 1),
                ),

                fillColor: boxcolor ?? const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                suffixIcon: sufixicon,
                prefixIcon: icons,

                hintText: hinttexts,
                hintStyle: TextStyle(
                  fontFamily: Medium,
                  color: Colors.black45,
                  fontSize: 16,
                ),
                errorStyle: const TextStyle(
                  fontSize: 12, // Adjust the font size
                  height: 0.01, // Adjust the height
                  color: Color.fromARGB(255, 219, 199, 198), // Adjust the color
                ),
                // fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
