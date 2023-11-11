import 'package:get/get.dart';

class informasiHamaController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    update(); // Ini digunakan untuk memberi tahu GetX bahwa ada perubahan di dalam controller
  }
}
