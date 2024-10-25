import 'package:get/get.dart';
import 'package:banwet/app/modules/projecttask/controllers/projecttask_controller.dart';

class ProjectTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjecttaskController>(
      () => ProjecttaskController(),
    );
  }
}
