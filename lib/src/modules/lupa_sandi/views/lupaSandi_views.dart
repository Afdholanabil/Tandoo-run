import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/controller/auth_controller.dart';
import 'package:tandu_run/src/modules/lupa_sandi/controller/lupaSandi_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:tandu_run/utils/style_n_color.dart';

class lupaSandiPages extends GetView<lupaSandiController> {
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: hitam2, //change your color here
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontSize: 26,
            fontFamily: "font/inter_extrabold.ttf",
            fontWeight: FontWeight.w700,
            color: hitam2,
          ),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "${controller.lupaw.toString()}",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'font/inter_regular.ttf',
                  fontWeight: FontWeight.w300,
                  color: hitam2,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Email",
                style: TextStyle(
                  fontFamily: 'font/inter_regular.ttf',
                  fontSize: 19,
                  color: hitam1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: TextFormField(
                  controller: controller.telp.value,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontFamily: 'semuaAsset/font/inter_medium.ttf',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      hintText: "Masukan email anda",
                      hintStyle: TextStyle(
                          fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: green,
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(10, 13, 10, 7),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Material(
                color: green,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(8),
                child: Obx(() => InkWell(
                      splashColor: green,
                      highlightColor: green,
                      onTap: () => authC.resetPW2(controller.telp.value.text),
                      child: SizedBox(
                        height: 50,
                        child: controller.isLoading.value
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: paddingVertical2),
                                  Text(
                                    'loading...',
                                    style: StyleTxt.b(16, white),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Reset Password",
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
          )
        ],
      )),
    );
  }
}
