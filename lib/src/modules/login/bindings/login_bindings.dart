import 'package:get/get.dart';
import 'package:tandu_run/src/modules/login/controller/login_controller.dart';

class loginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(() => loginController());
  }
}
