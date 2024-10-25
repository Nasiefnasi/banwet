import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app/Style/const.dart';
import 'app/modules/splash_login&panching/splash/bindings/splash_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  GoogleFonts();
  GoogleFonts.poppins();
  // await Upgrader.clearSavedSettings();
  // Get.put(
  //     HomeLayoutController()); // Replace HomeLayoutController with your actual controller name.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: "Application",
        initialBinding: SplashBinding(), // Bind the SplashController
        initialRoute: Routes.SPLASH,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: bColor,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light)),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: bColor),
        ),
      );
    });
  }
}
