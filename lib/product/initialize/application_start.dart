import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_news_app/firebase_options.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:package_info_plus/package_info_plus.dart';

//import 'package:flutter_firebase_full_news_app/firebase_options.dart';
// import 'package:flutter_firebase_full_news_app/product/initialize/app_cache.dart';
// import 'package:kartal/kartal.dart';

@immutable //data girmesini engellemek icin
class ApplicationStart {
  const ApplicationStart._(); //Static kullancacaksan ve veriable olmayacaksa kapatma gerekiyor
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //    await DeviceUtility.deviceInit(); // alttaki benim czm
    await PackageInfo.fromPlatform();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // FirebaseUIAuth.configureProviders(
    //   [EmailAuthProvider(), GoogleProvider(clientId: '')],
    // );

    // await AppCache.instance.setup();
  }
}
