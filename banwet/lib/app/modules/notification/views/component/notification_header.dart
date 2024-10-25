import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/style/const.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21.h,
      width: dWidth,
      decoration: BoxDecoration(
          color: bColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
    );
  }
}
