import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/informasi/controller/informasi_controller.dart';
import 'package:tandu_run/utils/size_config.dart';

class informasiPages extends GetView<informasiController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Text(controller.informasi.toString(), 
        style:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ) ,) 
      ),
    );
  }
}
