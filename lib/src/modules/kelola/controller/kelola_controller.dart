import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/kelolaNutrisiModel.dart';
import 'package:tandu_run/model/nutrisi_model.dart';
import 'package:tandu_run/model/nutrisi_model_kelola.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/utils/app_style.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
DateTime jam = DateTime(now.hour, now.minute);
String formatDate = DateFormat('dd-MM-yyyy').format(date);
String formatJam = DateFormat('HH:mm').format(jam);

class kelolaController extends GetxController {
  var isLoading = false.obs;

  Rx<TextEditingController> inputPPM = TextEditingController().obs;

  String kirim = "kirim";
  Rx<NutrisiModelKelola> modelNutrisi = new NutrisiModelKelola().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxMap<String, dynamic> latestData = <String, dynamic>{}.obs;
  RxMap<String, dynamic> latestDataPPM = <String, dynamic>{}.obs;

  String latestInfoNutrisiId = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataNutrisiHomePagi();
    getDataFromFirestore();
    inputPPM.value = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    inputPPM.value.dispose();
  }

  // getDataNutrisiHomePagi() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiPagi', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelKelolaFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }

  // getDataNutrisiHomeSiang() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiSiang', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelKelolaFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }

  // getDataNutrisiHomeMalam() async {
  //   var data = await APIClient().postData(
  //       'get_nilaiNutrisiMalam', {'hari_tanggal': formatDate.toString()});
  //   if (data != null) {
  //     modelNutrisi.value = nutrisiModelKelolaFromJson(data);
  //   } else {
  //     print("Terdapat kesalahan");
  //   }
  // }

  // bool checkInputKelola() {
  //   if (inputPPM.value.text.isEmpty || inputPPM.value.text.length == 0) {
  //     Get.snackbar("Input ppm kosong", "Input ppm tidak boleh kosong !");
  //     return false;
  //   }

  //   return true;
  // }

  // postKelolaNutrisi() async {
  //   if (checkInputKelola()) {
  //     var idInfoNutrisi = modelNutrisi.value.id.toString();

  //     var data = await APIClient().postData('insert_kontrol_nutrisi', {
  //       "id_informasi_nutrisi": idInfoNutrisi,
  //       "nilai_ppm_input": inputPPM.value.text
  //     });

  //     if (data != null) {
  //       var modelKelola = kelolaNutrisiModelFromJson(data);
  //       if (modelKelola.status == true) {
  //         Get.snackbar("Berhasil melakukan kelola!",
  //             "Input ppm yang anda masukan telah terkirim!, Silahkan tunggu hasil ppm selanjutnya !",
  //             backgroundColor: Colors.white70, colorText: hitam2);
  //       } else {
  //         Get.snackbar("Gagal melakukan kelola",
  //             "Ada masalah dalam inputan anda atau dalam server. Coba beberapa saat lagi !",
  //             backgroundColor: black2, colorText: white);
  //       }
  //     } else {
  //       print('Terdapat kesalahan');
  //     }
  //   }
  // }

  // Misalnya, Anda memiliki fungsi untuk mengambil data dari Firestore
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
      latestInfoNutrisiId = querySnapshot.docs.first.id; // Simpan ID dokumen
    }
  }

  Future<void> addPpmDataToKontrolNutrisi(Map<String, dynamic> ppmData) async {
    try {
      String inputvalue = inputPPM?.value?.text ?? "Tidak ada nilai";
      await FirebaseFirestore.instance.collection('kontrol_nutrisi').add({
        'info_nutrisi_id': latestInfoNutrisiId, // Gunakan ID dokumen terakhir
        'nilai_ppm_sensor': ppmData['ppm'],
        'nilai_ppm_input':
            inputvalue // Anda mungkin perlu mendapatkan nilai input dari user
      });

      Get.snackbar("Berhasil !",
          "Input ppm anda berhasil terkirim!. Silahkan tunggu nilai ppm terbaru !",
          backgroundColor: green, colorText: white);
      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      if (e is FirebaseException) {
        print("Firestore error code: ${e.code}");
        print("Firestore error message: ${e.message}");
      } else {
        print("Error: $e");
      }

      Get.snackbar("Terjadi kesalahan !",
          "Input anda gagal terkirim! Silahkan coba beberapa saat lagi ! ",
          backgroundColor: red1, colorText: white);
    }
  }
}

  // void add(String info_nutrisi_id, String ppm_input, int ppm_sensor) async {
  //   CollectionReference infoNutrisi = firestore.collection("kontrol_nutrisi");

  //   try {
  //     infoNutrisi.add({
  //       "info_nutrisi_id" : info_nutrisi_id,
  //       "nilai_ppm_input" : ppm_input,
  //       "nilai_ppm_sensor" : ppm_sensor,
  //     });

  //     Get.defaultDialog(
  //         title: "Berhasil",
  //         middleText:
  //             "Input ppm yang anda masukan berhasil terkirim !. Silahkan tunggu hasil ppm selanjutnya",
  //         onConfirm: () {
  //           Get.back();
  //           Get.back();
  //         },
  //         textConfirm: "Oke");
  //   } catch (e) {
  //     print(e);
  //     Get.defaultDialog(
  //         title: "Terjadi kesalahan",
  //         middleText:
  //             "Gagal mengirim input ppm anda !. Coba beberapa saat lagi.",
  //         onConfirm: () {
  //           Get.back();
  //           Get.back();
  //         },
  //         textConfirm: "Oke");
  //   }
  // }

