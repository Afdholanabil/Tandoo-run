import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/nutrisi_model.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.day, now.month, now.year);
String formatDate = DateFormat('dd-MM-yyyy').format(date);

class informasiPenetesanController extends GetxController {
  Rx<DateTime> selectedDate = date.obs;
  Rx<String> selectedDate2 = formatDate.obs;
  Rx<NutrisiModel> modelNutrisiPagi = new NutrisiModel().obs;
  Rx<NutrisiModel> modelNutrisiSiang = new NutrisiModel().obs;
  Rx<NutrisiModel> modelNutrisiMalam = new NutrisiModel().obs;

RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.ref().child('info_nutrisi');

  // Future<void> fetchData() async {
  //   try {
  //     // Convert the selected date to the required format (yyyy-MM-dd)
  //     String formattedDate =
  //         "${selectedDate.value.day.toString().padLeft(2, '0')}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.year}";

  //     // Query Firestore with the selected date
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('info_nutrisi')
  //         .where('hari_tanggal', isEqualTo: formattedDate)
  //         .get();

  //     // Update the observable list with data
  //     dataList.assignAll(querySnapshot.docs
  //         .map((doc) => Map<String, dynamic>.from(doc.data() as Map))
  //         .toList());
  //     update();
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getDataNutrisiPagi();
    // getDataNutrisiSiang();
    // getDataNutrisiMalam();

    // getDataNutrisiPagiTertentu();
    // getDataNutrisiSiangTertentu();
    // getDataNutrisiMalamTertentu();
    // fetchData();
    getDataFromRealtimeDatabase(selectedDate.value);
  }

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update();
  }

//   Future<void> getDataFromRealtimeDatabase() async {
//   String contohTanggal = formatDate;

//   dbRef
//       .orderByChild('hari_tanggal')
//       .equalTo(contohTanggal)
//       .onValue
//       .listen((event) {
//     if (event.snapshot.value != null) {
//       var latestDataKeys = (event.snapshot.value as Map).keys.toList();
//       if (latestDataKeys.isNotEmpty) {
//         var latestDataKey = latestDataKeys.first;
//         var latestDataValue = (event.snapshot.value as Map)[latestDataKey] as Map?;
//         if (latestDataValue != null) {
//           // Ganti baris berikut dengan pembaruan RxMap
// dataList.assign(latestDataValue);

//         } else {
//           // Handle jika data tidak sesuai yang diharapkan
//           print("Data tidak sesuai yang diharapkan");
//         }
//       } else {
//         // Handle jika tidak ada data
//         print("Tidak ada data");
//       }
//     } else {
//       // Handle jika snapshot null
//       print("Snapshot null");
//     }
//   });
// }

  Future<void> getDataFromRealtimeDatabase(DateTime date) async {
    String contohTanggal = DateFormat('dd-MM-yyyy').format(date);

    dbRef
        .orderByChild('hari_tanggal')
        .equalTo(contohTanggal)
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        var latestDataValues =
            (event.snapshot.value as Map<String, dynamic>).values.toList();
        if (latestDataValues.isNotEmpty) {
          // Ganti baris berikut dengan pembaruan RxList
          dataList.assignAll(latestDataValues.cast<Map<String, dynamic>>());
          print("panjang data" + dataList.length.toString());
        } else {
          print("Data tidak sesuai yang diharapkan");
        }
      } else {
        print("panjang datalist null :" + dataList.length.toString());
        print("Snapshot null");
      }
    });
  }

  // Future<void> getDataFromRealtimeDatabase2() async {
  //   String contohTanggal = formatDate;

  //   dbRef
  //       .orderByChild('hari_tanggal')
  //       .equalTo(contohTanggal)
  //       .onValue
  //       .listen((event) {
  //     if (event.snapshot.value != null) {
  //       if (event.snapshot.value is Map<dynamic, dynamic>) {
  //         Map<dynamic, dynamic> data =
  //             event.snapshot.value as Map<dynamic, dynamic>;

  //         // Clear RxList sebelum menambahkan data baru
  //         dataList.clear();

  //         // Convert Map<dynamic, dynamic> ke List<Map<String, dynamic>>
  //         List<Map<String, dynamic>> newDataList = data.values
  //             .map((value) => value as Map<String, dynamic>)
  //             .toList();

  //         // Assign data ke RxList
  //         dataList.assignAll(newDataList);
  //       } else {
  //         print("Tipe data tidak sesuai yang diharapkan");
  //       }
  //     } else {
  //       print("Snapshot null");
  //     }
  //   });
  // }
}
