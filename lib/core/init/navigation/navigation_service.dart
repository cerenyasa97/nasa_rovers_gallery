import 'package:flutter/cupertino.dart';
import 'package:rovers/core/constants/enums/screens/screens.dart';
import 'package:rovers/core/init/navigation/enter_exit_route.dart';
import 'package:rovers/screens/app_info/app_info_screen.dart';
import 'package:rovers/screens/landing/landing%20_screen.dart';
import 'package:rovers/screens/login/login_screen.dart';

class NavigationService{
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  getRoute(Screens screen, {dynamic variable}){
    switch(screen){
      case Screens.APP_INFO:
        return AppInfoScreen();
      case Screens.LOGIN:
        return LoginScreen();
      case Screens.LANDING:
        return LandingScreen();
      default:
        return CupertinoPageScaffold(
          child: Center(child: Text("Error! Page not found!"),),
        );
    }
  }

  navigatePush(BuildContext context, Screens screen, {dynamic variable}){
    Navigator.of(context).push(EnterExitRoute(enterPage: getRoute(screen)));
  }

  navigatorPop(BuildContext context) => Navigator.of(context).pop();
}