import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final imagePath;

  const ProjectImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath
    );
  }
}
