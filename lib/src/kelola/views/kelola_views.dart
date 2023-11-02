import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';

class kelolaPages extends GetView{
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
                
                
              
              ]
              ),
        ),
      ),
    );
  }

}