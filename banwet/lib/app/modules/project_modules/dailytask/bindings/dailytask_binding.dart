import 'package:get/get.dart';

import '../controllers/dailytask_controller.dart';

class DailytaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailytaskController>(
      () => DailytaskController(),
    );
    Get.lazyPut<DailytaskController>(
      () => DailytaskController(),
    );
  }
}
