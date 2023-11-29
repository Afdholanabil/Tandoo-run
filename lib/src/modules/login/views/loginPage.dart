import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tandu_run/src/controller/auth_controller.dart';
import 'package:tandu_run/src/modules/login/controller/login_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/size_config.dart';
import 'package:tandu_run/utils/style_n_color.dart';

final List<Map> teksSignIn = [
  {
    'Header': 'Selamat Datang di Tandoo-Run',
    'SubHeader':
        'Kami senang melihatmu kembali!\nMasuk dan mulalilah menyelamatkan lebih banyak orang.',
    'Email': 'Email',
    'EmailHint': 'Alamat email terdaftar',
    'Password': 'Kata Sandi',
    'PasswordHint': 'Sandi minimal 8 karakter',
    'LupaPass': 'Lupa Kata Sandi?',
    'ButtonLogin': 'Masuk',
    'Footer': 'Belum punya akun?  ',
    'FooterButton': 'Daftar'
  }
].cast<Map<String, String>>();

// ------------------------------------------------------------------------------------------------------------------------------------------
// atur style teks

final List<Map> teksStyleSignIn = [
  {
    'Bold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: hitam2,
        fontSize: (25),
        fontWeight: FontWeight.w700),
    'SemiBold1': const TextStyle(
        fontFamily: "font/inter_bold.ttf",
        color: hitam2,
        height: 1.4,
        fontSize: (18)),
    'SemiBold2': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.blueAccent,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'SemiBold3': const TextStyle(
        fontFamily: "font/inter_extrabold.ttf",
        color: Colors.black45,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin1': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w500),
    'Thin2': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: Colors.white,
        fontSize: (18),
        fontWeight: FontWeight.w600),
    'normal': const TextStyle(
        fontFamily: "font/inter_regular.ttf",
        color: hitam2,
        fontSize: (18),
        fontWeight: FontWeight.w500)
  }
];

// ------------------------------------------------------------------------------------------------------------------------------------------

class loginPages extends GetView<loginController> {
  const loginPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final auth = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              for (final teks in teksSignIn)
                for (final teksStyle in teksStyleSignIn)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(teks['Header'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: "font/inter_bold.ttf",
                                      color: hitam2,
                                      fontSize: (25),
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          // Align(
                          //   alignment: FractionalOffset.topLeft,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(top: 8),
                          //     child: Text(teks['SubHeader'],
                          //         overflow: TextOverflow.ellipsis,
                          //         maxLines: 4,
                          //         style: teksStyle['SemiBold1']),
                          //   ),
                          // ),
                          Align(
                            alignment: FractionalOffset.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                width: double.infinity,
                                height: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'semuaAsset/gambar/awal.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text(teks['Email'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: "font/inter_medium.ttf",
                                      color: hitam2,
                                      fontSize: (18),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: TextFormField(
                                  controller: controller.account.value,
                                  cursorColor: Colors.black,
                                  style: teksStyle['SemiBold1'],
                                  decoration: InputDecoration(
                                      hintText: teks['EmailHint'],
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                        color: green,
                                      ),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          10, 13, 10, 7),
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(teks['Password'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: "font/inter_medium.ttf",
                                      color: hitam2,
                                      fontSize: (18),
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2)),
                                child: Obx(() => TextFormField(
                                      controller: controller.pass.value,
                                      obscureText:
                                          controller.passwordVisible.value,
                                      cursorColor: Colors.black,
                                      style: teksStyle['SemiBold1'],
                                      decoration: InputDecoration(
                                          hintText: teks['PasswordHint'],
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                            color: green,
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () =>
                                                controller.showHidePass(),
                                            splashColor: Colors.transparent,
                                            icon: Icon(
                                              !controller.passwordVisible.value
                                                  ? Icons.visibility_outlined
                                                  : Icons
                                                      .visibility_off_outlined,
                                              color: green,
                                            ),
                                            color: const Color.fromARGB(
                                                255, 143, 143, 143),
                                          ),
                                          suffixIconColor: Colors.black,
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  10, 13, 10, 7),
                                          border: InputBorder.none),
                                    )),
                              ),
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: GestureDetector(
                                onTap: () => controller.masukLupaPw(),
                                child: Text(teks['LupaPass'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: teksStyle['SemiBold2']),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 100),
                              child: Material(
                                color: green,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                borderRadius: BorderRadius.circular(8),
                                child: Obx(() => InkWell(
                                      splashColor: green,
                                      highlightColor: green,
                                      onTap: () {
                                        if (controller.checkInput()) {
                                          auth.login(
                                              controller.account.value.text,
                                              controller.pass.value.text);
                                        }
                                      },
                                      child: SizedBox(
                                        height: 50,
                                        child: controller.isLoading.value
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: paddingVertical2),
                                                  Text(
                                                    'loading...',
                                                    style:
                                                        StyleTxt.b(16, white),
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(teks['ButtonLogin'],
                                                      style:
                                                          teksStyle['Thin2']),
                                                ],
                                              ),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
