import 'package:get/get.dart';
import 'package:tandu_run/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tandu_run/src/modules/home/controller/home_controller.dart';
import 'package:tandu_run/src/modules/informasi/controller/informasi_controller.dart';
import 'package:tandu_run/src/modules/kelola/controller/kelola_controller.dart';
import 'package:tandu_run/src/modules/lupa_sandi/controller/lupaSandi_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<lupaSandiController>(() => lupaSandiController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<kelolaController>(() => kelolaController());
    Get.lazyPut<informasiController>(() => informasiController());
  }
}
