import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/nutrisi_model.dart';

DateTime now = DateTime.now();
DateTime date = DateTime(now.year, now.month, now.day);
String formatDate = DateFormat('dd-MM-yyyy').format(date);

class kelolaController extends GetxController {
  var isLoading = false.obs;

  String kirim = "kirim";
  Rx<NutrisiModel> modelNutrisi = new NutrisiModel().obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    getDataNutrisiHomePagi();
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
