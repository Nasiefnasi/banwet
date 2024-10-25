import 'package:get/get.dart';

import '../controllers/attendance_marking_controller.dart';

class AttendanceMarkingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceMarkingController>(
      () => AttendanceMarkingController(),
    );
  }
}
