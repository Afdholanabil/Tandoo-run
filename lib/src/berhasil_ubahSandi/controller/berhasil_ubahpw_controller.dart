import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';

class berhasilUbahPwController extends GetxController{
  var isLoading = false.obs;



  berhasilKonfirmasi() => Get.offAllNamed(Routes.login);
} 