
import 'dart:io';


import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/src/controller/auth_controller.dart';
import 'package:tandu_run/src/modules/login/controller/login_controller.dart';
import 'package:tandu_run/utils/app_style.dart';
import 'package:tandu_run/utils/loading.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription')
  ]);



  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAbNg35HNXilD5z7YC2tdvmAF3E__A8xck",
        authDomain: "tandoo-run.firebaseapp.com",
        databaseURL: "https://tandoo-run-default-rtdb.firebaseio.com",
        projectId: "tandoo-run",
        storageBucket: "tandoo-run.appspot.com",
        messagingSenderId: "695436045305",
        appId: "1:695436045305:web:5c1b8ee840441301f4ab28",
        measurementId: "G-M4D936YRV1"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((value) =>
  runApp(MyApp())
  );
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: loginC.streamAuthStatus,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: 'Tandoo-Run',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            initialRoute: snapshot.data != null ? AppPages.dashboard : AppPages.initial,
            getPages: AppPages.routes,
          );
        }
        return loadingView();
      },
    );
  }
}
