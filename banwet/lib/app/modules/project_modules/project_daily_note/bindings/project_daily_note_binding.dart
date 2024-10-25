import 'package:get/get.dart';

import '../controllers/project_daily_note_controller.dart';

class ProjectDailyNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDailyNoteController>(
      () => ProjectDailyNoteController(),
    );
  }
}
