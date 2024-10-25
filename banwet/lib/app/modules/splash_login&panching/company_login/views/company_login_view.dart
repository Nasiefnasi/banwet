import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/splash_login&panching/attendance_marking/views/attendance_marking_view.dart';

import '../../../../Style/const.dart';
import '../../../Terms & privacy/privacy_policy.dart';
import '../../../Terms & privacy/terms_and_condition.dart';
import '../../../daily_note/views/add_dailynote.dart';
import '../controllers/company_login_controller.dart';

class CompanyLoginView extends GetView<CompanyLoginController> {
  CompanyLoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    final defaultpinethime = PinTheme(
        margin: const EdgeInsets.all(8),
        width: 55,
        height: 55,
        textStyle:
            TextStyle(fontSize: 22, fontFamily: Medium, color: Colors.black),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: .5,
                color: controller.errormessage.value ??
                    const Color.fromARGB(255, 211, 211, 211))));

    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h6,
                Center(
                  child: Image.asset(
                    "assets/images/MY BANWET.png",
                    width: 45.w,
                    height: 30.h,
                  ),
                ),
                h3,
                Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        h5,
                        Center(
                          child: Text(
                            'Company Login',
                            style: header20.copyWith(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ),
                        height5,
                        h3,
                        Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Obx(
                                  () => CustomTextFormFields(
                                    obscureText: false,
                                    bordercolor: Colors.black26,
                                    contentPadding:
                                        const EdgeInsets.only(top: 15, left: 5),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        // return 'Please enter an email address';
                                        return "";
                                      }
                                      return null;
                                    },
                                    errorcolors: controller.errormessage.value,
                                    boxcolor: Colors.transparent,
                                    mediaquery: mediaquery,
                                    controller: controller.clientcode,
                                    inputFormatter: [UpperCaseTextFormatter()],
                                    hinttexts: 'Enter Client Code',

                                    // Padding(
                                    //   padding: const EdgeInsets.all(12),
                                    //   child:Icon(Icons.)
                                    //   //  Image.asset(
                                    //   //   'assets/images/ri_building-line.png',
                                    //   //   color:
                                    //   //       Color.fromARGB(255, 211, 211, 211),
                                    //   // ),
                                    // ),
                                  ),
                                ),
                                height5,
                                Obx(
                                  () => Container(
                                    padding: const EdgeInsets.all(1),
                                    child: Center(
                                      child: Pinput(
                                        controller: controller.clientkey,
                                        onCompleted: (pin) {},
                                        onChanged: (values) {},
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        length: 4,
                                        defaultPinTheme:
                                            defaultpinethime.copyWith(
                                                decoration: defaultpinethime
                                                    .decoration!
                                                    .copyWith(
                                                        border: Border.all(
                                                            width: .8,
                                                            color: controller
                                                                .errormessage
                                                                .value))),
                                        focusedPinTheme:
                                            defaultpinethime.copyWith(
                                                decoration: defaultpinethime
                                                    .decoration!
                                                    .copyWith(
                                                        border: Border.all(
                                                            width: .8,
                                                            color: controller
                                                                .errormessage
                                                                .value))),
                                        errorPinTheme:
                                            defaultpinethime.copyWith(
                                                decoration: defaultpinethime
                                                    .decoration!
                                                    .copyWith(
                                                        border: Border.all(
                                                            width: .8,
                                                            color:
                                                                Colors.red))),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        h5,
                        Column(
                          children: [
                            Text(
                              'By Proceed you are agree to our',
                              style: header2.copyWith(
                                  fontSize: 14,
                                  fontFamily: Medium,
                                  color: Colors.black45),
                            ),
                            const SizedBox(height: 5),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: header2.copyWith(
                                      fontSize: 14,
                                      fontFamily: Medium,
                                      color: Colors.blue,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return const PrivacyPolicy();
                                          },
                                        ));
                                      },
                                  ),
                                  TextSpan(
                                      text: ' & ',
                                      style: header2.copyWith(
                                          fontSize: 14,
                                          fontFamily: Medium,
                                          color: Colors.black45)),
                                  TextSpan(
                                    text: ' Terms & Conditions',
                                    style: header2.copyWith(
                                        fontSize: 14,
                                        fontFamily: Medium,
                                        color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return const TermsAndCondition();
                                          },
                                        ));
                                      },
                                  ),
                                ],
                              ),
                            ),
                            h4
                          ],
                        ),
                        SubmitButtons(
                          isLoading: controller.isloading,
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              controller.errormessage.value =
                                  const Color.fromARGB(255, 211, 211, 211);
                              controller.companyLogin(context);
                            } else {
                              controller.errormessage.value = Colors.red;
                            }
                          },
                          text: "Proceed",
                        ),
                        h8
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
