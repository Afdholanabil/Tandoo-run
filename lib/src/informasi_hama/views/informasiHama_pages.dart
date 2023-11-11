import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:tandu_run/src/informasi_hama/controller/informasiHama_controller.dart';
import 'package:tandu_run/utils/app_style.dart';

class InformasiHamaPages extends GetView<informasiHamaController> {
  // Tanggal yang dipilih, diinisialisasi dengan tanggal hari ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ... Bagian Appbar ...
      ),
      body: Column(
        children: [
          // Bagian Date Picker
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Obx(() {
                  return HorizontalWeekCalendar(
                    weekStartFrom: WeekStartFrom.Monday,
                    onDateChange: (date) {
                      controller.updateSelectedDate(date);
                    },
                  );
                }),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Obx(() {
                    return Text(
                      controller.selectedDate.value.isAtSameMomentAs(DateTime.now())
                          ? 'Informasi Hari Ini'
                          : 'Informasi pada tanggal: ${controller.selectedDate.value.toString().substring(0, 10)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "font/inter_medium.ttf",
                        color: hitam2,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          // Lanjutkan dengan bagian informasi berdasarkan tanggal yang dipilih
          // ... (Kode informasi untuk setiap hari) ...
        ],
      ),
    );
  }
}
