import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/utils/size_config.dart';

class informasiController extends GetxController {
  String informasi = "Informasi hehe";
  final double initFabHeight = 180;
  RxDouble fabHeight = 0.0.obs;
  double panelHeightOpen = SizeConfig.screenHeight!;
  double panelHeightClosed = SizeConfig.screenHeight! * 0.2;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fabHeight.value = initFabHeight;
  }

  void panelController(double pos) {
    fabHeight.value =
        pos * (panelHeightOpen - panelHeightClosed) + initFabHeight;
  }

  keluarApp() => Get.offAllNamed(Routes.login);
  masukInformasiHama() => Get.toNamed(Routes.informasiHama);
  masukInformasiPenetesan() => Get.toNamed(Routes.informasiPenetesan);
}
