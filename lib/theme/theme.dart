import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'no_transition_builder.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlackColor,
        primary: AppColors.primaryBlackColor,
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldNewBackgroundColor,
      ),
      textTheme: GoogleFonts.robotoFlexTextTheme(),
      scaffoldBackgroundColor: AppColors.scaffoldNewBackgroundColor,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: kIsWeb
            ? {
                for (final platform in TargetPlatform.values)
                  platform: const NoTransitionsBuilder(),
              }
            : const {},
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlackColor,
        primary: AppColors.primaryBlackColor,
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldNewBackgroundColor,
      ),
      textTheme: GoogleFonts.robotoFlexTextTheme().copyWith(
        bodyLarge: const TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: AppColors.scaffoldNewBackgroundColor,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: kIsWeb
            ? {
                for (final platform in TargetPlatform.values)
                  platform: const NoTransitionsBuilder(),
              }
            : const {},
      ),
    );
  }
}
