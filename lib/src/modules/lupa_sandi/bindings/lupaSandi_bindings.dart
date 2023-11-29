import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tandu_run/src/modules/lupa_sandi/controller/lupaSandi_controller.dart';

class lupaSandiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<lupaSandiController>(() => lupaSandiController());
  }
}
