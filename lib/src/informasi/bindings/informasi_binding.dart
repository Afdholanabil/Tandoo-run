import 'package:get/get.dart';
import 'package:tandu_run/src/informasi/controller/informasi_controller.dart';
import 'package:tandu_run/src/informasi_hama/controller/informasiHama_controller.dart';
import 'package:tandu_run/src/informasi_penetesan/controller/informasiPenetesan_controller.dart';

class informasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<informasiController>(() => informasiController());
    Get.lazyPut<informasiPenetesanController>(
        () => informasiPenetesanController());
    Get.lazyPut<informasiHamaController>(() => informasiHamaController());
  }
}
