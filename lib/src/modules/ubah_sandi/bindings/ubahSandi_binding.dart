import 'package:get/get.dart';
import 'package:tandu_run/src/modules/ubah_sandi/controller/ubahSandi_controller.dart';

class ubahSandiBindins extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ubahSandiController>(() => ubahSandiController());
  }
}
