import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:tandu_run/src/informasi_penetesan/controller/informasiPenetesan_controller.dart';
import 'package:tandu_run/utils/app_style.dart';

class informasiPenetesanPages extends GetView<informasiPenetesanController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: hitam2, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Informasi Penetesan Nutrisi",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "font/inter_extrabold.ttf",
            fontWeight: FontWeight.w700,
            color: hitam2,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              height: 130,
              padding: const EdgeInsets.only(top: 40, left: 18, right: 18),
              child: DatePicker(
                locale: 'id_ID',
                width: 55,
                height: 40,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: const Color.fromARGB(255, 69, 170, 67),
                selectedTextColor: Colors.white,
                dateTextStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: "font/inter_medium.ttf",
                    fontWeight: FontWeight.w600,
                    color: hitam1),
                dayTextStyle: const TextStyle(
                    fontSize: 14,
                    fontFamily: "font/Inter_Thin.ttf",
                    color: hitam1),
                monthTextStyle: const TextStyle(
                    fontSize: 16,
                    fontFamily: "font/inter_bold.ttf",
                    color: hitam2,
                    fontWeight: FontWeight.w800),
                onDateChange: (date) {},
              )),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Informasi hari ini",
                style: TextStyle(
                    fontFamily: "font/inter_extrabold.ttf",
                    color: hitam2,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 69, 170,
                          67), // Ganti dengan warna latar belakang yang Anda inginkan
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "12:52",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            Text(
                              "ppm: 1100",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "pH: 6",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "Volume: 1210",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 69, 170,
                          67), // Ganti dengan warna latar belakang yang Anda inginkan
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "12:52",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            Text(
                              "ppm: 1100",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "pH: 6",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "Volume: 1210",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromARGB(255, 69, 170,
                          67), // Ganti dengan warna latar belakang yang Anda inginkan
                    ),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "12:52",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18),
                            ),
                            Text(
                              "ppm: 1100",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "pH: 6",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              "Volume: 1210",
                              style: TextStyle(
                                  fontFamily: "font/inter_extrabold.ttf",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
