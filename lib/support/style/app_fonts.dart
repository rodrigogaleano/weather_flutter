import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  AppFonts._();

  static TextStyle poppinsRegular(double size, [Color? color]) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle poppinsSemiBold(double size, [Color? color]) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle poppinsBold(double size, [Color? color]) {
    return GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }
}
