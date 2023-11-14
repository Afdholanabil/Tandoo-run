import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/loginModel.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/services/sharedPreference/user.dart';
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
      Get.snackbar(title, 'Nomer telepon tidak boleh kosong',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length < 9) {
      Get.snackbar(title, 'Nomor telepon kamu terlalu pendek',
          backgroundColor: black3, colorText: white);
      return false;
    }
    if (account.value.text.length > 14) {
      Get.snackbar(title, 'Nomor telepon kamu terlalu panjang',
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
    if (pass.value.text.length > 15) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu panjang',
          backgroundColor: black3, colorText: white);
      return false;
    }
    return true;
  }

  loginPost() async {
    if (checkInput()) {
      // isLoading.value = true;
      var result = await APIClient().postData('post_login', {
        "no_telfon" : account.value.text,
        "password" : pass.value.text
      }).catchError((err) {
        print("Error during login request: $err");
      });

      if (result != null && result != false) {
        var dataLogin = loginModelFromJson(result);
        if (dataLogin.status) {
          await UserData().addUser(dataLogin.data!.id, dataLogin.data!.nama,
              dataLogin.data!.noTelfon);
          Get.snackbar(
              "Berhasil Login", "Selamat Datang!, ${dataLogin.data!.nama}",
              backgroundColor: Colors.white70, colorText: hitam2);
          Get.offNamed(Routes.dashboard);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          Get.snackbar("Login Gagal!", "Coba ulangi beberapa saat lagi",
              backgroundColor: black3, colorText: white);
        }
      }
    }
  }

  showHidePass() => passwordVisible.value = !passwordVisible.value;
  masukDashboard() => Get.toNamed(Routes.dashboard);
  masukLupaPw() => Get.toNamed(Routes.lupaSandi);
}
