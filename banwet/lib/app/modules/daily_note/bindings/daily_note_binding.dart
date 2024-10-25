import 'package:get/get.dart';

import '../controllers/daily_note_controller.dart';

class DailyNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyNoteController>(
      () => DailyNoteController(),
    );
  }
}
