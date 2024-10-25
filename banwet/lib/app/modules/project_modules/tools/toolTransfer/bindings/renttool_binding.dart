import 'package:get/get.dart';

import '../controllers/renttool_controller.dart';

class RenttoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenttoolController>(
      () => RenttoolController(),
    );
  }
}
