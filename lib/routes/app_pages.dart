import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/berhasil_ubahSandi/bindings/berhasil_ubahPw_binding.dart';
import 'package:tandu_run/src/berhasil_ubahSandi/views/berhasil_ubahPw_views.dart';

import 'package:tandu_run/src/dashboard/bindings/dashboard_binding.dart';
import 'package:tandu_run/src/dashboard/views/dashboard_views.dart';

import 'package:tandu_run/src/login/bindings/login_bindings.dart';
import 'package:tandu_run/src/login/views/loginPage.dart';


import 'package:tandu_run/src/lupa_sandi/bindings/lupaSandi_bindings.dart';
import 'package:tandu_run/src/lupa_sandi/views/lupaSandi_views.dart';
import 'package:tandu_run/src/ubah_sandi/bindings/ubahSandi_binding.dart';
import 'package:tandu_run/src/ubah_sandi/views/ubahSandi_views.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
        name: Routes.login,
        page: () => const loginPages(),
        binding: loginBindings()),
    GetPage(
        name: Routes.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBindings()),
    GetPage(
        name: Routes.lupaSandi,
        page: () => lupaSandiPages(),
        binding: lupaSandiBinding()),
    GetPage(
        name: Routes.ubahSandi, 
        page: ()=> ubahSandiPages(),
        binding: ubahSandiBindins() ),
    GetPage(
        name: Routes.berhasilUbahPw, 
        page: ()=> berhasilUbahPwPages(),
        binding: berhasilUbahPwBindings()),
    
  ];
}
