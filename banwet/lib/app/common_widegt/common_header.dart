import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../Style/const.dart';

class CommonTitile extends StatelessWidget {
  CommonTitile({
    super.key,
    required this.onpress,
    required this.text,
    this.left,
  });
  Function() onpress;
  final String text;
  late bool? left = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            left == false
                ? Container(
                    height: 30,
                    width: 30,
                    color: Colors.amber,
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 30,
                    ),
                  )
                : const SizedBox(),
            width5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: header15,
                ),
              ],
            )
          ],
        ),
        GestureDetector(
            onTap: () {
              onpress();
            },
            child: Lottie.asset("assets/images/Jp7tjlAjLj.json",

                // 'assets/images/Jp7tjlAjLj.json',
                height: 7.h,
                width: 20.w))
      ],
    );
  }
}

commenContainer(String? amount, String? type) {
  return Expanded(
    child: Container(
      height: 7.h,
      // width: 40.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffdfdfdf)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(type!, style: TextStyle(fontSize: 11, fontFamily: regular)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('₹',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5.sp,
                  )),
              w1,
              Text(
                amount!,
                style: header12.copyWith(
                    color: Colors.black,
                    fontSize: 13.5.sp,
                    fontFamily: Medium,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
