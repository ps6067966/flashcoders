import 'package:flashcoders/routing/app_router.dart';
import 'package:flashcoders/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FlashCoders extends StatelessWidget {
  const FlashCoders({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flash Coders',
        showPerformanceOverlay: false,
        localizationsDelegates: const [],
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        themeMode: ThemeMode.dark,
        theme: AppTheme.getTheme(),
        darkTheme: AppTheme.getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
