import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';
import 'package:rovers/core/extensions/string/string_extension.dart';

class ProjectTextLocale extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? textSize;
  final FontWeight? weight;
  final FontStyle? fontStyle;
  final TextStyle? style;
  final TextAlign? align;
  final int? maxLines;

  const ProjectTextLocale({
    Key? key,
    @required this.text,
    this.textSize,
    this.color,
    this.weight,
    this.style,
    this.align,
    this.maxLines,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text!.locale,
      style: style ?? context.themeData.textTheme.textStyle.copyWith(
        color: color,
        fontSize: textSize,
        fontWeight: weight
      ),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 5,
    );
  }
}
