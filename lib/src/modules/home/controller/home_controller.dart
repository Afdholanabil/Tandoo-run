import 'package:cloud_firestore/cloud_firestore.dart';
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
  String a = "Hii";

  // RxList<AkunModel> dataAkun = <AkunModel>[].obs;
  var akun;

  var namaAkun = ''.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxMap<String, dynamic> latestData = <String, dynamic>{}.obs;
  RxMap<String, dynamic> latestDataPPM = <String, dynamic>{}.obs;

  // TimeOfDay JamNow = TimeOfDay.now();
  
  Rx<AkunModel> modelAkun = new AkunModel().obs;
  Rx<NutrisiModel> modelNutrisi = new NutrisiModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataAkun();
    getDataFromFirestore();
    getUserData();
    // getDataNutrisiHomePagi();
    print("tanggal:" + formatDate.toString());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void getUserData() {
    var data = UserData().getEmail();

    data.then((value) => namaAkun.value = value);
  }

  Future<void> getDataFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('info_nutrisi')
        .orderBy('hari_tanggal', descending: true)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      latestData
          .assignAll(querySnapshot.docs.first.data() as Map<String, dynamic>);
      latestDataPPM.value = {'ppm': latestData['ppm']};
    }
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
