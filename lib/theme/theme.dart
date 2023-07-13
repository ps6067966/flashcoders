import 'package:flashcoders/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'no_transition_builder.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundColor,
      ),
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
