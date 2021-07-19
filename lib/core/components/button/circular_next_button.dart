import 'package:flutter/material.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';
import 'package:rovers/core/extensions/theme/theme_extension.dart';

// ignore: must_be_immutable
class CircularNextButton extends StatelessWidget {
  double? outerRadius;
  double? innerRadius;
  final Widget? child;
  final Function() onTap;

  CircularNextButton(
      {Key? key,
      this.outerRadius,
      this.innerRadius,
      this.child,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    outerRadius = context.dynamicWidth(100);
    innerRadius = context.dynamicWidth(90);

    return GestureDetector(
      onTap: onTap,
      child: getContainer(
          outerRadius!,
          BoxDecoration(
            shape: BoxShape.circle,
            color: context.themeData.primaryColor,
          ),
          getContainer(
              innerRadius!,
              BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment(-0.79, 1.0),
                  end: Alignment(0.54, -0.54),
                  colors: [
                    context.themeData.primaryColor,
                    context.themeData.primaryContrastingColor
                  ],
                  stops: [0.0, 0.855],
                ),
              ),
              child ??
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ))),
    );
  }

  Widget getContainer(double diameter, BoxDecoration decoration, Widget child) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: decoration,
      child: Center(
        child: child,
      ),
    );
  }
}
