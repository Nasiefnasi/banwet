import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:banwet/app/modules/splash_login&panching/splash/controllers/appupdatemodel.dart';

import '../../../../data/model/user/use_home.dart';
import '../../../../data/service/auth/getuserdata.dart';
import '../../../../routes/app_pages.dart';
import '../views/sunpages/leave_splash.dart';
import '../views/sunpages/no_internet.dart';
import '../views/sunpages/singoff_screen.dart';

class SplashController extends GetxController {
  var storage = GetStorage();
  final RxString appVersion = "".obs;
  final RxString device = "".obs;
  Future<void> checkVersion() async {
    // Retrieve package information
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Set the version value for both iOS and Android
    appVersion.value = packageInfo.version.toString();

    // Print version information
    print(
        "App version eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee: ${appVersion.value}");

    if (Platform.isIOS) {
      device.value = "ios";
      print("Platform: iOS");
    } else if (Platform.isAndroid) {
      device.value = "android_hybrid";
      print("Platform: Android");
    } else {
      print("Platform: Other");
    }
  }

  Appupdatemodel? appupdatemodel;
  Future appcheckVersion() async {
    // checkiosand

    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}login/app_update?app=${device.value}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();

    if (response.statusCode == 200 || response.statusCode == 201) {
      appupdatemodel = appupdatemodelFromJson(responsebody.toString());

      // print(await response.stream.bytesToString());
    } else {
      appupdatemodel = null;
      print(response.reasonPhrase);
    }
  }

//    void checkVersion(BuildContext context) {
//   final newVersion = NewVersionPlus(androidId: "com.example.banwet",);
//   final status = newVersion.getVersionStatus();

//   newVersion.showUpdateDialog(
//     context: context,
//     versionStatus: status,
//     dialogTitle: "Update",
//     dialogText: 'Custom dialog text',
//     updateButtonText: 'Lets Update',
//     dismissButtonText: 'Custom dismiss button text',
//     dismissAction: () {SystemNavigator.pop();
//       // Function to run after dialog is dismissed
//       // For example, you might want to log or perform some action
//       print('Update dialog dismissed');
//     },
//   );
// }

  // this funnction using to  getting user full details
  UserHomeModel? userHomeModel;
  Future<void> getOnGoing() async {
    var result = await GetUserdata().fetchOnGoing();

    userHomeModel = result;
    storage.write('late', userHomeModel!.signedInRemarks);
    storage.write('username', userHomeModel!.name);
    update();
  }

  routingFunction() {
    Timer(const Duration(milliseconds: 2), () async {
      await Future.delayed(const Duration(milliseconds: 2));

      if (storage.read('isLogin').toString() == true.toString()) {
        if (storage.read('isUserLogin').toString() == true.toString()) {
//   <----- this statemnet cheking user onduty or leave then move to attentence marking page
          getOnGoing().then((value) {
            if (userHomeModel!.signedOffStatus.toString() == "1") {
              Get.to(() => const SignOff());
            } else if (userHomeModel!.attendanceMarked == 1 &&
                userHomeModel!.attendanceStatus.toString() == "2") {
              Get.offAll(() => const LeavePage());
            } else if (userHomeModel!.attendanceMarked == 1 &&
                userHomeModel!.signedInStatus == 1 &&
                userHomeModel!.projectAccess == 1 &&
                userHomeModel!.attendanceStatus.toString() == "1") {
              Get.offAllNamed(Routes.HOME_LAYOUT);
            } else if (userHomeModel!.attendanceMarked.toString() == "0") {
              Get.toNamed(Routes.ATTENDANCE_MARKING);
            } else {
              Get.to(() => const WaitingPage());
            }

            if (userHomeModel!.attendanceMarked.toString() == "0" &&
                userHomeModel!.projectAccessWithoutDutySign.toString() == "0") {
              Get.toNamed(Routes.ATTENDANCE_MARKING);
            } else if (userHomeModel!.attendanceMarked.toString() == "1" &&
                userHomeModel!.attendanceStatus == "1") {
              Get.offNamed(Routes.HOME_LAYOUT);
              print("<==========    move to home page ===========");
            } else if (userHomeModel!.attendanceMarked.toString() == "1" &&
                userHomeModel!.attendanceStatus.toString() == "2") {
              Get.offAll(() => const LeavePage());
            } else if (userHomeModel!.attendanceMarked.toString() == "1" &&
                userHomeModel!.attendanceStatus.toString() == "1" &&
                userHomeModel!.attendanceStatus.toString() == "1") {
              Get.to(() => const SignOff());
            }

            //   <----- this statemnet cheking user onduty or leave then move to home screen

            //   <----- this statemnet cheking user onduty or leave then move to Leve screen
          });
        } else {
          Get.toNamed(Routes.STAFF_LOGIN);
        }
      } else {
        Get.toNamed(Routes.WELCOME);
      }
    });
  }
}
