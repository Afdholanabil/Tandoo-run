import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/dashboard/bindings/dashboard_binding.dart';
import 'package:tandu_run/src/dashboard/views/dashboard_views.dart';
import 'package:tandu_run/src/home/bindings/home_bindings.dart';
import 'package:tandu_run/src/home/views/home_views.dart';
import 'package:tandu_run/src/login/bindings/login_bindings.dart';
import 'package:tandu_run/src/login/views/loginPage.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(name: Routes.login, page: ()=>loginPages(),
    binding: loginBindings()),
    GetPage(
        name: Routes.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBindings()),
    GetPage(
        name: Routes.home,
        page: () => HomeViews(), 
        binding: HomeBindings()),

  ];
}
