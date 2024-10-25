import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../../Style/const.dart';

class SignOff extends StatefulWidget {
  const SignOff({Key? key}) : super(key: key);

  @override
  State<SignOff> createState() => _SignOffState();
}

class _SignOffState extends State<SignOff> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((_) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/signoff.json', height: 180),
            height3,
            Text(
              'You have been',
              style: header4.copyWith(fontSize: 25),
            ),
            Text(
              'Signed Off Duty Today',
              style: header4.copyWith(fontSize: 25),
            ),
          ],
        )));
  }
}
