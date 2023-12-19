import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/controller/auth_controller.dart';

import 'package:tandu_run/src/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tandu_run/src/modules/home/views/home_views.dart';
import 'package:tandu_run/src/modules/informasi/views/informasi_views.dart';
import 'package:tandu_run/src/modules/kelola/views/kelola_views.dart';

import 'package:tandu_run/src/modules/lupa_sandi/views/lupaSandi_views.dart';

import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/routes/app_pages.dart';
import 'package:tandu_run/utils/size_config.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final authC = Get.find<AuthController>();
    return WillPopScope(
        onWillPop: () async {
          return await Get.dialog(
            AlertDialog(
              title: Align(
                alignment: Alignment.topCenter,
                child: Text("Keluar",
                    style: TextStyle(
                        fontFamily: 'semuaAsset/font/inter_Bold.ttf',
                        fontSize: 26,
                        fontWeight: FontWeight.w600)),
              ),
              content: const Text(
                  "Oh tidak, anda akan pergi. Apakah anda yakin untuk keluar ?"),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingHorozontal1,
                              vertical: paddingVertical1),
                          child: GestureDetector(
                            onTap: () => authC.logout(),
                            child: const Text("Ya"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: paddingHorozontal1,
                              vertical: paddingVertical1),
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(child: const Text('Tidak')),
                          ),
                        ),
                      ),
                    ],
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
              children: [HomeViews(), kelolaPages(), informasiPages()],
            )),
            bottomNavigationBar: Obx((() => BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: green,
                  unselectedItemColor: Colors.black.withOpacity(.30),
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('semuaAsset/svg/Category.svg'),
                      activeIcon:
                          SvgPicture.asset('semuaAsset/svg/Category2.svg'),
                      label: 'Menu',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('semuaAsset/svg/Plus2.svg'),
                      activeIcon: SvgPicture.asset('semuaAsset/svg/Plus.svg'),
                      label: 'Kelola',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('semuaAsset/svg/Document.svg'),
                      activeIcon:
                          SvgPicture.asset('semuaAsset/svg/Document2.svg'),
                      label: 'Informasi',
                    ),
                  ],
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeSelectedIndex,
                )))));
  }
}
