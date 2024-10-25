import 'package:get/get.dart';

import '../controllers/renttool_inner_controller.dart';

class RenttoolInnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenttoolInnerController>(
      () => RenttoolInnerController(),
    );
  }
}
