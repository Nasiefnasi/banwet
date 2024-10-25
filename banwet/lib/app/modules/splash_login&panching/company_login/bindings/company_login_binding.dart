import 'package:get/get.dart';

import '../controllers/company_login_controller.dart';

class CompanyLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyLoginController>(
      () => CompanyLoginController(),
    );
  }
}
