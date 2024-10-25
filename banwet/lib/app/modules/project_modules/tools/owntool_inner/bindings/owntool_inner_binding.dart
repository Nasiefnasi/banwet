import 'package:get/get.dart';

import '../controllers/owntool_inner_controller.dart';

class OwntoolInnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwntoolInnerController>(
      () => OwntoolInnerController(),
    );
  }
}
