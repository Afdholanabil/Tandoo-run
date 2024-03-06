import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:tandu_run/model/nutrisi_model_kelola.dart';
import 'package:firebase_database/firebase_database.dart';
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

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxMap<String, dynamic> latestData = <String, dynamic>{}.obs;
  RxMap<String, dynamic> latestDataPPM = <String, dynamic>{}.obs;

  RxMap<String, dynamic> latestInfoNutrisi = <String, dynamic>{}.obs;

  // String latestInfoNutrisiId = '';
  late RxString latestInfoNutrisiId;
  late RxInt latestInfoNutrisiPpm;

  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('info_nutrisi');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataNutrisiHomePagi();
    // getDataFromFirestore();
    // inputPPM.value = TextEditingController();
    latestInfoNutrisiId = ''.obs;
    latestInfoNutrisiPpm = 0.obs;
    // fetchLatestInfoNutrisi();
    getDataFromRealtimeDatabase();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
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
  // Future<void> getDataFromFirestore() async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('info_nutrisi')
  //       .orderBy('hari_tanggal', descending: true)
  //       .limit(1)
  //       .get();
  //   if (querySnapshot.docs.isNotEmpty) {
  //     latestData
  //         .assignAll(querySnapshot.docs.first.data() as Map<String, dynamic>);
  //     latestDataPPM.value = {'ppm': latestData['ppm']};
  //     latestInfoNutrisiId = querySnapshot.docs.first.id; // Simpan ID dokumen
  //   }
  // }

  // Future<void> addPpmDataToKontrolNutrisi(Map<String, dynamic> ppmData) async {
  //   try {
  //     String inputvalue = inputPPM?.value?.text ?? "Tidak ada nilai";
  //     await FirebaseFirestore.instance.collection('kontrol_nutrisi').add({
  //       'info_nutrisi_id': latestInfoNutrisiId, // Gunakan ID dokumen terakhir
  //       'nilai_ppm_sensor': ppmData['ppm'],
  //       'nilai_ppm_input':
  //           inputvalue // Anda mungkin perlu mendapatkan nilai input dari user
  //     });

  //     Get.snackbar("Berhasil !",
  //         "Input ppm anda berhasil terkirim!. Silahkan tunggu nilai ppm terbaru !",
  //         backgroundColor: green, colorText: white);
  //     Get.offAllNamed(Routes.dashboard);
  //   } catch (e) {
  //     if (e is FirebaseException) {
  //       print("Firestore error code: ${e.code}");
  //       print("Firestore error message: ${e.message}");
  //     } else {
  //       print("Error: $e");
  //     }

  //     Get.snackbar("Terjadi kesalahan !",
  //         "Input anda gagal terkirim! Silahkan coba beberapa saat lagi ! ",
  //         backgroundColor: red1, colorText: white);
  //   }
  // }

  // Fungsi untuk mengambil data terbaru dari Firebase
  // Fungsi untuk mengambil data terbaru dari Firebase
  Future<void> fetchLatestInfoNutrisi() async {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child('info_nutrisi');

    try {
      DatabaseEvent event = await reference.orderByKey().limitToLast(1).once();

      if (event.snapshot.value != null) {
        // Ambil data terbaru
        Map<dynamic, dynamic> values =
            (event.snapshot.value as Map<dynamic, dynamic>);
        var latestKey = values.keys.first;
        var latestData = values[latestKey];

        // Update variabel penampung
        latestInfoNutrisiId.value = latestKey;
        latestInfoNutrisiPpm.value = (latestData['ppm'] as int);

        update();
      }
    } catch (error) {
      // Tangani kesalahan di sini
      print("Error fetching latest info nutrisi: $error");
    }
  }

  Future<void> getDataFromRealtimeDatabase() async {
    dbRef.orderByKey().limitToLast(1).onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Ambil data terbaru dari daftar (list) data yang ada
        var latestDataKeys = (event.snapshot.value as Map).keys.toList();
        if (latestDataKeys.isNotEmpty) {
          var latestDataKey = latestDataKeys.first;
          var latestDataValue =
              (event.snapshot.value as Map)[latestDataKey] as Map?;
          if (latestDataValue != null) {
            latestData.assignAll(latestDataValue.cast<String, dynamic>());
            latestDataPPM.value = {'ppm': latestData['ppm']};

            latestInfoNutrisiId.value = latestDataKey;
            print("ID saat ini: $latestInfoNutrisiId");
            // Tambahkan baris berikut untuk menetapkan nilai terkini ke latestInfoNutrisi
            latestInfoNutrisi
                .assignAll(latestDataValue.cast<String, dynamic>());
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

  Future<void> createNewKontrol() async {
    try {
      DatabaseReference reference =
          FirebaseDatabase.instance.reference().child('kontrol_nutrisi');

      // Mendapatkan nilai terkini dari Firebase Realtime Database
      var latestInfoNutrisiId2 =
          latestInfoNutrisiId.value; // Gantilah 'id' dengan kunci yang sesuai
      var latestInfoNutrisiPpm = latestInfoNutrisi['ppm'] ??
          0; // Gantilah 'ppm' dengan kunci yang sesuai

      // Ambil nilai dari input_ppm Controller
      int inputPpm = int.tryParse(inputPPM.value.text) ?? 0;

      // Dapatkan nilai terbaru dari kontrol_id
      int latestKontrolId = await getLatestKontrolId();

      // Lakukan increment pada nilai kontrol_id
      int newKontrolId = latestKontrolId + 1;

      // Buat map data kontrol baru
      Map<String, dynamic> newKontrol = {
        'info_nutrisi_id': latestInfoNutrisiId2,
        'info_nutrisi_ppm': latestInfoNutrisiPpm,
        'input_ppm': inputPpm,
      };

      // Simpan data ke Firebase dengan menggunakan ID yang baru
      reference.child('kontrol_$newKontrolId').set(newKontrol).then((_) {
        // Reset input_ppm Controller
        inputPPM.value.clear();

        // Panggil fungsi untuk mengambil data terbaru
        getDataFromRealtimeDatabase();
      });
      Get.snackbar("Berhasil !",
          "Input ppm anda berhasil terkirim!. Silahkan tunggu nilai ppm terbaru !",
          backgroundColor: green, colorText: white);
      Get.offAllNamed(Routes.dashboard);
    } catch (e) {
      Get.snackbar("Terjadi kesalahan !",
          "Input anda gagal terkirim! Silahkan coba beberapa saat lagi ! ",
          backgroundColor: red1, colorText: white);
    }
  }

// Fungsi untuk mendapatkan nilai terbaru dari kontrol_id
  Future<int> getLatestKontrolId() async {
    DatabaseReference reference =
        FirebaseDatabase.instance.reference().child('kontrol_nutrisi');

    // Menggunakan method once() dari firebase_database
    // dan mengubah tipe hasilnya menjadi DatabaseEvent
    DatabaseEvent event =
        await reference.orderByKey().limitToLast(1).once() as DatabaseEvent;

    if (event.snapshot.value != null) {
      // Ambil data terbaru
      Map<dynamic, dynamic> values =
          (event.snapshot.value as Map<dynamic, dynamic>);
      var latestKey = values.keys.first;

      // Ekstrak nilai kontrol_id
      int latestKontrolId =
          int.tryParse(latestKey.replaceFirst('kontrol_', '')) ?? 0;

      return latestKontrolId;
    } else {
      return 0; // Jika tidak ada data, kembalikan nilai awal
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

