import 'package:flutter/material.dart';
// import 'package:flutter_svg/.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../Style/const.dart';

class SubmitDone extends StatefulWidget {
  const SubmitDone({Key? key, this.message, this.time}) : super(key: key);
  final String? message;
  final int? time;
  @override
  State<SubmitDone> createState() => _SubmitDoneState();
}

class _SubmitDoneState extends State<SubmitDone> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.time ?? 2000)).then((_) {
      //  Get.toNamed("/signIn");
      Get.back(result: "helo");
      Get.back(result: "helo");

//  Get.offNamedUntil(Routes.MY_TEAMS, ModalRoute.withName(Routes.CONTEST),)      // Get.to(()=> RequestHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/mBanxpdFUu.json",
                repeat: false,
                // assets/images/submitDone.json
                // ,
                height: 23.h),
            // h1,
            Text(
              'Submitted Successfully',
              style: header21,
            ),
            // Center(child:
            // Text('Your Company Login Verified Successfully',style: header4.copyWith(fontSize: 17,color: Colors.black54),
            // )
            //   ),
            h1,
            Text(
              textAlign: TextAlign.center,
              widget.message ?? "",
              style: header4.copyWith(fontSize: 17, color: Colors.black54),
            ),
          ],
        )));
  }
}

class Approvecheck extends StatefulWidget {
  const Approvecheck({Key? key, this.content, this.findrejected})
      : super(key: key);
  final content;
  final findrejected;
  @override
  State<Approvecheck> createState() => _ApprovecheckState();
}

class _ApprovecheckState extends State<Approvecheck> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000)).then((_) {
      //  Get.toNamed("/signIn");
      Get.back(result: "helo");
      Get.back(result: "helo");

//  Get.offNamedUntil(Routes.MY_TEAMS, ModalRoute.withName(Routes.CONTEST),)      // Get.to(()=> RequestHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.findrejected == "2"
                ? Lottie.asset("assets/images/rQpFz75BuU.json",
                    repeat: false,
                    // assets/images/submitDone.json
                    // ,
                    height: 23.h)
                : Lottie.asset("assets/images/mBanxpdFUu.json",
                    repeat: false,
                    // assets/images/submitDone.json
                    // ,
                    height: 23.h),
            // h1,
            Text(
              textAlign: TextAlign.center,
              widget.content.toString(),
              style: header19,
            ),
            // Center(child:
            // Text('Your Company Login Verified Successfully',style: header4.copyWith(fontSize: 17,color: Colors.black54),
            // )
            //   ),
            //  Text('is confirmed',style: header4.copyWith(fontSize: 17,color: Colors.black54),),
          ],
        )));
  }
}

uploadBill(
    {required void Function() onTapGAllery,
    required void Function() onTapCamera}) {
  return Container(
      height: 23.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.h))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTapGAllery();
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                  w4,
                  Text(
                    "Gallery",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
          h2,
          GestureDetector(
            onTap: () {
              onTapCamera();
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                  w4,
                  Text(
                    "Camera",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
        ],
      ));
}

// class NoItemWidget extends StatelessWidget {
//   const NoItemWidget({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     var mediaquery = MediaQuery.of(context).size;
//     return Center(
//         child: SizedBox(
//       height: dHeight! * 0.45,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           h11,
//           Center(
//             child: Lottie.asset(
//                 repeat: false, "assets/images/qrbRtDHknE.json", height: 250),
//           ),
//           // Center(
//           //                     child: Container(
//           //                       // width: mediaquery.width * .5,
//           //                       // height: mediaquery.height * .5,
//           //                       child: Center(
//           //                         child: Lottie.asset(
//           //                             repeat: false, "assets/images/qrbRtDHknE.json"),
//           //                       ),
//           //                     ),
//           //                   ),
//           // SvgPicture.asset(
//           //   'assets/images/No data-pana.svg',
//           //   // color: bColor,
//           //   height: dHeight! * 0.15,
//           // ),
//           // height6,//
//           // Text(
//           //   'No $text Founded on Selected Period!',
//           //   textAlign: TextAlign.center,
//           //   style: header2.copyWith(fontSize: 20),
//           // )
//         ],
//       ),
//     ));
//   }
// }
