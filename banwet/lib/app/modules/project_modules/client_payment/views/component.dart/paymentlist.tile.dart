import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/style/const.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile(
      {super.key, required this.id, required this.amount, required this.dates});
  final String id;
  final String amount;
  final String dates;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFF36338C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Receipt ID : ",
                      children: [TextSpan(text: "#$id", style: wheader11)])),
              h1,
              Text(
                  DateFormat('dd MMM yyyy').format(
                    DateFormat('dd-MM-yyyy').parse(
                      dates ?? "",
                    ),
                  ),
                  style: wheader11),
            ],
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(
                      text: "₹ ",
                      style: TextStyle(fontSize: 11.sp),
                      children: [TextSpan(text: amount, style: wheader11)])),
              // Text(
              //   //  startDate.toString(),

              //   "₹${controller.expenseHomeModel!.data![index].payableAmount}",
              //   style: wheader12,
              // ),
              dates.toString() ==
                      DateFormat("dd-MM-y").format(DateTime.now()).toString()
                  ? PopupMenuButton<String>(
                      onSelected: (value) {
                        if ("delete" == value) {
                        } else if ("edite" == value) {
                        } else if (value == "delete") {}
                      },
                      icon: const Icon(Icons.more_vert_outlined,
                          color: Colors.white),
                      surfaceTintColor: Colors.white,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              padding: EdgeInsets.zero,
                              value: "edite",
                              child: Container(
                                padding: EdgeInsets.only(left: 2.h),
                                width: 28.w,
                                height: 3.h,
                                child: const Text(
                                  "Edit",
                                ),
                              )),
                          const PopupMenuItem(
                              value: "delete", child: Text("Delete"))
                        ];
                      })
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
