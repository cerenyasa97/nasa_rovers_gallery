import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rovers/core/constants/app/app_constants.dart';
import 'package:rovers/core/extensions/theme/theme.dart';
import 'package:rovers/screens/home_base/home_base_view_model/home_base_view_model.dart';
import 'package:rovers/screens/login/login_screen.dart';
import 'package:rovers/screens/login/view_model/login_view_model.dart';
import 'package:rovers/screens/splash/splash_screen.dart';
import 'package:rovers/services/get_it/get_it_service.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox<dynamic>(AppConstants.HIVE_BOX_KEY);
  await Hive.openBox<bool>(AppConstants.IS_APP_OPEN_FIRST_TIME);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    EasyLocalization(
        supportedLocales: AppConstants.LANGUAGE_LOCALES,
        path:
            'assets/languages', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MultiProvider(providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ChangeNotifierProvider(create: (_) => HomeBaseViewModel())
        ], child: RoversApp())),
  );
}

class RoversApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ProjectThemeData().themeData,
        home: RoversSplash(),
        );
  }
}
