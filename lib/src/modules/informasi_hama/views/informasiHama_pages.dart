import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:tandu_run/src/modules/informasi_hama/controller/informasiHama_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';

enum CustomTimeOfDay { pagi, siang, malam }

class InformasiHamaPages extends GetView<informasiHamaController> {
  // Tanggal yang dipilih, diinisialisasi dengan tanggal hari ini
  // Enum to represent the time of day

  // Variable to track the selected time of day
  TimeOfDay? selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: hitam2, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Informasi Hama",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "font/inter_extrabold.ttf",
            fontWeight: FontWeight.w800,
            color: hitam2,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Bagian Date Picker
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                HorizontalWeekCalendar(
                  activeBackgroundColor: green,
                  inactiveBackgroundColor: white,
                  inactiveTextColor: hitam2,
                  activeTextColor: hitam2,
                  disabledBackgroundColor: white,
                  disabledTextColor: hitam2,
                  monthColor: green,
                  activeNavigatorColor: green,
                  inactiveNavigatorColor: hitam2,
                  weekStartFrom: WeekStartFrom.Monday,
                  onDateChange: (date) {
                    controller.updateSelectedDate(date);
                  },
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Obx(() {
                    return Text(
                      controller.selectedDate.value.isAtSameMomentAs(date)
                          ? 'Informasi Hari Ini'
                          : 'Informasi pada tanggal: ${controller.selectedDate.value.toString().substring(0, 10)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "font/inter_bold.ttf",
                        color: hitam2,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: 70,
                  width: 600,
                  child: Obx(() {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        buildTimeOfDayButton("Pengecekan Pagi"),
                        buildTimeOfDayButton("Pengecekan Siang"),
                        buildTimeOfDayButton("Pengecekan Malam"),
                      ],
                    );
                  })),
            ),
          ),
          Obx(
            () => FutureBuilder<List<Uint8List?>>(
              future: controller
                  .getImagesByDate(controller.predictedCategory.value),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData &&
                      snapshot.data != null &&
                      snapshot.data!.isNotEmpty) {
                    // Filter gambar berdasarkan kategori
                    List<Uint8List?> filteredImages = snapshot.data!
                        .where((image) =>
                            image != null &&
                            (controller.predictedCategory.value
                                    .contains("Terdeteksi Belalang") ||
                                controller.predictedCategory.value
                                    .contains("Tidak Ada Belalang Terdeteksi")))
                        .toList();

                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: SizeConfig.screenHeightHalf,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: filteredImages.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                height: SizeConfig.screenHeightHalf,
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Image.memory(
                                  filteredImages[index] ?? Uint8List(0),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Text(
                          'Tidak ada penangkapan gambar pada hari tersebut'),
                    );
                  }
                } else {
                  return CircularProgressIndicator(
                    color: grey1,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget TeksDeteksi() {
    return Obx(
      () =>
          controller.predictedCategory.value == "Tidak Ada Belalang Terdeteksi"
              ? Text("Tidak Ada Belalang Terdeteksi")
              : Text(""),
    );
  }

  Widget TeksDeteksi2() {
    return Obx(
      () => controller.predictedCategory.value == "Terdeteksi Belalang"
          ? Text("Terdeteksi Belalang")
          : Text(""),
    );
  }

  // Helper method to create the time of day button
  Widget buildTimeOfDayButton(String label) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            // Panggil fungsi yang sesuai berdasarkan label tombol
            if (label == "Pengecekan Pagi") {
              controller.performPagiCheck();
            } else if (label == "Pengecekan Siang") {
              controller.performSiangCheck();
            } else if (label == "Pengecekan Malam") {
              controller.performMalamCheck();
            }
            // Update the selected button label using the controller
            controller.updateSelectedButtonLabel(label);
          },
          style: ElevatedButton.styleFrom(
            primary: controller.selectedButtonLabel == label ? green : grey3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "font/inter_bold.ttf",
                color: controller.selectedButtonLabel == label ? white : hitam2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
