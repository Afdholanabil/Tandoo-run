import 'dart:typed_data';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/src/modules/informasi_hama/views/informasiHama_pages.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);

// DateTime formatDate = DateFormat('dd-MM-yyyy').format(date);
class informasiHamaController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  // ...

  // Observable to track the selected button label
  var selectedButtonLabel = "Pengecekan Pagi".obs;
  var predictedCategory = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getImagesByDate(predictedCategory.value);
    updateSelectedDate(selectedDate.value);
  }

  // Method to set predicted category
  void setPredictedCategory(String category) {
    predictedCategory.value = category;
  }

  // Method to update the selected button label
  void updateSelectedButtonLabel(String label) {
    selectedButtonLabel.value = label;
  }

  // Fungsi untuk pengecekan pagi
  void performPagiCheck() {
    // Lakukan operasi yang diperlukan untuk pengecekan pagi
    print('Pengecekan Pagi');
  }

  // Fungsi untuk pengecekan siang
  void performSiangCheck() {
    // Lakukan operasi yang diperlukan untuk pengecekan siang
    print('Pengecekan Siang');
  }

  // Fungsi untuk pengecekan malam
  void performMalamCheck() {
    // Lakukan operasi yang diperlukan untuk pengecekan malam
    print('Pengecekan Malam');
  }

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update(); // Ini digunakan untuk memberi tahu GetX bahwa ada perubahan di dalam controller
  }

  // Future<List<Uint8List?>> getImagesByDatePagi(
  //     DateTime targetDate, String category) async {
  //   // Tentukan folder target di Firebase Storage
  //   String targetFolder = "imageProcessing/pagi";

  //   // Lakukan query atau filter gambar berdasarkan tanggal tertentu
  //   // Misalnya, kita mengambil semua gambar yang memiliki nama mengandung tanggal (format: yyyy-MM-dd)
  //   String dateFormatted =
  //       "${targetDate.year}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.day.toString().padLeft(2, '0')}";

  //   final ListResult listResult =
  //       await FirebaseStorage.instance.ref('$targetFolder/').listAll();

  //   // Ambil data gambar dari setiap item pada daftar yang memiliki nama mengandung tanggal tertentu dan diawali dengan 'SegmentCitra_image_'
  //   List<Uint8List?> images = [];
  //   for (final item in listResult.items) {
  //     if (item.name.contains(dateFormatted) &&
  //         item.name.startsWith('SegmentCitra_image_') &&
  //         item.name.contains(category)) {
  //       final data = await item.getData();
  //       images.add(data);
  //     }
  //   }
  //   print("Jumlah data gambar: ${images.length}");
  //   return images;
  // }

  // Future<List<Uint8List?>> getImagesByDateSiang(
  //     DateTime targetDate, String category) async {
  //   // Tentukan folder target di Firebase Storage
  //   String targetFolder = "imageProcessing/siang";

  //   // Lakukan query atau filter gambar berdasarkan tanggal tertentu
  //   // Misalnya, kita mengambil semua gambar yang memiliki nama mengandung tanggal (format: yyyy-MM-dd)
  //   String dateFormatted =
  //       "${targetDate.year}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.day.toString().padLeft(2, '0')}";

  //   final ListResult listResult =
  //       await FirebaseStorage.instance.ref('$targetFolder/').listAll();

  //   // Ambil data gambar dari setiap item pada daftar yang memiliki nama mengandung tanggal tertentu dan diawali dengan 'SegmentCitra_image_'
  //   List<Uint8List?> images = [];
  //   for (final item in listResult.items) {
  //     if (item.name.contains(dateFormatted) &&
  //         item.name.startsWith('SegmentCitra_image_') &&
  //         item.name.contains(category)) {
  //       final data = await item.getData();
  //       images.add(data);
  //     }
  //   }
  //   print("Jumlah data gambar: ${images.length}");
  //   return images;
  // }

  // Future<List<Uint8List?>> getImagesByDateMalam(
  //     DateTime targetDate, String category) async {
  //   // Tentukan folder target di Firebase Storage
  //   String targetFolder = "imageProcessing/malam";

  //   // Lakukan query atau filter gambar berdasarkan tanggal tertentu
  //   // Misalnya, kita mengambil semua gambar yang memiliki nama mengandung tanggal (format: yyyy-MM-dd)
  //   String dateFormatted =
  //       "${targetDate.year}-${targetDate.month.toString().padLeft(2, '0')}-${targetDate.day.toString().padLeft(2, '0')}";

  //   final ListResult listResult =
  //       await FirebaseStorage.instance.ref('$targetFolder/').listAll();

  //   // Ambil data gambar dari setiap item pada daftar yang memiliki nama mengandung tanggal tertentu dan diawali dengan 'SegmentCitra_image_'
  //   List<Uint8List?> images = [];
  //   for (final item in listResult.items) {
  //     if (item.name.contains(dateFormatted) &&
  //         item.name.startsWith('SegmentCitra_image_') &&
  //         item.name.contains(category)) {
  //       final data = await item.getData();
  //       images.add(data);
  //     }
  //   }
  //   print("Jumlah data gambar: ${images.length}");
  //   return images;
  // }

  Future<List<Uint8List?>> getImagesByDate(String category) async {
    String targetFolder = "";
    bool terdeteksiBelalang = false;
    bool tidakAdaBelalangTerdeteksi = false;

    // Tentukan folder target berdasarkan waktu yang dipilih
    switch (selectedButtonLabel.value) {
      case "Pengecekan Pagi":
        targetFolder = "imageProcessing/pagi";
        break;
      case "Pengecekan Siang":
        targetFolder = "imageProcessing/siang";
        break;
      case "Pengecekan Malam":
        targetFolder = "imageProcessing/malam";
        break;
      default:
        targetFolder =
            "imageProcessing/lainnya"; // Gantilah dengan folder default jika diperlukan
    }
    print("button hari: $selectedButtonLabel");

    // Lakukan query atau filter gambar berdasarkan tanggal tertentu
    // Misalnya, kita mengambil semua gambar yang memiliki nama mengandung tanggal (format: yyyy-MM-dd)

    String dateFormatted =
        "${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}";

    print("dateFormated :$dateFormatted");

    try {
      final ListResult listResult =
          await FirebaseStorage.instance.ref('$targetFolder/').listAll();

      // Ambil data gambar dari setiap item pada daftar yang memiliki nama mengandung tanggal tertentu dan diawali dengan 'SegmentCitra_image_'
      List<Uint8List?> images = [];
      for (final item in listResult.items) {
        print("Item name: ${item.name}");

        if (item.name.contains(dateFormatted) &&
            item.name.startsWith('SegmentCitra_image_')) {
          final data = await item.getData();
          images.add(data);

          // Perbarui kategori yang terdeteksi berdasarkan nama gambar
          if (item.name.trim().contains("Tidak Ada Belalang Terdeteksi")) {
            print("Tidak Ada Belalang Terdeteksi");
            tidakAdaBelalangTerdeteksi = true;
          } else if (item.name.trim().contains("Terdeteksi Belalang")) {
            print("Terdeteksi Belalang");
            terdeteksiBelalang = true;
          }
        }
      }

// Set kategori berdasarkan hasil deteksi gambar
      if (terdeteksiBelalang) {
        setPredictedCategory("Terdeteksi Belalang");
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: 'channelKey',
            title: "Belalang Terdeteksi",
            body: 'Periksa gambar pada aplikasi dan tanaman sekarang !',
          ),
        );
      } else if (tidakAdaBelalangTerdeteksi) {
        setPredictedCategory("Tidak Ada Belalang Terdeteksi");
      } else {
        // Jika tidak ada gambar yang terdeteksi, atur kategori default jika diperlukan
        setPredictedCategory("Kategori Default");
      }

      print("Jumlah data gambar: ${images.length}");
      return images;
    } catch (e) {
      // Handle error, return an empty list for simplicity
      print("Error fetching images: $e");
      return [];
    }
  }
}
