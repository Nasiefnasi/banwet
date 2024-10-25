import 'package:get/get.dart';
import 'package:banwet/app/modules/Dailytaskdetails/controllers/dailytaskdetails.dart';

class DailytaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailytaskDatailsController>(
      () => DailytaskDatailsController(),
    );
  }
}
