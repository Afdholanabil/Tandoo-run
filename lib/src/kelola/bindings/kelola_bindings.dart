import 'package:get/get.dart';
import 'package:tandu_run/src/kelola/controller/kelola_controller.dart';

class kelolaBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<kelolaController>(() => kelolaController());
  }
}
