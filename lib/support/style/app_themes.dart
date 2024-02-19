import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData theme = ThemeData(
    /// AppBar
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),

    /// Scaffold
    scaffoldBackgroundColor: AppColors.white,
  );
}
