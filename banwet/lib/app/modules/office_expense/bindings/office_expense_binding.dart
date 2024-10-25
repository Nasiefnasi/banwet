import 'package:get/get.dart';

import '../controllers/add_officeexpence_controller.dart';
import '../controllers/office_expense_controller.dart';

class OfficeExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddfficeExpenseController>(
      () => AddfficeExpenseController(),
    );
    Get.lazyPut<OfficeExpenseController>(
      () => OfficeExpenseController(),
    );
  }
}
