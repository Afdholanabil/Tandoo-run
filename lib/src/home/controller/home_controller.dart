import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/config/api_client.dart';
import 'package:tandu_run/model/akun_model.dart';

class HomeController extends GetxController {
  String a = "Hii,";

  // RxList<AkunModel> dataAkun = <AkunModel>[].obs;
  var akun;

  Rx<AkunModel> modelAkun = new AkunModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataAkun();
  }

  void getDataAkun() async {
    var result = await APIClient().getData('get_user');

    if (result != null) {
      modelAkun.value = akunModelFromJson(result);
    } else {
      debugPrint("terdapat kesalahan");
    }
  }
}
