import 'package:flashcoders/routing/app_router.dart';
import 'package:flashcoders/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlashCoders extends StatelessWidget {
  const FlashCoders({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flash Coders',
        theme: AppTheme.getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
