import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/loginModel.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/services/sharedPreference/user.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginController extends GetxController {
  final account = TextEditingController().obs;
  final pass = TextEditingController().obs;
  var isLoading = false.obs;
  var passwordVisible = true.obs;

  String title = 'Pesan Error';

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  bool isValidEmail(String email) {
    // Ekspresi reguler untuk memeriksa apakah email mengandung "@"
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

    if (!emailRegex.hasMatch(email)) {
      // Jika email tidak valid, tampilkan pesan kesalahan
      Get.snackbar('Pesan Error', 'Alamat email tidak valid',
          backgroundColor: oren, colorText: Colors.white);
      return false;
    }

    // Jika email valid, kembalikan true
    return true;
  }

// Contoh penggunaan pada text editing controller

// Panggil fungsi isValidEmail saat memeriksa validitas email

  bool checkInput() {
    if (account.value.text.isEmpty) {
      Get.snackbar(title, 'Alamat email tidak boleh kosong',
          backgroundColor: oren, colorText: white);
      return false;
    }

    if (account.value.text.length > 320) {
      Get.snackbar(title, 'Alamat email kamu terlalu panjang',
          backgroundColor: oren, colorText: white);
      return false;
    }
    if (!isValidEmail(account.value.text)) {
      Get.snackbar(title, 'Alamat email tidak valid',
          backgroundColor: oren, colorText: white);
      return false;
    }
    if (account.value.text.contains(' ')) {
      Get.snackbar(title, 'Alamat email tidak valid',
          backgroundColor: oren, colorText: white);
      return false;
    }
    if (pass.value.text.isEmpty) {
      Get.snackbar(title, 'password tidak boleh kosong',
          backgroundColor: oren, colorText: white);
      return false;
    }
    if (pass.value.text.length < 5) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu pendek',
          backgroundColor: oren, colorText: white);
      return false;
    }
    if (pass.value.text.length > 16) {
      Get.snackbar(title, 'password yang kamu masukkan terlalu panjang',
          backgroundColor: oren, colorText: white);
      return false;
    }
    return true;
  }

  // loginPost() async {
  //   if (checkInput()) {
  //     // isLoading.value = true;
  //     var result = await APIClient().postData('post_login', {
  //       "no_telfon": account.value.text,
  //       "password": pass.value.text
  //     }).catchError((err) {
  //       print("Error during login request: $err");
  //     });

  //     if (result != null && result != false) {
  //       var dataLogin = loginModelFromJson(result);
  //       if (dataLogin.status) {
  //         await UserData().addUser(dataLogin.data!.id, dataLogin.data!.nama,
  //             dataLogin.data!.noTelfon);
  //         Get.snackbar(
  //             "Berhasil Login", "Selamat Datang!, ${dataLogin.data!.nama}",
  //             backgroundColor: Colors.white70, colorText: hitam2);
  //         Get.offNamed(Routes.dashboard);
  //         isLoading.value = false;
  //       } else {
  //         isLoading.value = false;
  //         Get.snackbar("Login Gagal!", "Coba ulangi beberapa saat lagi",
  //             backgroundColor: black3, colorText: white);
  //       }
  //     }
  //   }
  // }

  showHidePass() => passwordVisible.value = !passwordVisible.value;
  masukDashboard() => Get.toNamed(Routes.dashboard);
  masukLupaPw() => Get.toNamed(Routes.lupaSandi);
}
