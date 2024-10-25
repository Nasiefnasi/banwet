import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nonet.png',
              height: 150,
              width: 150,
            ),
            h3,
            Text(
              'No Connection',
              style: header1.copyWith(color: bColor),
            ),
            h2,
            Text(
              'No internet connection found. Check your',
              style: header3.copyWith(),
            ),
            Text(
              'connection or try again',
              style: header3.copyWith(),
            ),
            h3,
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 45,
                width: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22), color: bColor),
                child: Center(child: Text('TRY AGAIN', style: wheader3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SpinKitThreeBounce(
                size: 25.sp,
                color: bColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
