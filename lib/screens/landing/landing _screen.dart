import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rovers/core/constants/app/app_constants.dart';
import 'package:rovers/screens/initial/initial_screen.dart';
import 'package:rovers/screens/login/login_screen.dart';
import 'package:rovers/screens/login/view_model/login_view_model.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, snapshot, _) {
        if (snapshot.appState == AppState.BUSY) {
          return CupertinoPageScaffold(
              child: Center(
            child: CupertinoActivityIndicator(
              radius: AppConstants.PROGRESS_INDICATOR_RADIUS,
            ),
          ));
        } else {
          print("Login status" + snapshot.loginStatus.toString());
          if (snapshot.loginStatus == LoginStatus.LOGGED_IN) {
            return InitialScreen();
          } else
            return LoginScreen();
        }
      },
    );
  }
}
