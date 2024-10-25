import 'package:get/get.dart';

import 'package:banwet/app/modules/project_modules/subcontract/submodule/subcontract_bill/controllers/updatesubcontractbill_controller.dart';

import '../controllers/subcontract_bill_controller.dart';

class SubcontractBillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatesubcontractbillController>(
      () => UpdatesubcontractbillController(),
    );
    Get.lazyPut<SubcontractBillController>(
      () => SubcontractBillController(),
    );
  }
}
