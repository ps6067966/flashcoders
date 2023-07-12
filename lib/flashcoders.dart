import 'package:flutter/material.dart';

import 'features/index/index_screen.dart';

class FlashCoders extends StatelessWidget {
  const FlashCoders({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Coders',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IndexScreen(),
    );
  }
}
