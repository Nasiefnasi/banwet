import 'package:get/get.dart';

import '../controllers/client_payment_controller.dart';

class ClientPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientPaymentController>(
      () => ClientPaymentController(),
    );
  }
}
