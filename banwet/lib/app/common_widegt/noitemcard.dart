import 'package:flutter/material.dart';
import '../Style/const.dart';

class NoItemCard extends StatelessWidget {
  const NoItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: //200,
            dHeight! * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/N1.png',
              color: bColor,
              height: //200
                  dHeight! * 0.2,
            ),
            height6,
            Text(
              'No notification yet !',
              style: header2.copyWith(fontSize: 23),
            )
          ],
        ));
  }
}
