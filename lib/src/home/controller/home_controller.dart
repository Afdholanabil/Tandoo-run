import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/akun_model.dart';
import 'package:tandu_run/model/nutrisi_model.dart';
import 'package:tandu_run/services/sharedPreference/user.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
String formatDate = DateFormat('dd-MM-yyyy').format(date);

class HomeController extends GetxController {
  String a = "Hii,";

  // RxList<AkunModel> dataAkun = <AkunModel>[].obs;
  var akun;

  var namaAkun = ''.obs;

  // TimeOfDay JamNow = TimeOfDay.now();

  Rx<AkunModel> modelAkun = new AkunModel().obs;
  Rx<NutrisiModel> modelNutrisi = new NutrisiModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataAkun();
    getShareData();
    getDataNutrisiHomePagi();
    print("tanggal:" + formatDate.toString());
  }

  void getDataAkun() async {
    var result = await APIClient().getData('get_user');

    if (result != null) {
      modelAkun.value = akunModelFromJson(result);
    } else {
      debugPrint("terdapat kesalahan");
    }
  }

  void getShareData() {
    var nama = UserData().getNama();
    nama.then((value) => namaAkun.value = value);
  }

  getDataNutrisiHomePagi() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiPagi', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisi.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiHomeSiang() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiSiang', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisi.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiHomeMalam() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiMalam', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisi.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }
}
