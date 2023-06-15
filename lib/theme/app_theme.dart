import 'package:beebeer_app2/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    // scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Pallete.whiteColor,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.pinkColor,
    ),
  );
}
