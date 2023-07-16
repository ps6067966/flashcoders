import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class Analytics {
  static void initialLog() {
    analytics.app.setAutomaticDataCollectionEnabled(true);
    analytics.setAnalyticsCollectionEnabled(true);
    analytics.logAppOpen();
    if (!kIsWeb) {
      analytics.setConsent(
          adStorageConsentGranted: true, analyticsStorageConsentGranted: true);
    }
  }
}
