import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';

class lupaSandiController extends GetxController {
  Rx<TextEditingController> telp = TextEditingController().obs;
  var isLoading = false.obs;

  String lupaw ="Masukan alamat email pada akun yang sudah terdaftar sebelumnya !";

  
  masukGantiPw() => Get.toNamed(Routes.ubahSandi);

}
