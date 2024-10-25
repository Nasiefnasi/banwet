import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../Style/const.dart';

class WelcomeTextWidegt extends StatelessWidget {
  WelcomeTextWidegt({super.key});
  var storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Welcome',
              style: header2.copyWith(
                  fontSize: 24, color: Colors.black,fontFamily: SemiBold),
            ),
          ),
          h05,
          Text(
            storage.read('username').toString(),
            style: header2.copyWith(
                fontFamily: Medium, fontSize: 20, color:  Colors.black,),
          ),
          height15,
          Text(
            'Register your attendance',
            style: header13.copyWith(
                fontWeight: FontWeight.w500, fontSize: 18, color:  Colors.black,),
          ),
        ],
      ),
    );
  }
}
