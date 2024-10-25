import 'package:get/get.dart';

import '../controllers/projectdetailed_controller.dart';

class ProjectdetailedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectdetailedController>(
      () => ProjectdetailedController(),
    );
  }
}
