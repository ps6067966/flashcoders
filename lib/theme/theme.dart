import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'no_transition_builder.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryBlackColor,
        primary: AppColors.primaryBlackColor,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
      textTheme: GoogleFonts.robotoFlexTextTheme(),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
