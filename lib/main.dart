import 'package:caregiver_app/test.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'SRC/adapter/token_services.dart';
import 'SRC/internationalization_using_getx/getx_Internationalization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isMobile) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    await Firebase.initializeApp();
  } else if (GetPlatform.isWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOruhr02Hwqt9LAtxJC2Gf5NQZVSeKQAU",
          authDomain: "gvhealth-web.firebaseapp.com",
          projectId: "gvhealth-web",
          storageBucket: "gvhealth-web.appspot.com",
          messagingSenderId: "321487049217",
          appId: "1:321487049217:web:10ebfbc4f1e3e0a904e600",
          measurementId: "G-R3JJX482B8"),
    );
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBOruhr02Hwqt9LAtxJC2Gf5NQZVSeKQAU",
          authDomain: "gvhealth-web.firebaseapp.com",
          projectId: "gvhealth-web",
          storageBucket: "gvhealth-web.appspot.com",
          messagingSenderId: "321487049217",
          appId: "1:321487049217:web:10ebfbc4f1e3e0a904e600",
          measurementId: "G-R3JJX482B8"),
    );
  }

  // FirebaseMessaging.onBackgroundMessage(NotificationHandler.backroundHandler);
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://067b391c5d9b4d0897549eaa3a96bfd9@o1067537.ingest.sentry.io/6061216';

      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      if (GetPlatform.isWeb) {
        runApp(DevicePreview(builder: (context) => GiversHealth()));
      } else {
        runApp(GiversHealth());
      }
    },
  );
  TokenServices.tokenRead();
}

class GiversHealth extends StatelessWidget {
  const GiversHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NotificationHandler.messageHandler();

    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: true,
      builder: () => GetMaterialApp(
        translations: GetxInternationalization(),
        locale: const Locale('en', 'US'),
        theme: ThemeData(
          fontFamily: 'TTCommons-Regular',
        ),
        debugShowCheckedModeBanner: false,
        home: TestPage(),
      ),
    );
  }
}
