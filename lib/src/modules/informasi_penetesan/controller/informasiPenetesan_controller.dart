import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/nutrisi_model.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.day, now.month, now.year);

class informasiPenetesanController extends GetxController {
  String formatDate = DateFormat('dd-MM-yyyy').format(date);

  var data88 = null;
  Rx<Map<String, dynamic>?> data88_2 = Rx<Map<String, dynamic>?>({});
  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;

  var dataku = null;
  Map<String, Map<String, dynamic>> dataku_2 = {};

  Rx<DateTime> selectedDate = date.obs;
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  RxList<Map<String, dynamic>> allNutrisi = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> filteredNutrisi = <Map<String, dynamic>>[].obs;
  // Tambahkan variabel filteredData
  Map<String, Map<String, dynamic>> filteredData = {};

  Future<void> readDataFromFirebase(String tanggal) async {
    var event = await _databaseReference.child('info_nutrisi').once();
    DataSnapshot dataSnapshot = event.snapshot;

    var dataSnapshotValue = dataSnapshot.value;
    print("Struktur data aktual: $dataSnapshotValue");

    if (dataSnapshotValue != null &&
        dataSnapshotValue is Map<dynamic, dynamic>) {
      Map<String, Map<String, dynamic>> dataku_2 =
          dataSnapshotValue.map((key, value) {
        if (value is Map<dynamic, dynamic>) {
          return MapEntry(key.toString(), value.cast<String, dynamic>());
        } else {
          return MapEntry(key.toString(), <String, dynamic>{});
        }
      });

      if (dataku_2.isNotEmpty) {
        print('ini data');
        print(dataku_2);
        String formatDate = DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(selectedDate.value.toString()));

        print("formatDate:" + formatDate.toString());

        Rx<String> targetTanggal =
            formatDate.obs; // Ganti dengan tanggal yang Anda cari

        print("tanggal target:" + targetTanggal.value);

        filteredData.clear();
        dataList.clear();
        // Set data88_2.value menjadi null di awal
        data88_2.value = null;

        dataku_2.forEach((key, value) {
          if (value != null && value is Map<String, dynamic>) {
            if (value['hari_tanggal'] == tanggal) {
              data88_2.value = value.cast<String, dynamic>();
              if (data88_2.value != null) {
                print("data88_2: ${data88_2.value}");

                // Cek jika 'hari_tanggal' sama dengan selectedDate, tambahkan ke filteredData
                if (value['hari_tanggal'] == formatDate) {
                  filteredData[key] = value;
                  dataList.add(value.cast<String, dynamic>());
                }
              } else {
                print("data pada tanggal $targetTanggal dari firebase null");
              }
            } else {
              print("Tanggal $targetTanggal tidak memiliki data, $data88_2");
            }
          } else {
            print(
                "Data does not match the expected structure, value struktur is $value");
          }
        });

        // Gunakan filteredData sesuai kebutuhan
        print("Filtered Data: $filteredData");
        print("DataList: $dataList");
      } else {
        print("data dari firebase null");
      }
    } else {
      print("Tipe data tidak sesuai yang diharapkan");
    }

    // print(data88['volume_air']);

    // dynamic test = dataku['volume_air'];
    // print(test.toString());
    // dataku.forEach((key, value) {
    //   print('Kunci: $key');
    //   print('Isi:');
    //   value.forEach((innerKey, innerValue) {

    //     print('$innerKey: $innerValue');
    //   });
    //   print('---');
    // });
    // print(dataku['cek_1']['hari_tanggal']);
    // if (dataku != null) {
    //   var data = dataSnapshot.value;

    //   if (data is Map) {
    //     // Mengambil semua nilai dari "info_nutrisi" dan mengonversinya ke List<Map<String, dynamic>>
    // allNutrisi.assignAll(data.values.cast<Map<String, dynamic>>());
    //     // Memastikan filteredNutrisi juga diperbarui
    //     updateFilteredData();
    //   } else {
    //     // Handle situasi jika tipe data tidak sesuai dengan ekspektasi
    //     print('Tipe data tidak sesuai dengan ekspektasi: $data');
    //   }
    // } else {
    //   // Handle situasi jika nilai null
    //   print('Data dari Firebase adalah null.');
    // }
  }

  // Fungsi untuk memperbarui data yang difilter
  // void updateFilteredData() {
  //   // Ganti dengan tanggal yang sesuai
  //   String selectedDate = '2023-11-30';
  //   filteredNutrisi.assignAll(getDataByDate(selectedDate));
  // }

  // RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;
  // Query dbRef = FirebaseDatabase.instance.ref().child('info_nutrisi');

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
    // getDataFromRealtimeDatabase2(selectedDate.value);
    // fetchDataForSelectedDate(selectedDate.value);
    updateSelectedDate(selectedDate.value);
    readDataFromFirebase(selectedDate.value.toString());
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
  // Future<void> fetchDataForSelectedDate(DateTime selectedDate) async {
  //   String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

  //   try {
  //     // Assuming you have a DatabaseReference named dbRef declared in your class
  //     dbRef = FirebaseDatabase.instance
  //         .reference()
  //         .child('info_nutrisi/$formattedDate');

  //     // Fetch data from Firebase using dbRef
  //     DatabaseEvent databaseEvent = await dbRef.once();

  //     // Access data snapshot from DatabaseEvent
  //     DataSnapshot dataSnapshot = databaseEvent.snapshot;

  //     // Process the fetched data as needed
  //     Map<String, dynamic>? data = dataSnapshot.value as Map<String, dynamic>?;

  //     // Example: If you have a list in your controller to store the data
  //     // Replace 'yourDataList' with the actual list in your controller
  //     dataList.clear(); // Clear the existing data
  //     if (data != null) {
  //       data.forEach((key, value) {
  //         if (value is Map<String, dynamic>) {
  //           // Assuming each item is a Map<String, dynamic>
  //           Map<String, dynamic> item = value;
  //           item['key'] = key;
  //           dataList.add(item);
  //         } else {
  //           // Handle if the item is not in the expected format
  //           print("Item not in the expected format");
  //         }
  //       });
  //     }

  //     // Update state using GetX update
  //     update(); // or use other update methods as needed
  //   } catch (error) {
  //     // Handle errors
  //     print("Error fetching data: $error");
  //   }
  // }

  // Future<void> getDataFromRealtimeDatabase2(DateTime date) async {
  //   String contohTanggal = DateFormat('yyyy-MM-dd').format(date);

  //   dbRef
  //       .orderByChild('hari_tanggal')
  //       .equalTo(contohTanggal)
  //       .onValue
  //       .listen((event) {
  //     if (event.snapshot.value != null) {
  //       var latestDataValues =
  //           (event.snapshot.value as Map<String, dynamic>).values.toList();
  //       if (latestDataValues.isNotEmpty) {
  //         // Ganti baris berikut dengan pembaruan RxList
  //         dataList.assignAll(latestDataValues.cast<Map<String, dynamic>>());
  //         print("panjang data" + dataList.length.toString());
  //       } else {
  //         print("Data tidak sesuai yang diharapkan");
  //       }
  //     } else {
  //       print("panjang datalist null :" + dataList.length.toString());
  //       print("Snapshot null");
  //     }
  //   });
  // }

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
