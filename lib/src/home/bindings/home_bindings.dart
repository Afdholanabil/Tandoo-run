import 'package:get/get.dart';
import 'package:tandu_run/src/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
