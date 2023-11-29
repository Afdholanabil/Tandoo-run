import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/nutrisi_model.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
String formatDate = DateFormat('dd-MM-yyyy').format(date);

class informasiPenetesanController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<NutrisiModel> modelNutrisiPagi = new NutrisiModel().obs;
  Rx<NutrisiModel> modelNutrisiSiang = new NutrisiModel().obs;
  Rx<NutrisiModel> modelNutrisiMalam = new NutrisiModel().obs;

  RxList<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;

  Future<void> fetchData() async {
    try {
      // Convert the selected date to the required format (yyyy-MM-dd)
      String formattedDate = "${selectedDate.value.day.toString().padLeft(2, '0')}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.year}";


      // Query Firestore with the selected date
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('info_nutrisi')
          .where('hari_tanggal', isEqualTo: formattedDate)
          .get();

      // Update the observable list with data
      dataList.assignAll(querySnapshot.docs
          .map((doc) => Map<String, dynamic>.from(doc.data() as Map))
          .toList());
      update();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

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
    fetchData();
  }

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update();
  }

  getDataNutrisiPagi() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiPagi', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisiPagi.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiSiang() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiSiang', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisiSiang.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiMalam() async {
    var data = await APIClient().postData(
        'get_nilaiNutrisiMalam', {'hari_tanggal': formatDate.toString()});
    if (data != null) {
      modelNutrisiMalam.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  //------------------------------------------get tanggal tertentu----------------------------------------------------------------
  getDataNutrisiPagiTertentu() async {
    var data = await APIClient().postData('get_nilaiNutrisiPagi',
        {'hari_tanggal': selectedDate.value.toString().substring(0, 10)});
    if (data != null) {
      modelNutrisiPagi.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiSiangTertentu() async {
    var data = await APIClient().postData('get_nilaiNutrisiSiang',
        {'hari_tanggal': selectedDate.value.toString().substring(0, 10)});
    if (data != null) {
      modelNutrisiSiang.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }

  getDataNutrisiMalamTertentu() async {
    var data = await APIClient().postData('get_nilaiNutrisiMalam',
        {'hari_tanggal': selectedDate.value.toString().substring(0, 10)});
    if (data != null) {
      modelNutrisiMalam.value = nutrisiModelFromJson(data);
    } else {
      print("Terdapat kesalahan");
    }
  }
}
