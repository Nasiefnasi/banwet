import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../../Style/const.dart';
import '../../../../data/service/auth/staff_lofin.dart';
import '../../../../routes/app_pages.dart';
import '../../splash/views/sunpages/singoff_screen.dart';

class StaffLoginController extends GetxController {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  var storage = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isShow = true.obs;
  RxBool isLoading = false.obs;
  var errormessage = (const Color.fromARGB(255, 211, 211, 211)).obs;

  //  <---------  this funtion using to staff loging --------->
  staffLogin(context) async {
    if (formKey2.currentState!.validate()) {
      isLoading.value = true;
      var result = await StaffLoginAuth().staffLoging(
          emailController.text.trim(),
          passwordController.text.toString().trim());
      if (result["status"]) {
        errormessage.value = Colors.black26;
        storage.write("username", result["user_alias"].toString());
        if (result["attendance_marked"].toString() == "1") {
          Get.toNamed(Routes.HOME_LAYOUT);
          isLoading.value = false;
        }
        if (result["signed_off_status"].toString() == "1" &&
            result["signed_off_status"] == 1) {
          isLoading.value = false;
          print("Sdvsd---------->");
          Get.to(() => const SignOff());
          print("----------- duty sign off -----.");
        } else if (result["project_access_without_duty_sign"].toString() ==
                "0" &&
            result["attendance_marked"].toString() == "0") {
          Get.offAllNamed(Routes.ATTENDANCE_MARKING);
          isLoading.value = false;

          print("**********************7777777777**********");
        } else {
          isLoading.value = false;

          print("-------------  staff verfication failed  -------------");
        }
      } else {
        errormessage.value = Colors.red;
        // verifyFaileldDialog(context, "Username ", "Password");
        isLoading.value = false;
        isLoading.value = false;
      }
    }
  }
}

dynamic getSnackbar(String title, String msg, String lottie) =>
    Get.showSnackbar(GetSnackBar(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      borderRadius: 12,
      title: title,
      messageText: Text(
        msg,
        style: header12,
      ),
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Lottie.asset('assets/images/error1.json',
            width: 50, height: 50, fit: BoxFit.cover),
      ),
      backgroundGradient: LinearGradient(
        colors: [bColor, bColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      snackPosition: SnackPosition.TOP,
      animationDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 1),
    ));
