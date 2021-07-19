import 'package:flutter/material.dart';
import 'package:rovers/core/components/image/svg_image.dart';
import 'package:rovers/core/components/text/project_text_locale.dart';
import 'package:rovers/core/extensions/context/context_extension.dart';

class AppIntroPageView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const AppIntroPageView(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SvgImage(
            imagePath: imagePath,
          ),
          flex: 15,
        ),
        Flexible(
          child: Align(
            child: Padding(
              padding: context.lowEdgeInsets,
              child: ProjectTextLocale(
                text: title,
                align: TextAlign.center,
                color: Colors.blueGrey.shade900,
                textSize: 20,
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          flex: 4,
        ),
        Flexible(
          child: Align(
            child: Padding(
              padding: context.lowEdgeInsets,
              child: ProjectTextLocale(
                text: description,
                align: TextAlign.center,
                color: Colors.blueGrey,
                maxLines: 3,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          flex: 4,
        )
      ],
    );
  }
}
