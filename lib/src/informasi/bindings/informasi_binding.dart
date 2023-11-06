import 'package:get/get.dart';
import 'package:tandu_run/src/informasi/controller/informasi_controller.dart';

class informasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<informasiController>(() => informasiController());
  }
}
