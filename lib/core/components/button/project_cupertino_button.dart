import 'package:flutter/cupertino.dart';
import 'package:rovers/core/components/text/project_text_locale.dart';
import 'package:rovers/core/constants/app/app_constants.dart';

class ProjectCupertinoButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Color? textColor;
  final Color? buttonColor;
  final double? textSize;
  final Function() onPressed;
  final bool isCircularCorner;
  final EdgeInsetsGeometry? padding;

  const ProjectCupertinoButton(
      {Key? key,
      required this.onPressed,
      this.text,
      this.textColor,
      this.buttonColor,
      this.textSize,
      this.child,
      this.isCircularCorner = false,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(
          isCircularCorner ? AppConstants.BUTTON_BORDER_RADIUS : 0),
      color: buttonColor,
      padding: padding,
      child: child ??
          ProjectTextLocale(
            text: text,
            color: textColor,
            textSize: textSize,
          ),
      onPressed: onPressed,
    );
  }
}
