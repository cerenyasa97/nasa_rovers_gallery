import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rovers/core/constants/theme/blue_theme.dart';

class ProjectThemeData extends ChangeNotifier{
  late CupertinoThemeData _themeData;

  ProjectThemeData(){
    _themeData = blueTheme;
  }

  CupertinoThemeData get themeData => _themeData;
}