import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';


class AddRquestContainer extends StatelessWidget {
  const AddRquestContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: 43.w,
      decoration:
          BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 29.sp,
          ),
          Text(
            text,
            style: wheader5,
          )
        ],
      ),
    );
  }
}
