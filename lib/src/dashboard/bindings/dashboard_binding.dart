import 'package:get/get.dart';
import 'package:tandu_run/src/dashboard/controller/dashboard_controller.dart';
import 'package:tandu_run/src/home/controller/home_controller.dart';
import 'package:tandu_run/src/informasi/controller/informasi_controller.dart';
import 'package:tandu_run/src/kelola/controller/kelola_controller.dart';
import 'package:tandu_run/src/lupa_sandi/controller/lupaSandi_controller.dart';

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
