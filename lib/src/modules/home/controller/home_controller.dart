import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/akun_model.dart';
import 'package:tandu_run/model/nutrisi_model.dart';
import 'package:tandu_run/services/sharedPreference/user.dart';
import 'package:firebase_database/firebase_database.dart';

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
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('info_nutrisi');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataAkun();
    // getDataFromFirestore();
    getDataFromRealtimeDatabase();
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

  Future<void> getDataFromRealtimeDatabase() async {
  dbRef.orderByKey().limitToLast(1).onValue.listen((event) {
    if (event.snapshot.value != null) {
      // Ambil data terbaru dari daftar (list) data yang ada
      var latestDataKeys = (event.snapshot.value as Map).keys.toList();
      if (latestDataKeys.isNotEmpty) {
        var latestDataKey = latestDataKeys.first;
        var latestDataValue = (event.snapshot.value as Map)[latestDataKey] as Map?;
        if (latestDataValue != null) {
          latestData.assignAll(latestDataValue.cast<String, dynamic>());
          latestDataPPM.value = {'ppm': latestData['ppm']};
        } else {
          // Handle jika data tidak sesuai yang diharapkan
          print("Data tidak sesuai yang diharapkan");
        }
      } else {
        // Handle jika tidak ada data
        print("Tidak ada data");
      }
    } else {
      // Handle jika snapshot null
      print("Snapshot null");
    }
  });
}


  // getDataNutrisiHomePagi() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiPagi', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }

  // getDataNutrisiHomeSiang() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiSiang', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }

  // getDataNutrisiHomeMalam() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiMalam', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }
}
