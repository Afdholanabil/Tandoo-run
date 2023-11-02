import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/home/controller/home_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
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

class HomeViews extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text("Notice"),
            content: const Text(
                "apakah anda sudah yakin untuk keluar dari aplikasi"),
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
                onTap: () => Get.offAllNamed(Routes.informasi),
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
                for (final textStyle in teksStyleSignIn)
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hii, Syelendra Rama',
                                maxLines: 1,
                                style: textStyle['Bold1'],
                              ),
                              Text(
                                "${DateTime.now()}",
                                style: TextStyle(
                                    fontFamily: "font/Inter_Thin.ttf",
                                    color: Colors.white54,
                                    fontSize: (16),
                                    fontWeight: FontWeight.w400),
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
                        color: Colors.white30,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
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
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Cek kondisi tanaman mu saat ini. Apakah tanaman mu sudah mendapatkan nutrisi ? ",
                                  style: TextStyle(
                                      fontFamily: "font/inter_regular.ttf",
                                      color: Colors.white,
                                      fontSize: (12),
                                      textBaseline: Jus,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image(
                                        image: AssetImage(
                                            'semuaAsset/gambar/awal.png')),
                                  ),
                                ),
                              )
                            ]))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Pemantauan",
                      style: TextStyle(
                          fontFamily: "font/inter_bold.ttf",
                          color: Colors.white,
                          fontSize: (22),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
