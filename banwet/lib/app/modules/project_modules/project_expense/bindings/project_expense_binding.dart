import 'package:get/get.dart';

import 'package:banwet/app/modules/project_modules/project_expense/controllers/updateprojectexpense_controller.dart';

import '../controllers/project_expense_controller.dart';

class ProjectExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateprojectexpenseController>(
      () => UpdateprojectexpenseController(),
    );
    Get.lazyPut<ProjectExpenseController>(
      () => ProjectExpenseController(),
    );
  }
}
