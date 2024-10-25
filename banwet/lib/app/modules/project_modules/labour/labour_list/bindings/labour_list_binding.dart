import 'package:get/get.dart';

import '../controllers/labour_list_controller.dart';

class LabourListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabourListController>(
      () => LabourListController(),
    );
  }
}
