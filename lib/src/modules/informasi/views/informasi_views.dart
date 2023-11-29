import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tandu_run/src/controller/auth_controller.dart';
import 'package:tandu_run/src/modules/informasi/controller/informasi_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';

class informasiPages extends GetView<informasiController> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Material(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image(
                  image: AssetImage('semuaAsset/gambar/informasi.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(top: paddingHorozontal8),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Warna bayangan
                            spreadRadius: 10, // Jarak penyebaran bayangan
                            blurRadius: 15, // Jarak kabur bayangan
                            offset: Offset(0, 3), // Posisi bayangan (x, y)
                          ),
                        ]),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Text(
                              "Informasi",
                              style: TextStyle(
                                  fontFamily: "font/inter_medium.ttf",
                                  color: hitam2,
                                  fontSize: (18),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Detail informasi terkait sayuran yang ditanam",
                              style: TextStyle(
                                  fontFamily: "font/Inter_thin.ttf",
                                  color: Colors.black54,
                                  fontSize: (18),
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 20, right: 20),
                            child: Material(
                              color: abu3,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                splashColor: abu1,
                                highlightColor: abu2,
                                onTap: () =>
                                    controller.masukInformasiPenetesan(),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.article_outlined,
                                          color: hitam1,
                                          weight: 300,
                                        ),
                                      )),
                                      Align(
                                        child: Text(
                                            "Informasi Penetesan Nutrisi",
                                            style: TextStyle(
                                                fontFamily:
                                                    "font/inter_bold.ttf",
                                                color: hitam2,
                                                fontSize: (18),
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            child: Material(
                              color: abu3,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                splashColor: abu1,
                                highlightColor: abu2,
                                onTap: () => controller.masukInformasiHama(),
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.article_outlined,
                                          color: hitam1,
                                          weight: 300,
                                        ),
                                      )),
                                      Align(
                                        child: Text("Informasi Hama",
                                            style: TextStyle(
                                                fontFamily:
                                                    "font/inter_bold.ttf",
                                                color: hitam2,
                                                fontSize: (18),
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            child: Material(
                              color: abu3,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                splashColor: abu1,
                                highlightColor: abu2,
                                onTap: () => null,
                                child: SizedBox(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Icon(
                                          Icons.logout_outlined,
                                          color: hitam1,
                                          weight: 300,
                                        ),
                                      )),
                                      Align(
                                        child: InkWell(
                                          onTap: () => auth.logout(),
                                          child: Text("Keluar",
                                              style: TextStyle(
                                                  fontFamily:
                                                      "font/inter_bold.ttf",
                                                  color: hitam2,
                                                  fontSize: (18),
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
