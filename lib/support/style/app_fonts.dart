import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';

class AppFonts {
  AppFonts._();

  static const String circeFontFamily = 'Circe';

  static TextStyle circeExtraLight(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w200,
      fontFamily: circeFontFamily,
    );
  }

  static TextStyle circeLight(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w300,
      fontFamily: circeFontFamily,
    );
  }

  static TextStyle circeRegular(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
      fontFamily: circeFontFamily,
    );
  }

  static TextStyle circeBold(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
      fontFamily: circeFontFamily,
    );
  }
}
