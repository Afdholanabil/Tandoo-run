import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/modules/ubah_sandi/controller/ubahSandi_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:tandu_run/utils/style_n_color.dart';

class ubahSandiPages extends GetView<ubahSandiController> {
  @override
  Widget build(BuildContext context) {
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
          "Ubah Kata Sandi",
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Masukan kata sandi baru, buat kata sandi yang mudah diingat !",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'semuaAsset/font/inter_regular.ttf',
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: hitam1),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Kata Sandi Baru",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: hitam1),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: Obx(() => TextFormField(
                      controller: controller.sandiBaru.value,
                      obscureText: controller.passwordVisible1.value,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: hitam2),
                      decoration: InputDecoration(
                          hintText: "Masukan kata sandi baru",
                          hintStyle: TextStyle(
                              fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: green,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => controller.showHidePass(),
                            splashColor: Colors.transparent,
                            icon: Icon(
                              !controller.passwordVisible1.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: green,
                            ),
                            color: const Color.fromARGB(255, 143, 143, 143),
                          ),
                          suffixIconColor: Colors.black,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 13, 10, 7),
                          border: InputBorder.none),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Ulangi Kata Sandi",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: hitam2),
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.2)),
                child: Obx(() => TextFormField(
                      controller: controller.sandiKonfirmasi.value,
                      obscureText: controller.passwordVisible2.value,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: hitam2),
                      decoration: InputDecoration(
                          hintText: "Ulangi kata sandi baru",
                          hintStyle: TextStyle(
                              fontFamily: 'semuaAsset/font/inter_semibold.ttf',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: green,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => controller.showHidePass2(),
                            splashColor: Colors.transparent,
                            icon: Icon(
                              !controller.passwordVisible2.value
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: green,
                            ),
                            color: const Color.fromARGB(255, 143, 143, 143),
                          ),
                          suffixIconColor: Colors.black,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 13, 10, 7),
                          border: InputBorder.none),
                    )),
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
                      onTap: () => controller.berhasilKonfirmasi(),
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
                                  Text("Konfirmasi",
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
