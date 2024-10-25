import 'package:get/get.dart';
import 'package:banwet/app/modules/notification/bindings/notification_binding.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    NotificationBinding();
  }
}
