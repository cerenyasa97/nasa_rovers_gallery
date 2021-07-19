import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';

class SvgImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;

  const SvgImage(
      {Key? key, required this.imagePath, this.width, this.height, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width ?? context.dynamicWidth(325),
      height: height,
      color: color,
    );
  }
}
