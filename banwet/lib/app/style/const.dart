import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
// import 'package:banwet/Controller/AuthController/auth_controller.dart';

// ignore: prefer_typing_uninitialized_variables
var idd;
var contractId;
var pNames;
var data;
var miniupdate;
// ignore: prefer_typing_uninitialized_variables

// var uid=AuthController().postD.value.userId.toString();
class APIURL {
  static String baseUrl = 'https://test.smartbuildapp.com/api/';
}

var header1 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700);

var header2 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500);

var header3 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500);

var header4 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.w500);

var header5 = GoogleFonts.quicksand(
    color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500);

var header6 = GoogleFonts.quicksand(
    color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500);

var header7 = GoogleFonts.quicksand(
    color: Colors.black, fontSize: 8, fontWeight: FontWeight.w500);
var header8 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 8.sp, fontWeight: FontWeight.w500);
var header9 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 9.sp, fontWeight: FontWeight.w500);
var header10 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 10.sp, fontWeight: FontWeight.w500);
var header11 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 11.sp, fontWeight: FontWeight.w500);
var header12s = GoogleFonts.poppins(
    color: Colors.black54, fontSize: 12.sp, fontWeight: FontWeight.w500);
var header12 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w500);
var header13 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.w500);
var header14 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500);
var header15 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w500);
var header16 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500);
var header17 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w500);
var header18 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500);
var header19 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 19.sp, fontWeight: FontWeight.w500);
var header20 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w500);
var header21 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 21.sp, fontWeight: FontWeight.w500);
var header22 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w500);
var header23 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 23.sp, fontWeight: FontWeight.w500);
var header24 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w500);
var header25 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.w500);
var header26 = GoogleFonts.poppins(
    color: Colors.black, fontSize: 26.sp, fontWeight: FontWeight.w500);
// var headercardtitle =
//     GoogleFonts.poppins(color: Colors.black, fontSize: 26.sp, f);

/// White

var wheader1 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);

var wheader2 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);

var wheader3 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

var wheader4 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w500);

var wheader5 = GoogleFonts.quicksand(
    color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500);

var wheader6 = GoogleFonts.quicksand(
    color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500);

var wheader7 = GoogleFonts.quicksand(
    color: Colors.white, fontSize: 8, fontWeight: FontWeight.w500);
var wheader8 = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 8.sp,
  fontWeight: FontWeight.w500,
);
var wheader9 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 9.sp, fontWeight: FontWeight.w500);
var wheader10 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.w500);
var wheader11 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.w500);
var wheader12 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w500);
var wheader13 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w500);
var wheader14 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500);
var wheader15 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500);
var wheader16 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500);
var wheader17 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 17.sp, fontWeight: FontWeight.w500);
var wheader18 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500);
var wheader19 = GoogleFonts.poppins(
    color: Colors.white, fontSize: 19.sp, fontWeight: FontWeight.w500);
//  poppins font
var regular = "Poppins-Regular";
var SemiBold = "Poppins-SemiBold";
var Bold = "Poppins-Bold";
var Medium = "Poppins-Medium";
var light = "Poppins-Light";

/// BackgroundColor
// var bColor = const Color(0xFF36338C);
var bColor = const Color.fromARGB(255, 0, 106, 151);
var bColor2 = const Color.fromRGBO(241, 244, 253, 1);
var bColor3 = Colors.green;
var inProgress = const Color(0xffe7b400);
var sucess = const Color(0xff18a900);
var pending = const Color(0xffc70000);

/// MEDIAQUERY

double? dWidth;
double? dHeight;

/// SIZED BOX

var h03 = SizedBox(
  height: 0.3.h,
);
var h04 = SizedBox(
  height: 0.4.h,
);
var h05 = SizedBox(
  height: 0.5.h,
);

var height3 = SizedBox(
  height: dHeight! * .007,
);
var height4 = SizedBox(
  height: dHeight! * .01,
);

var height5 = SizedBox(
  height: dHeight! * .02,
);
var height6 = SizedBox(
  height: dHeight! * .03,
);
var height10 = SizedBox(
  height: dHeight! * .04,
);
var height14 = SizedBox(height: dHeight! * .05);
var height15 = SizedBox(
  height: dHeight! * .06,
);
var height20 = SizedBox(
  height: dHeight! * .08,
);
var height25 = SizedBox(
  height: dHeight! * .10,
);
var height30 = SizedBox(
  height: dHeight! * .12,
);
var h1 = SizedBox(
  height: 1.h,
);
var h2 = SizedBox(
  height: 2.h,
);
var h3 = SizedBox(
  height: 3.h,
);
var h4 = SizedBox(
  height: 4.h,
);

