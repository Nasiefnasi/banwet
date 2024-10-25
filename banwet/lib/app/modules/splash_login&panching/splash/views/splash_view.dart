import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/Style/const.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:banwet/app/data/service/notification.service/otification.service.dart';
// import 'package:banwet/app/modules/notification/controllers/notification_controller.dart';
import 'package:banwet/app/modules/splash_login&panching/splash/views/sunpages/leave_splash.dart';
import 'package:banwet/app/modules/splash_login&panching/splash/views/sunpages/no_internet.dart';
import 'package:banwet/app/modules/splash_login&panching/splash/views/sunpages/singoff_screen.dart';
// import 'package:banwet/app/style/const.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../routes/app_pages.dart';
import 'package:flutter/services.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var storage = GetStorage();
  SplashController splashController = Get.put(SplashController());
  NotificationService notificontroller = Get.put(NotificationService());
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    // checkVersion();

    update();
    // _navigate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUpdate();
    });
  }

  update() async {
    await splashController.checkVersion();
    await splashController.appcheckVersion();
    await checkUpdate();
  }

  //
  checkUpdate() async {
    var mediaquery = MediaQuery.of(context).size;
    // Ensure splashController is properly initialized
    if (!_hasNavigated) {
      if (storage.read('isLogin') == true) {
        if (storage.read('isUserLogin') == true) {
          final appUpdateModel = splashController.appupdatemodel;

          // Check if appUpdateModel is not null
          if (appUpdateModel == null) {
            print('App update model is null');
            return;
          }

          final isMajorUpdate = appUpdateModel.updationType == "major";

          // Parsing new version
          final newVersionStr = appUpdateModel.updationStatus.toString();
          if (newVersionStr == null) {
            print('New version string is null');
            return;
          }
          final newVersion = int.tryParse(newVersionStr.replaceAll('.', ''));
          if (newVersion == null) {
            print('New version parsing failed');
            return;
          }

          // Parsing current version
          final input = splashController.appVersion.value.toString();
          final currentVersion = int.tryParse(input.replaceAll('.', ''));
          if (currentVersion == null) {
            print('Current version parsing failed');
            return;
          }
//  (newVersion > currentVersion)
// isMajorUpdate
          // Compare versions
          if (newVersion > currentVersion) {
            if (isMajorUpdate) {
              // Major update dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset("assets/images/cmpLoginLogo.png"),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    title: const Text(
                      textAlign: TextAlign.center,
                      'New Version Available',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    contentPadding: const EdgeInsets.only(top: 5),
                    content: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Please, Update app to new version to continue using',
                      ),
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: <Widget>[
                      h1,
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: bColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Update',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () async {
                              final url =
                                  appUpdateModel.updationLink.toString();
                              if (url != null && await canLaunch(url)) {
                                await launch(url);
                              } else {
                                // Handle URL launch failure
                                print('Could not launch the URL');
                              }
                              SystemNavigator.pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              Get.defaultDialog(
                title: "",
                titleStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 0),
                backgroundColor: Colors.white,
                radius: 10.0,
                content: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image.asset("assets/images/cmpLoginLogo.png"),
                      ),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'New Version Available',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    h2,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      // color: Colors.amber,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Please, Update app to new version to continue using',
                            ),
                          ),
                          h2, // Replace h2 with SizedBox if h2 is a spacer
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: bColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Update',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    final url =
                                        appUpdateModel.updationLink.toString();
                                    if (url != null && await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      print('Could not launch the URL');
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                  width: 10), // Add space between the buttons
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: bColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text(
                                    'Ignore',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Get.back(); // Close the dialog
                                    _navigate(); // Navigate to the next screen or perform other actions
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                barrierDismissible: false,
              );
              // Minor update dialog
              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (BuildContext context) {
              //     return AlertDialog(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       icon: Container(
              //         width: double.infinity,
              //         height: 80,
              //         child: Padding(
              //           padding: const EdgeInsets.all(18.0),
              //           child: Image.asset("assets/images/cmpLoginLogo.png"),
              //         ),
              //       ),
              //       backgroundColor: Colors.white,
              //       title: Text(
              //         'New Version Available',
              //         style:
              //             TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              //       ),
              //       content: Container(height: mediaquery.height*.18,color: Colors.amber,
              //         child: Column(
              //           children: [
              //             const Text(
              //               textAlign: TextAlign.center,
              //               'Please, Update app to new version to continue using',
              //             ),
              //             h2,
              //             Container(
              //               child: Row(
              //                 children: [
              //                   Expanded(
              //                     child: ElevatedButton(
              //                       style: ElevatedButton.styleFrom(
              //                         backgroundColor: bColor,
              //                         shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                         ),
              //                       ),
              //                       child: const Text(
              //                         'Update',
              //                         style: TextStyle(color: Colors.white),
              //                       ),
              //                       onPressed: () async {
              //                         final url =
              //                             appUpdateModel.updationLink?.toString();
              //                         if (url != null && await canLaunch(url)) {
              //                           await launch(url);
              //                         } else {
              //                           // Handle URL launch failure
              //                           print('Could not launch the URL');
              //                         }
              //                       },
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: ElevatedButton(
              //                       style: ElevatedButton.styleFrom(
              //                         backgroundColor: bColor,
              //                         shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.circular(5),
              //                         ),
              //                       ),
              //                       child: const Text(
              //                         'Ignore',
              //                         style: TextStyle(color: Colors.white),
              //                       ),
              //                       onPressed: () {
              //                         Navigator.of(context)
              //                             .pop(); // Close the dialog
              //                         _navigate(); // Navigate to the next screen or perform other actions
              //                       },
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //       // actionsAlignment: MainAxisAlignment.center,
              //       // actionsOverflowButtonSpacing: 2,
              //       // actions: [
              //       //   ElevatedButton(
              //       //     style: ElevatedButton.styleFrom(
              //       //       backgroundColor: bColor,
              //       //       shape: RoundedRectangleBorder(
              //       //         borderRadius: BorderRadius.circular(5),
              //       //       ),
              //       //     ),
              //       //     child: const Text(
              //       //       'Update',
              //       //       style: TextStyle(color: Colors.white),
              //       //     ),
              //       //     onPressed: () async {
              //       //       final url = appUpdateModel.updationLink?.toString();
              //       //       if (url != null && await canLaunch(url)) {
              //       //         await launch(url);
              //       //       } else {
              //       //         // Handle URL launch failure
              //       //         print('Could not launch the URL');
              //       //       }
              //       //     },
              //       //   ),
              //       //   Expanded(
              //       //     child: ElevatedButton(
              //       //       style: ElevatedButton.styleFrom(
              //       //         backgroundColor: bColor,
              //       //         shape: RoundedRectangleBorder(
              //       //           borderRadius: BorderRadius.circular(5),
              //       //         ),
              //       //       ),
              //       //       child: const Text(
              //       //         'Ignore',
              //       //         style: TextStyle(color: Colors.white),
              //       //       ),
              //       //       onPressed: () {
              //       //         Navigator.of(context).pop(); // Close the dialog
              //       //         _navigate(); // Navigate to the next screen or perform other actions
              //       //       },
              //       //     ),
              //       //   ),
              //       // ],
              //     );
              //   },
              // );
            }
          } else {
            _navigate(); // Ensure _navigate is defined
          }
        } else {
          _navigate();
        }
      } else {
        _navigate();
      }
    } else {
      _navigate();
    }
  }

  void _navigate() async {
    // Future.delayed(
    //   Duration(seconds: 1),
    //   () {
    //     Get.to(MyHomePage());
    //   },
    // );
    // if(){}

    // if (double.parse(splashController.appVersion.value.toString()) >=
    //     double.parse(
    //         splashController.appupdatemodel!.updationStatus.toString())) {
    // return null;

    if (!_hasNavigated) {
      await Future.delayed(const Duration(seconds: 1));

      if (storage.read('isLogin') == true) {
        if (storage.read('isUserLogin') == true) {
          splashController.getOnGoing().then((value) {
            final userHomeModel = splashController.userHomeModel;

            if (userHomeModel?.signedOffStatus == 1) {
              Get.to(() => const SignOff());
            } else if (userHomeModel?.attendanceMarked == 1 &&
                userHomeModel?.attendanceStatus == "2") {
              Get.offAll(() => const LeavePage());
            } else if (userHomeModel?.attendanceMarked == 1 &&
                userHomeModel?.signedInStatus == 1 &&
                userHomeModel?.projectAccess == 1 &&
                userHomeModel?.attendanceStatus == "1") {
              notificontroller.getNotification();
              Get.offAllNamed(Routes.HOME_LAYOUT);
            } else if (userHomeModel?.attendanceMarked == 0) {
              Get.toNamed(Routes.ATTENDANCE_MARKING);
            } else {
              Get.to(() => const WaitingPage());
            }
            _hasNavigated = true;
          });
        } else {
          Get.toNamed(Routes.STAFF_LOGIN);
          _hasNavigated = true;
        }
      } else {
        Get.toNamed(Routes.WELCOME);
        _hasNavigated = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bColor,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.white,
              ),
              // Positioned(
              //     child: Lottie.asset('assets/images/SP5.json', height: 900)),
              // Positioned(
              //   bottom: 0,
              //   child: SizedBox(
              //     height: dHeight,
              //     // color: bColor,
              //     child: Lottie.asset('assets/images/splash.json',
              //         height: 300, width: dWidth),
              //   ),
              // ),
              Positioned(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    'assets/images/MY BANWET.png',
                    // color: bColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
