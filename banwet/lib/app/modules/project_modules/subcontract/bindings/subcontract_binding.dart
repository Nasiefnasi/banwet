import 'package:get/get.dart';

import '../controllers/subcontract_controller.dart';

class SubcontractBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubcontractController>(
      () => SubcontractController(),
    );
  }
}
