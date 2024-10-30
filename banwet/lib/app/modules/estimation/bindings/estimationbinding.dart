import 'package:banwet/app/modules/estimation/controllers/estimationController.dart';
import 'package:get/get.dart';

class Estimationbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Estimationcontroller>(
      () => Estimationcontroller(),
    );
  }
}
