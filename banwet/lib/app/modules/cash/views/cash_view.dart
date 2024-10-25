import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/style/const.dart';

import '../controllers/cash_controller.dart';
import 'leadger.view.dart';

class CashView extends GetView<CashController> {
  const CashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 65,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Transaction',
              style: header2.copyWith(
                fontFamily: Medium,
                fontSize: 18.sp,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Rowtext(text: "Cash Overview "),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Cash Overview",
                        style: popin16W400.copyWith(
                          color: Colors.black,
                          fontFamily: Medium,
                        )),
                  ),

                  h2, // CashCard(),

                  Obx(() => Row(
                        children: [
                          CashContainer(
                              text: "Received",
                              amount: controller.cashModel.value
                                          .totalUserPaymentsReceived ==
                                      null
                                  ? loadingthreebounce2
                                  : Text(
                                      "${controller.cashModel.value.totalUserPaymentsReceived}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Medium,
                                          color: Colors.white),
                                    )),
                          w2,
                          CashContainer(
                            text: "Returned",
                            amount: controller.cashModel.value
                                        .totalUserPaymentsReturned ==
                                    null
                                ? loadingthreebounce2
                                : Text(
                                    "${controller.cashModel.value.totalUserPaymentsReturned}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: Medium,
                                        color: Colors.white),
                                  ),
                          )
                        ],
                      )),
                  h2,
                  Obx(() => Row(
                        children: [
                          CashContainer(
                              text: "Spent",
                              amount: controller
                                          .cashModel.value.totalExpenseAmount ==
                                      null
                                  ? loadingthreebounce2
                                  : Text(
                                      "${controller.cashModel.value.totalExpenseAmount}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: Medium,
                                          color: Colors.white),
                                    )),
                          w2,
                          CashContainer(
                            text: "Balance",
                            amount:
                                controller.cashModel.value.totalBalance == null
                                    ? loadingthreebounce2
                                    : Text(
                                        textAlign: TextAlign.right,
                                        overflow: TextOverflow.clip,
                                        "${controller.cashModel.value.totalBalance}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: Medium,
                                            color: Colors.white),
                                      ),
                          )
                        ],
                      )),
                  h8,
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Get.to(() => LedgerView());
                  //     },
                  //     child: Container(
                  //       alignment: Alignment.center,
                  //       width: 188,
                  //       height: 60,
                  //       decoration: ShapeDecoration(
                  //         color: const Color.fromARGB(250, 240, 240, 240),
                  //         shape: RoundedRectangleBorder(
                  //           side: const BorderSide(
                  //               width: 1,
                  //               color: Color.fromARGB(255, 200, 198, 198)),
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         //   // shadows: const [
                  //         //   //   BoxShadow(
                  //         //   //     color: Color(0x3F000000),
                  //         //   //     blurRadius: 4,
                  //         //   //     offset: Offset(0, 4),
                  //         //   //     spreadRadius: 0,
                  //         //   //   )
                  //         //   // ],
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             'View Ledger ',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: Colors.black,
                  //               fontSize: 18,
                  //               fontFamily: regular,
                  //               // fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //           w2,
                  //           Container(
                  //               width: 24,
                  //               height: 24,
                  //               child: Image.asset(
                  //                   "assets/images/viewledger.png")),
                  //         ],
                  //       ),
                  //       // child: ElevatedButton.icon(
                  //       //     icon: Image.asset("assets/images/hugeicons_note-done.png"),
                  //       //     onPressed: () {},
                  //       //     label: Text(
                  //       //       "View  Ledger",
                  //       //       style:
                  //       //           TextStyle(fontSize: 18, fontFamily: regular),
                  //       //     )),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )),
    );
  }
}

class Rowtext extends StatelessWidget {
  const Rowtext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0), color: bColor),
        ),
        width10,
        Text(
          text,
          style: header2,
        ),
      ],
    );
  }
}

class CashCard extends GetView<CashController> {
  CashCard({super.key});
  CashController cashController = Get.put(CashController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dHeight! * .2,
      width: dWidth,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: bColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height6,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Balance',
                  style: wheader2.copyWith(fontSize: 23),
                ),
                Image.asset(
                  'assets/images/cash.png',
                  height: 40,
                  width: 40,
                )
              ],
            ),
            h2,
            Row(
              children: [
                Expanded(
                  child:
                      Obx(() => controller.cashModel.value.totalBalance == null
                          ? loadingthreebounce3
                          : Text(
                              '₹ ${controller.cashModel.value.totalBalance}',
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => LedgerView());
                    },
                    child: Container(
                      height: 4.7.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                      child: Center(
                          child: Text(
                        'LEDGER ',
                        style: header13,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WalletBox extends StatelessWidget {
  const WalletBox(
      {super.key,
      required this.text,
      required this.icon,
      required this.amount});
  final String text;
  final IconData icon;
  final Widget amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dHeight! * 0.19,
      width: dWidth! * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height6,
            Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: Icon(
                  icon,
                  color: Colors.black,
                )),
            height6,
            Row(
              children: [
                const Text(
                  '₹ ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                amount
                // Text(
                //   amount,
                //   style: GoogleFonts.poppins(
                //       fontSize: 20, fontWeight: FontWeight.w500),
                // ),
              ],
            ),
            Text(
              text,
              style: header3,
            )
          ],
        ),
      ),
    );
  }
}

class CashContainer extends StatelessWidget {
  const CashContainer({super.key, required this.text, required this.amount});
  final String text;
  final Widget amount;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        // height: mediaquery.height * .13,
        width: mediaquery.width * 0.4,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.h),
        decoration: ShapeDecoration(
          color: bColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            // BoxShadow(
            //   color: Color(0x3F000000),
            //   blurRadius: 4,
            //   offset: Offset(0, 4),
            //   spreadRadius: 0,
            // )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: 21,
                child: SvgPicture.asset("assets/svg/indian-rupee.svg")),
            w2,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     width: 21,
                //     child: SvgPicture.asset("assets/svg/indian-rupee.svg")),
                amount,
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    text,
                    style: header2.copyWith(
                        color: Colors.white, fontSize: 14, fontFamily: light),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
