import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'no_transition_builder.dart';

class AppTheme {
 static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: kIsWeb
            ? {
                for (final platform in TargetPlatform.values)
                  platform: const NoTransitionsBuilder(),
              }
            : const {
              },
      ),
    );

  }
}
