import 'package:get/get.dart';

import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/addwageslip_controller.dart';

import '../controllers/labour_wageslip_controller.dart';

class LabourWageslipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddwageslipController>(
      () => AddwageslipController(),
    );
    Get.lazyPut<LabourWageslipController>(
      () => LabourWageslipController(),
    );
  }
}
