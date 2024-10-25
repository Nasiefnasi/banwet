import 'package:get/get.dart';

import '../controllers/labour_payment_controller.dart';

class LabourPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabourPaymentController>(
      () => LabourPaymentController(),
    );
  }
}
