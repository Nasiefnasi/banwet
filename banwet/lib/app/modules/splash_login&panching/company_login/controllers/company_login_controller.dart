import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/service/auth/company_login.dart';
import '../views/verifyscreen.dart';

class CompanyLoginController extends GetxController {
  AuthHelper authHelper = AuthHelper();
  TextEditingController clientcode = TextEditingController();
  TextEditingController clientkey = TextEditingController();
  String? Clientkey;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isloading = false.obs;
  var isShow = true.obs;
  var errormessage =
      (const Color.fromARGB(255, 211, 211, 211)).obs; // Observable Color

  //  <---------------- this function used verify the company ----->
  companyLogin(context) async {
    isloading.value = true;
    var result = await authHelper.loginUser(
        clientcode.text.trim(), clientkey.text.trim().toString());
    log(result.toString());
    if (result == "true") {
      errormessage.value = const Color.fromARGB(255, 211, 211, 211);
      Get.to(() => const VerifySplash());
      isloading.value = false;
    } else if (result == "false") {
      errormessage.value = Colors.red;
      isloading.value = false;
    }
  }
}
