import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/passwordtextFormField.dart';
import '../../../utils/validators.dart';
import '../../daily_note/views/add_dailynote.dart';

class ChangePassword extends StatelessWidget {
  TextEditingController previousPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var isShow = false.obs;
  var isShow2 = false.obs;
  var isShow3 = false.obs;
  var isLoading = false.obs;
  @override
  final GlobalKey<FormState> passwordkey = GlobalKey<FormState>();

  ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              "Change Passowrd",
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                h3,
                CircleAvatar(
                  backgroundColor: bColor2,
                  radius: 10.h,
                  child: Image.asset(
                    'assets/images/changePass.png',
                    width: 15.w,
                    height: 10.h,
                  ),
                ),
                h3,
                Text(
                  'Your New Password Must Be Different',
                  style: header10,
                ),
                h05,
                Text(
                  'from Previously Used Password.',
                  style: header10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                  child: Form(
                    key: passwordkey,
                    child: Column(
                      children: [
                        PasswordTextfield(
                          obscureFunction: () {
                            isShow.value = !isShow.value;
                          },
                          obscureText: isShow3,
                          controls: previousPassword,
                          keybord: TextInputType.name,
                          hintText: "Previous Password",
                          validator: Validators.noneEmptyValidator,
                        ),
                        h3,
                        PasswordTextfield(
                          controls: newPassword,
                          keybord: TextInputType.name,
                          hintText: "New Password",
                          obscureText: isShow,
                          validator: Validators.noneEmptyValidator,
                          obscureFunction: () {
                            isShow.value = !isShow.value;
                          },
                        ),
                        h3,
                        PasswordTextfield(
                          controls: confirmPassword,
                          keybord: TextInputType.name,
                          hintText: "Confirm Password",
                          obscureText: isShow2,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Empty ';
                            }
                            if (val != newPassword.text) {
                              return 'Password Not Matched';
                            }
                            return null;
                          },
                          obscureFunction: () {
                            isShow.value = !isShow.value;
                          },
                        ),
                        h5,
                        h7,
                        SubmitButton(
                            onTap: () {
                              if (passwordkey.currentState!.validate()) {
                                log("zssxcfvgbhjnkm");
                              }
                            },
                            text: "Update")
                      ],
                    ),
                  ),
                ),
                h6,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
