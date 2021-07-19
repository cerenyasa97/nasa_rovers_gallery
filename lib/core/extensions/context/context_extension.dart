import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double dynamicWidth(width) => width * this.width / 412;

  double dynamicHeight(height) => height * this.height / 870;

  double get textScale => MediaQuery.of(this).textScaleFactor;

  EdgeInsetsGeometry get lowestEdgeInsets => EdgeInsets.all(5);

  EdgeInsetsGeometry get pageEdgeInsets => EdgeInsets.all(this.dynamicWidth(25));

  EdgeInsetsGeometry get lowEdgeInsets => EdgeInsets.symmetric(
      horizontal: this.dynamicWidth(35), vertical: this.dynamicHeight(15));

  EdgeInsetsGeometry get verticalLowestEdgeInsets =>
      EdgeInsets.symmetric(vertical: this.dynamicHeight(10));

  EdgeInsetsGeometry get verticalLowEdgeInsets =>
      EdgeInsets.symmetric(vertical: this.dynamicHeight(15));

  EdgeInsetsGeometry get horizontalLowEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(10));

  EdgeInsetsGeometry get otpFieldEdgeInsets =>
      EdgeInsets.symmetric(vertical: this.dynamicHeight(23));

  EdgeInsetsDirectional get navigationBarPadding => EdgeInsetsDirectional.only(
      top: this.dynamicHeight(10),
      start: this.dynamicWidth(10),
      end: this.dynamicWidth(25),);

  SizedBox get lowestHeightSizedBox => SizedBox(
        height: this.dynamicHeight(5),
      );

  SizedBox get lowHeightSizedBox => SizedBox(
        height: this.dynamicHeight(25),
      );

  SizedBox get lowWidthSizedBox => SizedBox(
        width: this.dynamicHeight(10),
      );

  SizedBox get mediumWidthSizedBox => SizedBox(
        width: this.dynamicHeight(25),
      );

  SizedBox get largeWidthSizedBox => SizedBox(
        width: this.dynamicHeight(70),
      );

  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (
        FocusScope.of(this).focusedChild!.context!.widget is! EditableText);
  }

  void closeKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }
}
