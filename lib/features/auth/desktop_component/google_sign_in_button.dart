// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flashcoders/credentials.dart';
import 'package:flashcoders/features/auth/api/update_user_details.dart';
import 'package:flashcoders/features/auth/role_model_notifier.dart';
import 'package:flashcoders/features/index/index_router.dart';
import 'package:flashcoders/global/enum/roles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart' as web;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../config/google_client_id.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({super.key});

  final GoogleSignIn googleSignIn =
      GoogleSignIn(clientId: kIsWeb ? googleClientId : null);

  // googleSignIn.disconnect();

  Stream<GoogleSignInAccount?> listenAccountChanges(
      BuildContext context, WidgetRef ref) async* {
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (supabase.auth.currentUser != null) {
        GoRouter.of(context).pushReplacementNamed(indexPath);
        return;
      }
      final GoogleSignInAccount? googleUser = googleSignIn.currentUser;
      if (googleUser != null) {
        try {
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;
          final authResponse = await supabase.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleAuth.idToken ?? "",
            accessToken: googleAuth.accessToken,
          );
          log("${authResponse.user?.userMetadata}");
          await UserApi.updateUserDetails(
            name: authResponse.user?.userMetadata?['full_name'] ?? "",
            email: authResponse.user?.userMetadata?['email'] ?? "",
            uid: authResponse.user?.id ?? "",
            photoUrl: authResponse.user?.userMetadata?['avatar_url'] ?? "",
            roles: ref
                .watch(roleSelectorNotifierProvider)
                .value!
                .where((e) => e.isSelected)
                .map((e) => e.name.getName)
                .toList(),
          );
        } catch (e) {
          log("$e");
        }
        if (context.mounted) {
          context.push(indexPath);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return StreamBuilder(
          stream: listenAccountChanges(context, ref),
          builder: (context, snapshot) {
            return (GoogleSignInPlatform.instance as web.GoogleSignInPlugin)
                .renderButton(
                    configuration: web.GSIButtonConfiguration(
              size: web.GSIButtonSize.large,
              shape: web.GSIButtonShape.pill,
              logoAlignment: web.GSIButtonLogoAlignment.left,
              theme: web.GSIButtonTheme.filledBlack,
              text: web.GSIButtonText.continueWith,
              type: web.GSIButtonType.standard,
            ));
          });
    });
  }
}
