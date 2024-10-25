import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../Style/const.dart';
import '../../../../routes/app_pages.dart';

class VerifySplash extends StatefulWidget {
  const VerifySplash({Key? key}) : super(key: key);

  @override
  State<VerifySplash> createState() => _VerifySplashState();
}

class _VerifySplashState extends State<VerifySplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1700)).then((_) {
      //  Get.toNamed("/signIn");
      Get.offAllNamed(Routes.STAFF_LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/images/neww.json',
                    height: 180, repeat: false),
                height3,
                Text(
                  'Company Verified',
                  style: header4.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  textAlign: TextAlign.center,
                  'Your Company Login Verified\nSuccessfully',
                  style: header4.copyWith(fontSize: 15, color: Colors.black54),
                )),
                //  Text('is confirmed',style: header4.copyWith(fontSize: 17,color: Colors.black54),),
              ],
            ))),
      ),
    );
  }
}
