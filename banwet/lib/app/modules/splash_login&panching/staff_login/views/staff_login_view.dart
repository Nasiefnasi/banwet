import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/modules/splash_login&panching/attendance_marking/views/attendance_marking_view.dart';

import '../../../../Style/const.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../controllers/staff_login_controller.dart';

class StaffLoginView extends GetView<StaffLoginController> {
  StaffLoginView({Key? key}) : super(key: key);
  @override
  StaffLoginController controller = Get.put(StaffLoginController());
  var storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    GetStorage.init();

    log(storage.read('logo').toString());
    log(storage.read('domain').toString());
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;
    var mediaquery = MediaQuery.of(context).size;

    return Container(
      color: bColor,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(),
              child: Form(
                key: controller.formKey2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    storage.read('logo') == null
                        ? const CircularProgressIndicator()
                        : Center(
                            child: Image.network(
                              storage.read('logo').toString(),
                              height: dHeight! * 0.3,
                              width: dWidth! * 0.7,
                              //  color: bColor,
                            ),
                          ),
                    height10,
                    Center(
                      child: Text(
                        'Welcome',
                        style: header2.copyWith(
                            fontFamily: SemiBold, fontSize: 24),
                      ),
                    ),
                    height3,
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        storage.read('name').toString(),
                        style:
                            header2.copyWith(fontFamily: Medium, fontSize: 20),
                      ),
                    ),
                    height10,
                    Obx(
                      () => SizedBox(
                        // color: const Color.fromARGB(255, 248, 248, 248),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              height10,
                              Center(
                                child: Text(
                                  'Sign in',
                                  style: header2.copyWith(
                                      fontFamily: Medium,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                              height10,
                              CustomTextFormFields(
                                obscureText: false,
                                contentPadding: const EdgeInsets.only(top: 12),
                                bordercolor: controller.errormessage.value ??
                                    Colors.black12,
                                icons: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                      height: 15,
                                      child: Image.asset(
                                          "assets/images/clarity_user-line.png")),
                                ),
                                mediaquery: mediaquery,
                                controller: controller.emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // return 'Please enter an email address';
                                    return "";
                                  }
                                  return null;
                                },
                                hinttexts: "Email ID",
                                keyboard: TextInputType.emailAddress,
                                boxcolor: Colors.transparent,
                              ),
                              Obx(
                                () => CustomTextFormFields(
                                  maxLine: 1,
                                  minline: 1,
                                  obscureText: controller.isShow.value,
                                  contentPadding:
                                      const EdgeInsets.only(top: 12),
                                  bordercolor: controller.errormessage.value ??
                                      Colors.black12,
                                  icons: const Icon(
                                    Icons.password,
                                    color: Color.fromARGB(255, 165, 165, 165),
                                    size: 20,
                                  ),
                                  mediaquery: mediaquery,
                                  controller: controller.passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      // return 'Please enter an email address';
                                      return "";
                                    }
                                    return null;
                                  },
                                  hinttexts: "Password",
                                  keyboard: TextInputType.visiblePassword,
                                  boxcolor: Colors.transparent,
                                  sufixicon: IconButton(
                                      onPressed: () {
                                        // obscureFunction();
                                        controller.isShow.value =
                                            !controller.isShow.value;
                                      },
                                      icon: controller.isShow.value
                                          ? const Icon(
                                              Icons.visibility_off_outlined,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 165, 165, 165),
                                            )
                                          : const Icon(
                                              Icons.visibility_outlined,
                                              size: 20,
                                              color: Color.fromARGB(
                                                  255, 165, 165, 165),
                                            )),
                                ),
                              ),

                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   child: CustomTextField(
                              //       validator: Validators.noneEmptyValidator,
                              //       hintText: "Email ID",
                              //       keybord: TextInputType.name,
                              //       controls: controller.emailController),
                              // ),
                              height5,
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   child: PasswordTextfield(
                              //       obscureFunction: () {
                              //         controller.isShow.value !=controller.isShow.value;
                              //       },
                              //       validator: Validators.noneEmptyValidator,
                              //       hintText: "Password",
                              //       keybord: TextInputType.name,
                              //       controls: controller.passwordController,
                              //       obscureText: controller.isShow),
                              // ),
                              height10,
                              h1,

                              SubmitButtons(
                                  isLoading: controller.isLoading,
                                  onTap: () {
                                    if (controller.formKey2.currentState!
                                        .validate()) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      log(storage.read('domain').toString());
                                      controller.staffLogin(context);
                                    }
                                  },
                                  text: "Signup"),
                              // SubmitButtons(
                              //     isLoading: controller.isLoading,
                              //     onTap: () {
                              //       if(){}

                              //       FocusManager.instance.primaryFocus?.unfocus();
                              //       log(storage.read('domain').toString());

                              //       controller.staffLogin(context);
                              //     },
                              //     text: "Signup"),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .1,
                              ),
                              Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.keybord,
    required this.controls,
    this.validator,
  });
  final TextEditingController controls;
  final TextInputType keybord;
  final String hintText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enableInteractiveSelection: true,
        controller: controls,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: 10,
                child: Image.asset("assets/images/clarity_user-line.png")),
          ),

          // Icon(
          //   Icons.person_outline_sharp,
          //   color: Color.fromARGB(
          //     255,
          //     103,
          //     103,
          //     103,
          //   ),
          //   size: 24,
          // ),
          contentPadding: const EdgeInsetsDirectional.only(top: 10),
          hintText: hintText,
          hintStyle: TextStyle(
              color: const Color.fromARGB(
                255,
                103,
                103,
                103,
              ),
              fontSize: 16,
              fontFamily: regular),
          //   border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 211, 211, 211), width: 1.0),
          ),
        ),
        validator: validator);
  }
}
