import 'package:get/get.dart';
import 'package:banwet/app/modules/documents/controller/document_controller.dart';
// import 'package:banwet/app/modules/documents/controller/Document_controller.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentControllers>(
      () => DocumentControllers(),
    );
  }
}
