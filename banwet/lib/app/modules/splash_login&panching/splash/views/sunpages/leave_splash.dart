import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import '../../../../../Style/const.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((_) {
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
            Lottie.asset('assets/images/LE1.json', height: 120),
            height4,
            Text(
              'Attendance Marked',
              style: header4.copyWith(fontSize: 25),
            ),
            height3,
            Text(
              'On Leave',
              style: header4.copyWith(fontSize: 28, color: Colors.red),
            ),
          ],
        )));
  }
}
