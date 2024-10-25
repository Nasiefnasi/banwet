import 'package:get/get.dart';

import '../controllers/staff_login_controller.dart';

class StaffLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffLoginController>(
      () => StaffLoginController(),
    );
  }
}
