import 'package:get/get.dart';
import 'package:tandu_run/src/informasi_penetesan/controller/informasiPenetesan_controller.dart';

class informasiPenetesanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<informasiPenetesanController>(() => informasiPenetesanController());
  }
}
