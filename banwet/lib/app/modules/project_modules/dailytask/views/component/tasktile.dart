import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/style/const.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    this.index,
    required this.tasktitle,
    required this.dueDate,
    required this.status,
  }) : super(key: key);
  final index;
  final String tasktitle;
  final String dueDate;
  final String status;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Adjust as needed
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12), // Adjust the border radius
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade400
          //         .withOpacity(0.3), // Adjust the shadow color and opacity
          //     spreadRadius: 2, // Adjust the spread radius
          //     blurRadius: 5, // Adjust the blur radius
          //     offset: const Offset(0, 3), // Adjust the position of the shadow
          //   ),
          // ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 80,
              decoration: BoxDecoration(
                color: bColor,
                border: Border.all(
                    color: bColor,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    width: 2),
                borderRadius: BorderRadius.circular(
                  5,
                ),

                // Add border properties if needed
                // border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/task.svg",
                  height: 30,
                  width: 30,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 8), // Add spacing between image and text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // color: Colors.amber,
                      width: mediaquery.width * .40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            tasktitle,
                            style: header12.copyWith(
                                fontFamily: Medium, fontSize: 12.sp),
                          ),
                          h1,
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: "Due Date: ",
                              style: header13.copyWith(
                                  color: const Color(0xff898989),
                                  fontSize: 10.sp,
                                  fontFamily: regular),
                              children: [
                                TextSpan(
                                  text: dueDate,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff898989),
                                      fontFamily: SemiBold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        status,
                        style: header11.copyWith(
                          color: status == "Pending"
                              ? const Color(0xffe10000)
                              : status == "Completed"
                                  ? const Color(0xff18a900)
                                  : const Color(0xffe7b400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
