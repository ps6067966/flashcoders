import 'package:firebase_core/firebase_core.dart';
import 'package:flashcoders/credentials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';
import 'flashcoders.dart';
import 'global/analytics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_const_constructors
  setUrlStrategy(PathUrlStrategy());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  await Supabase.initialize(
    url: "https://vnvaxmuoczrmbrxfkuyw.supabase.co",
    anonKey: anonKey,
  );
  Analytics.initialLog();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const FlashCoders());
}
