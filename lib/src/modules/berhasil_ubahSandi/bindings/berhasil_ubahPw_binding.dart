import 'package:get/get.dart';
import 'package:tandu_run/src/modules/berhasil_ubahSandi/controller/berhasil_ubahpw_controller.dart';

class berhasilUbahPwBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<berhasilUbahPwController>(() => berhasilUbahPwController());
  }
}
