// import 'dart:async';
//
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'package:lottie/lottie.dart';
// import 'package:banwet/app/modules/splash_login&panching/splash/views/splash_view.dart';
//
// import '../../../../Style/const.dart';
// import '../controllers/splash_controller.dart';
//
// class SplashShow extends StatefulWidget {
//   const SplashShow({Key? key}) : super(key: key);
//
//   @override
//   State<SplashShow> createState() => _SplashShowState();
// }
// SplashController splashController = Get.put(SplashController());
//
// class _SplashShowState extends State<SplashShow> {
//   @override
//   Widget build(BuildContext context) {
//     Timer( const Duration(microseconds: 0), () async {
//       await Future.delayed(const Duration(microseconds: 0));
//
//     });
//     return  Container(
//       color: bColor,
//       child: SafeArea(
//
//         child: Scaffold(
//
//           body: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 color: Colors.white,
//               ),
//               Positioned(child: Lottie.asset('assets/images/SP5.json', height: 900)),
//               Positioned(
//                 bottom: 0,
//                 child: SizedBox(
//                   height: dHeight,
//                   // color: bColor,
//                   child: Lottie.asset('assets/images/splash.json',
//                       height: 300, width: dWidth),
//                 ),
//               ),
//               Positioned(
//                 child: SizedBox(
//                   height: 150,
//                   width: 150,
//                   child: AnimatedSplashScreen(
//                       backgroundColor: Colors.white,
//                       splash: Image.asset(
//                         'assets/images/MY BANWET.png',
//                         color: bColor,
//                       ),
//
//                       splashTransition: SplashTransition.fadeTransition, nextScreen:SplashView()
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
