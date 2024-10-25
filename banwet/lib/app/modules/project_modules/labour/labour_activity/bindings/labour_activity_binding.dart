import 'package:get/get.dart';

import '../controllers/labour_activity_controller.dart';

class LabourActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabourActivityController>(
      () => LabourActivityController(),
    );
  }
}
