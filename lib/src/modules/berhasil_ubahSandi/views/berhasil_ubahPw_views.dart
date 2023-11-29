import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/modules/berhasil_ubahSandi/controller/berhasil_ubahpw_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:tandu_run/utils/style_n_color.dart';

class berhasilUbahPwPages extends GetView<berhasilUbahPwController> {
  const berhasilUbahPwPages({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: paddingVertical1),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Material(
                      color: green,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: green,
                        highlightColor: green,
                        onTap: () => controller.berhasilKonfirmasi(),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Lanjut",
                                  style: TextStyle(
                                      fontFamily:
                                          'semuaAsset/font/inter_semibold.ttf',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ],
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
