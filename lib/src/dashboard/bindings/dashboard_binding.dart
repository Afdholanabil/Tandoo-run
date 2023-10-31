import 'package:get/get.dart';
import 'package:tandu_run/src/dashboard/controller/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut <DashboardController>(() => DashboardController());
  }
}
