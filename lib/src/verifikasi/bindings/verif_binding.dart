import 'package:get/get.dart';
import 'package:tandu_run/src/verifikasi/controller/verif_controller.dart';

class verifBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<verifController>(() => verifController());
  }
}