var h5 = SizedBox(
  height: 5.h,
);
var h6 = SizedBox(
  height: 6.h,
);
var h7 = SizedBox(
  height: 7.h,
);
var h8 = SizedBox(
  height: 8.h,
);
var h9 = SizedBox(
  height: 9.h,
);
var h10 = SizedBox(
  height: 10.h,
);
var h11 = SizedBox(
  height: 11.h,
);
var h12 = SizedBox(
  height: 12.h,
);
var h13 = SizedBox(
  height: 13.h,
);
var h14 = SizedBox(height: 14.h);
var h15 = SizedBox(
  height: 15.h,
);
var h16 = SizedBox(
  height: 16.h,
);
var h17 = SizedBox(
  height: 17.h,
);
var h18 = SizedBox(
  height: 18.h,
);
var h20 = SizedBox(
  height: 20.h,
);
var h25 = SizedBox(
  height: 25.h,
);
var h30 = SizedBox(
  height: 30.h,
);
var w05 = SizedBox(
  width: 0.5.w,
);
var w1 = SizedBox(
  width: 1.w,
);
var w2 = SizedBox(
  width: 2.w,
);
var w3 = SizedBox(
  width: 3.w,
);
var w4 = SizedBox(
  width: 4.w,
);

var w5 = SizedBox(
  width: 5.w,
);
var w6 = SizedBox(
  width: 6.w,
);
var w7 = SizedBox(
  width: 7.w,
);
var w10 = SizedBox(
  width: 10.w,
);
var w11 = SizedBox(
  width: 11.w,
);
var w12 = SizedBox(
  width: 12.w,
);
var w14 = SizedBox(width: 14.w);
var w15 = SizedBox(
  width: 15.w,
);
var w16 = SizedBox(
  width: 16.w,
);
var w17 = SizedBox(
  width: 17.w,
);
var w20 = SizedBox(
  width: 20.w,
);
var w25 = SizedBox(
  width: 25.w,
);
var w30 = SizedBox(
  width: 30.w,
);

var width5 = SizedBox(
  width: 5.w,
);
var width10 = SizedBox(
  width: 10.w,
);
var width15 = SizedBox(
  width: 15.w,
);
const width20 = SizedBox(
  width: 20,
);
const width25 = SizedBox(
  width: 25,
);
const width30 = SizedBox(
  width: 30,
);

class NoProject extends StatelessWidget {
  const NoProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: dHeight! * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   'assets/images/No data-pana.svg',
          //   // color: bColor,
          //   height: dHeight! * 0.2,
          // ),
          // height6,
          // Text(
          //   'No Projects yet !',
          //   style: header2.copyWith(fontSize: 25),
          // )
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: Center(
              child: Lottie.asset(
                  repeat: false, "assets/images/qrbRtDHknE.json", height: 250),
            ),
          )
        ],
      ),
    ));
  }
}

class SpinCircle extends StatelessWidget {
  const SpinCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: dHeight! * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitThreeBounce(
                size: 25.sp,
                color: bColor,
              ),
            ],
          )),
    );
  }
}

commonAdd() {
  return Lottie.asset('assets/images/Jp7tjlAjLj.json',
      height: 7.h, width: 20.w);
}

purchaeImage() {
  return Lottie.asset(
    'assets/images/cartLottie.json',
    height: 7.h,
    width: 20.w,
    delegates: LottieDelegates(
      values: [
        ValueDelegate.colorFilter(
          [],
          value: ColorFilter.mode(bColor, BlendMode.src),
        ),
      ],
    ),
  );
}

cImage(
  String? img,
) {
  return CachedNetworkImage(
    imageUrl: img.toString(),
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

paidAmount() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/2174/2174598.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

paymentMode() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/1989/1989125.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

billPayableAmt() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/1989/1989125.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

taxPersent() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/9332/9332354.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

consinee() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/1358/1358533.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

billRemarks() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/3731/3731896.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

userAccount() {
  return CachedNetworkImage(
    imageUrl: "https://cdn-icons-png.flaticon.com/512/2354/2354573.png",
    color: Colors.grey,
    height: 3.h,
    width: 7.w,
    placeholder: (context, url) => const SizedBox(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

rupees() {
  return const Text(
    "₹ ",
    style: TextStyle(color: Colors.white),
  );
}

rupeesBlack() {
  return const Text(
    "₹ ",
    style: TextStyle(color: Colors.black),
  );
}

var popin16W400 = GoogleFonts.poppins(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);
var popin16W500 = GoogleFonts.poppins(
  fontSize: 22,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

var popin22W500 = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 22,
  // fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  height: 0.06,
);

var popin14W300 = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w300,
  height: 0.10,
);

var popin15W300 = GoogleFonts.poppins(
  color: const Color(0xFF515151),
  fontSize: 15,
  // fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
  // height: 0.09,
);

var popin18W400 = const TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
  // height: 0.08,
);

var popin14W400 = GoogleFonts.poppins(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 0.10,
);
