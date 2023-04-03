// import 'package:dk_app_flutter/app/controllers/ConnectivityManager.dart';

import 'package:dk_app_flutter/app/data/binding/init.dart';
import 'package:dk_app_flutter/app/theme/app_theme.dart';
import 'package:dk_app_flutter/app/utils/UserDefault.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'app/routes/app_pages.dart';

import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // if (!kIsWeb) {
  //   // await ConnectivityManager().init();

  //   await UserDefault().init();
  //   await PushNotificationManager.init();
  //   await Permission.activityRecognition.request();
  //   HealthFactory health = HealthFactory();
  // }

  runApp(GetMaterialApp(
    title: "AromaPod",
    initialRoute: AppPages.INITIAL,
    debugShowCheckedModeBanner: false,
    defaultTransition: Transition.fade,
    getPages: AppPages.routes,
    initialBinding: InitBinding(),
    translations: Message(),
    theme: AppTheme.lightTheme,
    locale: const Locale('en', 'US'),
    fallbackLocale: const Locale('en', 'US'),
    builder: EasyLoading.init(),
  ));
}

class Message extends Translations {
  get keys => AppTranslation.translations;
}
