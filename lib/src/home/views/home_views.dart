import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/home/controller/home_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:tandu_run/utils/style_n_color.dart';
import 'package:intl/intl.dart';

final List<Map> teksStyleSignIn = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: Colors.white,
        fontSize: (25),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_semibold.ttf",
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: (18)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'SemiBold3': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin2': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w600),
    'normal': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w500)
  }
];

// ------------------------------------------------------------------------------------------------------------------------------------------

class HomeViews extends GetView<HomeController> {
  const HomeViews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Notice"),
            content: const Text(
                "Apakah anda sudah yakin untuk keluar dari aplikasi"),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal1, vertical: paddingVertical2),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text('Tidak'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingHorozontal1, vertical: paddingVertical2),
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text('Tidak'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                for (final textStyle in teksStyleSignIn)
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    '${controller.a.toString()}, ${controller.namaAkun.value}',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: "font/inter_bold.ttf",
                                        color: hitam1,
                                        fontSize: (25),
                                        fontWeight: FontWeight.w700),
                                  )),
                              Text(
                                "${DateFormat('EEEE, dd MMMM y').format(DateTime.now())}",
                                style: TextStyle(
                                  fontFamily: "font/Inter_Thin.ttf",
                                  color: hitam2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),

                          //
                        ],
                      )),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      height: 2,
                      decoration: BoxDecoration(
                        color: abu1,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: paddingHorozontal1,
                            vertical: paddingVertical3),
                        child: GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Cek kondisi tanaman mu saat ini. Apakah tanaman mu sudah mendapatkan nutrisi ? ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: "font/inter_regular.ttf",
                                      color: hitam1,
                                      fontSize: (14),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image(
                                        image: AssetImage(
                                            'semuaAsset/gambar/home.png')),
                                  ),
                                ),
                              )
                            ]))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: Text(
                      "Pemantauan",
                      style: TextStyle(
                          fontFamily: "font/inter_bold.ttf",
                          color: hitam2,
                          fontSize: (22),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal1,
                        vertical: paddingVertical1),
                    child: Container(
                      height: 70,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Align(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Nilai TDS",
                                          style: TextStyle(
                                              fontFamily:
                                                  "font/inter_regular.ttf",
                                              color: Colors.white,
                                              fontSize: (16),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Expanded(
                                          child: Obx(() =>  Text(
                                        "${controller.modelNutrisi.value.ppm.toString()} ppm",
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.white,
                                            fontSize: (22),
                                            fontWeight: FontWeight.w700),
                                      )))
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                      'semuaAsset/gambar/home_molekul.png'),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal1,
                        vertical: paddingVertical1),
                    child: Container(
                      height: 70,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Align(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Volume Air",
                                          style: TextStyle(
                                              fontFamily:
                                                  "font/inter_regular.ttf",
                                              color: Colors.white,
                                              fontSize: (16),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Expanded(
                                          child:Obx(() =>  Text(
                                        "${controller.modelNutrisi.value.volumeAir.toString()} L",
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.white,
                                            fontSize: (22),
                                            fontWeight: FontWeight.w700),
                                      )))
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                      'semuaAsset/gambar/home_volume.png'),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: paddingHorozontal1,
                        vertical: paddingVertical1),
                    child: Container(
                      height: 70,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Align(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "pH",
                                          style: TextStyle(
                                              fontFamily:
                                                  "font/inter_regular.ttf",
                                              color: Colors.white,
                                              fontSize: (16),
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Expanded(
                                          child:Obx(() =>  Text(
                                        "${controller.modelNutrisi.value.ph.toString()}",
                                        style: TextStyle(
                                            fontFamily: "font/inter_bold.ttf",
                                            color: Colors.white,
                                            fontSize: (22),
                                            fontWeight: FontWeight.w700),
                                      )))
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                      'semuaAsset/gambar/home_ph.png'),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
