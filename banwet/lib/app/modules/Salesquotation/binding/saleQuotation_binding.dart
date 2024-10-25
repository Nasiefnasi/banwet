import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class SalesQuotationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuotationController>(
      () => QuotationController(),
    );
  }
}
