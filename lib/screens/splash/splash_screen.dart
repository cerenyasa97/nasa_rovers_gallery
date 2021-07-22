import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rovers/core/constants/app/app_constants.dart';
import 'package:rovers/core/constants/enums/screens/screens.dart';
import 'package:rovers/core/constants/image/image_constants.dart';
import 'package:rovers/core/extensions/string/string_extension.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';
import 'package:rovers/core/init/languages/locale_keys.g.dart';
import 'package:rovers/core/init/navigation/navigation_service.dart';

class RoversSplash extends StatefulWidget {
  const RoversSplash({Key? key}) : super(key: key);

  @override
  _RoversSplashState createState() => _RoversSplashState();
}

class _RoversSplashState extends State<RoversSplash> {

  Box<bool> isAppOpenFirstTime =  Hive.box<bool>(AppConstants.IS_APP_OPEN_FIRST_TIME);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => showCupertinoDialog(
              context: context,
              builder: (context) => _showCupertinoAlertDialog(context),
            ));
    //
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Image.asset(ImageConstants.instance.nasaGif),
      ),
    );
  }

  CupertinoAlertDialog _showCupertinoAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(LocaleKeys.splashDialogTitle.locale),
      content: Text(
        LocaleKeys.splashDialogContent.locale,
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(LocaleKeys.language1.locale),
          textStyle: context.textTheme.textStyle,
          onPressed: () {
            context.setLocale(AppConstants.EN);
            _navigate();
          },
        ),
        CupertinoDialogAction(
            child: Text(LocaleKeys.language2.locale),
            textStyle: context.textTheme.textStyle,
            onPressed: () {
              context.setLocale(AppConstants.TR);
              _navigate();
            }),
      ],
    );
  }

  _navigate() {
    Screens screen;
    bool isFirst = isAppOpenFirstTime.get("isFirstTime") ?? true;
    if(isFirst){
      isAppOpenFirstTime.put("isFirstTime", false);
      screen = Screens.APP_INFO;
    }else{
      screen = Screens.LANDING;
    }
    NavigationService.instance.navigatePush(context, screen);
  }
}
