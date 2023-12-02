import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/modules/kelola/controller/kelola_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:tandu_run/utils/style_n_color.dart';

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

class kelolaPages extends GetView<kelolaController> {
  const kelolaPages({Key? key}) : super(key: key);
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
              GestureDetector(
                onTap: () => Get.offAllNamed(Routes.login),
                child: const Text('Ya'),
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
                for (final textKelola in teksStyleSignIn)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingHorozontal1,
                          vertical: paddingVertical3),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Kelola Hidroponik",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: "font/inter_bold.ttf",
                                color: hitam2,
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Image(
                                image:
                                    AssetImage('semuaAsset/gambar/kelola.png'),
                                fit: BoxFit.cover, // Sesuaikan sesuai kebutuhan
                              ),
                            ),
                          ),
                        ],
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Image.asset('semuaAsset/gambar/awal.png'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Kondisi ppm saat ini",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontFamily:
                                                    "font/inter_regular.ttf",
                                                color: Colors.white,
                                                fontSize: (20),
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Expanded(
                                            flex: 2,
                                            child: Obx(() {
                                              // var lates = controller.latestData;
                                              return Text(
                                                "${controller.latestInfoNutrisiPpm} ppm",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontFamily:
                                                        "font/inter_bold.ttf",
                                                    color: Colors.white,
                                                    fontSize: (22),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              );
                                            }),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Align(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Kelola nilai ppm",
                                  style: TextStyle(
                                      fontFamily: "font/inter_regular.ttf",
                                      color: Colors.white,
                                      fontSize: (22),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white70,
                                                width: 2))),
                                    child: TextFormField(
                                      controller: controller.inputPPM.value,
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          fontFamily: "font/inter_medium.ttf",
                                          color: Colors.white,
                                          fontSize: (16),
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                          hintText: "Masukan kondisi nilai ppm",
                                          hintStyle: TextStyle(
                                              fontFamily:
                                                  "font/inter_regular.ttf",
                                              color: Colors.white60,
                                              fontSize: (16),
                                              fontWeight: FontWeight.w400),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 13, 10, 7),
                                          border: InputBorder.none,
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Material(
                                      color: white,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      borderRadius: BorderRadius.circular(8),
                                      child: InkWell(
                                        splashColor: white,
                                        highlightColor: white,
                                        onTap: () async {
                                          // var latesPPM = controller.latestDataPPM;
                                          // await controller.addPpmDataToKontrolNutrisi(
                                          //         latesPPM);
                                          controller.createNewKontrol();
                                        },
                                        child: SizedBox(
                                            height: 50,
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Kirim",
                                                style: TextStyle(
                                                    fontFamily:
                                                        "font/inter_bold.ttf",
                                                    color: green,
                                                    fontSize: (16),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
