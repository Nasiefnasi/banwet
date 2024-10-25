import 'package:get/get.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';

class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockControllers>(
      () => StockControllers(),
    );
  }
}
