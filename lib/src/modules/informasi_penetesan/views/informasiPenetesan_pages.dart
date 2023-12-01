import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:intl/intl.dart';
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
                    String tanggal = DateFormat('yyyy-MM-dd').format(date);
                    print("tanggal info nutrisi : ${tanggal}");
                    controller.updateSelectedDate(DateTime.parse(tanggal));
                    // controller.fetchDataForSelectedDate(date);
                    // controller.getDataFromRealtimeDatabase2(date);
                    controller.readDataFromFirebase();
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
              child:  Text(controller.data88 != null ? controller.data88!['ph'].toString() : "Data is null")


              // FutureBuilder<void>(
              //   future: controller
              //       .fetchDataForSelectedDate(controller.selectedDate.value),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else if (controller.dbRef == null ||
              //         controller.dataList.isEmpty) {
              //       return Text(
              //           'Tidak ada data'); // atau widget lain jika tidak ada data
              //     } else {
              //       // Your existing FirebaseAnimatedList
              //       return FirebaseAnimatedList(
              //         query: controller.dbRef,
              //         itemBuilder: (BuildContext context, DataSnapshot snapshot,
              //             Animation<double> animation, int index) {
              //           Map nutrisi = snapshot.value as Map;
              //           nutrisi['key'] = snapshot.key;

              //           String firebaseDate = nutrisi['hari_tanggal'];
              //           String selectedDate = DateFormat('dd-MM-yyyy').format(
              //               controller.selectedDate.value ?? DateTime.now());

              //           print("Firebase Date: ${firebaseDate}");
              //           print("Selected Date: ${selectedDate}");

              //           // Check if hari_tanggal matches the selectedDate
              //           if (firebaseDate == selectedDate) {
              //             return listNutrisi(nutrisi: nutrisi);
              //           } else {
              //             return Text("Tidak ada data");
              //           }
              //         },
              //       );
              //     }
              //   },
              // ),
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

  Widget cekData(){

    if (controller.data88 != null) {
    // Use the data88 here
    return Text(controller.data88!['ph'].toString());
  } else {
    return Text("Data is null");
  }

  }
  Widget listNutrisi({required Map nutrisi}) {
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
                "${nutrisi['jam']}",
                style: TextStyle(
                  fontFamily: "font/inter_extrabold.ttf",
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
              Text(
                "ppm: ${nutrisi['ppm']}",
                style: TextStyle(
                  fontFamily: "font/inter_extrabold.ttf",
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "pH: ${nutrisi['ph']}",
                style: TextStyle(
                  fontFamily: "font/inter_extrabold.ttf",
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                "Volume: ${nutrisi['volume_air']}",
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
  }

  Widget listInfoNutrisi() {
    // print("data88 view: memek" );
    if (1 + 1 == 69) {
    print("data88 view1: " + controller.data88.toString());
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
    print("data88 view2: " + controller.data88.toString());
    print("data view2: " + controller.dataku.toString());
      return ListView.builder(
        shrinkWrap: false,
        itemCount: controller.allNutrisi.length,
        itemBuilder: (context, index) {
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
                      "${controller.data88['jam']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "ppm: ${controller.data88['ppm']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "pH: ${controller.data88['ph']}",
                      style: TextStyle(
                        fontFamily: "font/inter_extrabold.ttf",
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Volume: ${controller.data88['volume_air']}",
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
        },
      );
    }
  }

  // Widget listBaru() {
  //   String selectedDate = '2023-11-30';
  //   List<Map<String, dynamic>> filteredData =
  //       controller.getDataByDate(selectedDate);
  //   return ListView.builder(
  //     itemCount: filteredData.length,
  //     itemBuilder: (context, index) {
  //       var data = filteredData[index];
  //       return ListTile(
  //         title: Text('Tanggal: ${data['hari_tanggal']} - Jam: ${data['jam']}'),
  //         subtitle: Text(
  //             'pH: ${data['ph']}, PPM: ${data['ppm']}, Volume Air: ${data['volume_air']}'),
  //       );
  //     },
  //   );
  // }
}
