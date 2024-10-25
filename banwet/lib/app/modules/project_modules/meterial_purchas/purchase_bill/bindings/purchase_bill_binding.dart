import 'package:get/get.dart';

import '../controllers/purchase_bill_controller.dart';

class PurchaseBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseBillController>(
      () => PurchaseBillController(),
    );
  }
}
