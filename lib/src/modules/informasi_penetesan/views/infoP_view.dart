import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/modules/informasi_penetesan/controller/informasiPenetesan_controller.dart';

class infoP extends GetView<informasiPenetesanController> {
  final controller = Get.put(informasiPenetesanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Page Title'),
      ),
      body: body()
    );
  }

  Widget body(){
    return Obx(() {
        var data88 = controller.data88;
        print("data88: " + data88.toString());

        // Pastikan data88 tidak null sebelum mengakses propertinya
        if (data88 != null) {
          return ListView.builder(
            itemCount: data88.length,
            itemBuilder: (context, index) {
              var key = data88.keys.elementAt(index);
              var value = data88[key];

              // Tampilkan key dan value dalam widget Anda
              return ListTile(
                title: Text('Key: $key'),
                subtitle: Text('Value: $value'),
              );
            },
          );
        } else {
          // Tampilkan pesan atau widget lain jika data88 null
          return Center(
            child: Text('Data not available'),
          );
        }
      });
  }
}
