import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/berhasil_ubahSandi/controller/berhasil_ubahpw_controller.dart';
import 'package:tandu_run/utils/size_config.dart';

class berhasilUbahPwPages extends GetView<berhasilUbahPwController> {
  const berhasilUbahPwPages({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.all(10))),
    );
  }
}
