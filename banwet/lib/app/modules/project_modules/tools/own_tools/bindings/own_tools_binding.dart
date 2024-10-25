import 'package:get/get.dart';

import '../controllers/own_tools_controller.dart';

class OwnToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OwnToolsController>(
      () => OwnToolsController(),
    );
  }
}
