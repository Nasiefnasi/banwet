import 'package:get/get.dart';

import '../controllers/project_view_controller.dart';

class ProjectViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectViewController>(
      () => ProjectViewController(),
    );
  }
}
