import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:banwet/app/style/const.dart';

class SelectedTaskListTile extends StatelessWidget {
  const SelectedTaskListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE3E3E3)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 3,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/svg/greentick.svg"),
              w2,
              Text(
                "Activity title 01",
                style: header12,
              )
            ],
          ),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum Lorem dummy text of the printing  "),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: const TextSpan(
                      text: "Updated on: ",
                      style: TextStyle(
                        color: Color(0xFF5A5A5A),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                      ),
                      children: [
                    TextSpan(
                      text: "12 - 03 - 2024",
                      style: TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.12,
                      ),
                    )
                  ])),
              SvgPicture.asset("assets/svg/delete.svg")
            ],
          ),
        ],
      ),
    );
  }
}
