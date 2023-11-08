import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/utils/app_style.dart';

import 'routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(GetMaterialApp(
            title: 'Tandoo-Run',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          )));
}
