import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:tandu_run/src/dashboard/controller/dashboard_controller.dart';
import 'package:tandu_run/src/home/views/home_views.dart';
import 'package:tandu_run/src/informasi/views/informasi_views.dart';
import 'package:tandu_run/src/kelola/views/kelola_views.dart';

import 'package:tandu_run/src/lupa_sandi/views/lupaSandi_views.dart';

import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/routes/app_pages.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
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
                      horizontal: paddingHorozontal1,
                      vertical: paddingVertical2),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text('Tidak'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: paddingHorozontal1,
                      vertical: paddingVertical1),
                  child: GestureDetector(
                    onTap: () => null,
                    child: const Text("Ya"),
                  ),
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
                child: PageView(
              controller: controller.pccontroller,
              onPageChanged: controller.onPageChange,
              children: [
                HomeViews(),
                kelolaPages(),
                informasiPages()
                ],
                
            )),
            bottomNavigationBar: Obx((() => BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: green,
                  unselectedItemColor: Colors.black.withOpacity(.30),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_filled,
                      ),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.edit_calendar_rounded,
                      ),
                      label: 'Kelola',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.article_outlined,
                      ),
                      label: 'Informasi',
                    ),
                  ],
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeSelectedIndex,
                )))));
  }
}
