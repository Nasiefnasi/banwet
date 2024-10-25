import 'package:get/get.dart';

import '../controllers/home_layout_controller.dart';

class HomeLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLayoutController>(
      () => HomeLayoutController(),
    );
  }
}
