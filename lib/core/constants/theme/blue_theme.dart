import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final blueTheme = CupertinoThemeData(
  primaryColor: Color(0xff407bff),
  primaryContrastingColor: Color(0xff5388fc),
  textTheme: CupertinoTextThemeData(
    textStyle: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal),
  )
);