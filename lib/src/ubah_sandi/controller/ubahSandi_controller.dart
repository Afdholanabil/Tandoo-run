import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';

class ubahSandiController extends GetxController {
  var isLoading = false.obs;
  final sandiBaru = TextEditingController().obs;
  final sandiKonfirmasi = TextEditingController().obs;
  var passwordVisible1 = true.obs;
  var passwordVisible2 = true.obs;

  berhasilKonfirmasi() => Get.toNamed(Routes.berhasilUbahPw);
  showHidePass() => passwordVisible1.value = !passwordVisible1.value;
  showHidePass2() => passwordVisible2.value = !passwordVisible2.value;
}
