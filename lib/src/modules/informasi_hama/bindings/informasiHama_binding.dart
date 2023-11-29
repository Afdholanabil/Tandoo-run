import 'package:get/get.dart';
import 'package:tandu_run/src/modules/informasi_hama/controller/informasiHama_controller.dart';

class informasiHamaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<informasiHamaController>(() => informasiHamaController());
  }
}
