import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/utils/app_style.dart';

class loginController extends GetxController {
  final account = TextEditingController().obs;
  final pass = TextEditingController().obs;
  var isLoading = false.obs;
  var passwordVisible = true.obs;

  String title = 'Pesan';

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  bool checkInput() {
    if (account.value.text.isEmpty) {
      Get.snackbar(title, 'username atau nomer telepon tidak boleh kosong',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length < 5) {
      Get.snackbar(title, 'username kamu terlalu pendek',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length > 30) {
      Get.snackbar(title, 'username kamu terlalu panjang',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.isEmpty) {
      Get.snackbar(title, 'password tidak boleh kosong',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.length < 5) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu pendek',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (pass.value.text.length > 30) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu panjang',
          backgroundColor: black3, colorText: white);
      return false;
    }
    return true;
  }

  showHidePass() => passwordVisible.value = !passwordVisible.value;
  masukDashboard() => Get.toNamed(Routes.dashboard);
  masukLupaPw() => Get.toNamed(Routes.lupaSandi);
}
