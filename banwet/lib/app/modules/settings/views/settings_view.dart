import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/settings/views/component/apply_leave.dart';
import 'package:banwet/app/modules/settings/views/password_change.dart';
import 'package:banwet/app/modules/settings/views/profile.screen.dart';
import 'package:banwet/app/modules/splash_login&panching/attendance_marking/views/attendance_marking_view.dart';
import 'package:banwet/app/modules/splash_login&panching/splash/controllers/splash_controller.dart';

import '../../../Style/const.dart';
import '../../daily_note/views/add_dailynote.dart';
import '../controllers/settings_controller.dart';
import 'component/profile_section.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController controller1 = Get.put(SplashController());
    final input = controller1.appVersion.value.toString();
    final currentVersion = int.tryParse(input.replaceAll('.', ''));
    return Container(
      color: bColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: appBarSection(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                DutySignoffCard(),
                h1,

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Get.to(const ApplyLeaveUI());
                          // Position position =
                          //     await controller.determinePosition();
                          // controller.getAddressFromLatLong(position);
                          // print(position.longitude);
                          // Get.bottomSheet(bottomSheet2());
                        },
                        child: Container(
                          height: 57,
                          width: dWidth! * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 252, 179, 70)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Apply Leave',
                                  style: wheader4.copyWith(
                                    color: Colors.black,
                                    fontFamily: Medium,
                                  ),
                                ),
                                w2,

                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Image.asset("assets/images/leave.png"),
                                ),

                                // Icon(
                                //   Icons.logout_outlined,
                                //   color: Colors.white,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Position position =
                              await controller.determinePosition();
                          controller.getAddressFromLatLong(position);
                          print(position.longitude);
                          Get.bottomSheet(bottomSheet2());
                        },
                        child: Container(
                          height: 57,
                          width: dWidth! * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Duty Sign Off',
                                  style: wheader4,
                                ),
                                w2,
                                const Icon(
                                  Icons.logout_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // _section1(context),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Account',
                    style: header3,
                  ),
                ),
                height4,
                ProfileTile(
                  text: 'My Profile',
                  image: 'assets/images/P1.svg',
                  navigater: () {
                    Get.to(() => ProfileScreen());
                  },
                ),
                height3,
                ProfileTile(
                  text: 'Change Password',
                  image: 'assets/images/P2.svg',
                  navigater: () {
                    Get.to(() => ChangePassword());
                    // Get.toNamed("/ChangePassword");
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    'More',
                    style: header3,
                  ),
                ),
                height4,
                // ProfileTile(
                //   text: 'Terms & Conditions',
                //   image: 'assets/images/P3.svg',
                //   navigater: () {
                //     Get.to(() => const TermsAndCondition());
                //   },
                // ),
                // height3,
                // ProfileTile(
                //   text: 'Privacy Policy',
                //   image: 'assets/images/L2.svg',
                //   navigater: () {
                //     Get.to(() => const PrivacyPolicy());
                //   },
                // ),
                // height3,
                // ProfileTile(
                //   text: 'Faq',
                //   image: 'assets/images/P5.svg',
                //   navigater: () {
                //     Get.to(() => const LaunchSoon());
                //   },
                // ),
                // height3,
                // ProfileTile(
                //   text: 'Help Center',
                //   image: 'assets/images/P6.svg',
                //   navigater: () {
                //     Get.to(() => const LaunchSoon());
                //   },
                // ),
                // height3,
                // ProfileTile(
                //   text: 'Language',
                //   image: 'assets/images/P7.svg',
                //   navigater: () {
                //     Get.to(() => const LaunchSoon());
                //   },
                // ),
                height3,
                ProfileTile(
                  color: Colors.red,
                  text: 'Account Log Out',
                  image: 'assets/images/L1.svg',
                  navigater: () {
                    logoutDialog(context, () {
                      controller.logOut();
                    });
                  },
                ),
                height10,
                Center(
                    child: Text(
                  'App Version ${input}',
                  style: header3.copyWith(color: Colors.grey),
                )),
                height5
              ],
            ),
          ),
        ),
      ),
    );
  }

  appBarSection() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 70,
      surfaceTintColor: Colors.white,
      title: const Text(
        'Settings',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  ProfileTile(
      {super.key,
      required this.text,
      required this.image,
      required this.navigater,
      this.color});
  Color? color;
  final String text;
  final String image;
  Function() navigater;
  @override
  Widget build(BuildContext context) {
    {
      return Card(
        // color: Colors.amber,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          onTap: () {
            navigater();
          },
          title: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: color ?? Colors.black,
            ),
          ),
          leading: SvgPicture.asset(
            image,
            color: color ?? bColor,
            height: 25,
            width: 25,
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded,
              color: color ?? Colors.black54),
        ),
      );
    }
  }
}

bottomSheet2() {
  TextEditingController landmarkController = TextEditingController();
  SettingsController controller = Get.put(SettingsController());
  final GlobalKey<FormState> key1 = GlobalKey<FormState>();

  return StatefulBuilder(builder: (context, setState) {
    var mediaquery = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
                  // borderRadius:
                  //     BorderRadius.vertical(top: Radius.circular(15))
                ),
                child: Center(
                    child: Text(
                  "Enter Your Landmark",
                  style: header2.copyWith(fontFamily: Medium, fontSize: 20),
                )),
              ),
              // const Divider(
              //   thickness: 1,
              //   height: 0,
              //   color: Colors.black12,
              // ),
              height5,
              // Text(
              //   'For advanced users only: Enter on your own fisk',
              //   style: header4,
              // ),
              // height5,

              CustomTextFormFields(
                obscureText: false,
                hinttexts: 'Landmark',
                icons: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.black26,
                ),
                mediaquery: mediaquery,
                controller: landmarkController,
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
              //     validator: Validators.noneEmptyValidator,
              //     controller: landmarkController,
              //     decoration: InputDecoration(
              //       labelText: 'Landmark',
              //       labelStyle: header3.copyWith(color: Colors.grey),
              //       prefixIcon: const Icon(Icons.location_on_rounded,color: Colors.grey,),
              //       border: UnderlineInputBorder(
              //           // borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(color: bColor)),
              //       enabledBorder: const UnderlineInputBorder(
              //         borderSide: BorderSide(color: Colors.black87, width: 1.0),
              //       ),
              //     ),
              //     //obscureText: isObscure,
              //   ),
              // ),
              height10,
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: SubmitButtons(
                          isLoading: controller.isLoading,
                          onTap: () async {
                            Position position =
                                await controller.determinePosition();

                            if (key1.currentState!.validate()) {
                              controller.singOffDuty(
                                  address: controller.address,
                                  landmark: landmarkController.text.toString(),
                                  latitude: position.latitude.toString(),
                                  longitude: position.longitude.toString());
                            }
                          },
                          text: "Submit"))),
            ],
          ),
        ),
      ),
    );
  });
}
