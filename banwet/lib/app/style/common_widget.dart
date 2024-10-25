import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonAppBar extends StatelessWidget {
  final body;
  String? text;
  CommonAppBar({
    required this.body,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(22, 22, 97, 1),
      child: SafeArea(
          bottom: false,
          child: Scaffold(
              appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.black,
                        size: 15.sp,
                      )),
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 1.3,
                  centerTitle: true,
                  title: Text(
                    text!,
                  )),
              backgroundColor: Colors.white,
              body: body)),
    );
  }
}

listHeading() {
  return Container(
    height: 5.h,
    width: 100.w,
    color: const Color.fromRGBO(22, 22, 97, 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Date', style: TextStyle(fontSize: 11.sp)),
        Text('From', style: TextStyle(fontSize: 11.sp)),
        Text('Quality', style: TextStyle(fontSize: 11.sp)),
        Text('Remarks', style: TextStyle(fontSize: 11.sp)),
      ],
    ),
  );
}
