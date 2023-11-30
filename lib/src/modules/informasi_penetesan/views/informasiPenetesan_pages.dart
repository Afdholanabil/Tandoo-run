import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:tandu_run/src/modules/informasi_penetesan/controller/informasiPenetesan_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';

class informasiPenetesanPages extends GetView<informasiPenetesanController> {
  @override
  Widget build(BuildContext context) {
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
            fontSize: 22,
            fontFamily: "font/inter_extrabold.ttf",
            fontWeight: FontWeight.w800,
            color: hitam2,
          ),
        ),
      ),
      body: Column(
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
                    print("tanggal info nutrisi :" +
                        controller.selectedDate.toString());
                    controller.updateSelectedDate(date);
                    controller.getDataFromRealtimeDatabase(date);
                  },
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Obx(
                    () => Text(
                      controller.selectedDate.value.isAtSameMomentAs(date)
                          ? 'Informasi Hari Ini'
                          : 'Informasi pada tanggal: ${controller.selectedDate.value.toString().substring(0, 10)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "font/inter_bold.ttf",
                        color: hitam2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Align(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.75,
              width: 450,
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHorozontal1, vertical: paddingVertical1),
              child: Obx(() => listInfoNutrisi()),
            ),
          ),
          // SingleChildScrollView(
          //   child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 18),
          //       child: listInfoNutrisi()),
          // )
        ],
      ),
    );
  }

 Widget listInfoNutrisi() {
  if (controller.dataList == null || controller.dataList.isEmpty) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: controller.dataList.length,
      itemBuilder: (context, index) {
        var rawData = controller.dataList[index];
        if (rawData is Map<Object?, Object?>) {
          var jsonData = json.decode(json.encode(rawData)) as Map<String, dynamic>;

          return Padding(
            padding: EdgeInsets.only(
              left: paddingHorozontal1,
              bottom: paddingVertical1,
              right: paddingHorozontal1,
            ),
            child: Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color.fromARGB(255, 69, 170, 67),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${jsonData['jam']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "ppm: ${jsonData['ppm']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "pH: ${jsonData['ph']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Volume: ${jsonData['volume_air']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          // Handle jika nilai dataList bukan Map<Object?, Object?>
          return Center(
            child: Text("Data tidak sesuai yang diharapkan"),
          );
        }
      },
    );
  }
}

}
