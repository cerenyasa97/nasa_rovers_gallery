import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ThemeProviderExtension on BuildContext{
  CupertinoThemeData get themeData => CupertinoTheme.of(this);

  CupertinoTextThemeData get textTheme => this.themeData.textTheme;
}