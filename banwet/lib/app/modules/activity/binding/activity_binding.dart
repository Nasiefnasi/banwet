import 'package:get/get.dart';
import 'package:banwet/app/modules/activity/controllers/activity_controller.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(
      () => ActivityController(),
    );
  }
}
