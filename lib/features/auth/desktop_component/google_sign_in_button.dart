// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
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

import '../config/google_client_id.dart';

class GoogleSignInButton extends StatelessWidget {
  GoogleSignInButton({super.key});

  final GoogleSignIn googleSignIn =
      GoogleSignIn(clientId: kIsWeb ? googleClientId : null);
  final FirebaseAuth auth = FirebaseAuth.instance;
  // googleSignIn.disconnect();

  Stream<GoogleSignInAccount?> listenAccountChanges(
      BuildContext context, WidgetRef ref) async* {
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      if (auth.currentUser != null) {
        GoRouter.of(context).pushReplacementNamed(indexPath);
        return;
      }
      final GoogleSignInAccount? googleUser = googleSignIn.currentUser;
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          final user = userCredential.user!;
          UserApi.updateUserDetails(
            name: user.displayName ?? "",
            email: user.email ?? "",
            uid: user.uid,
            photoUrl: user.photoURL ?? "",
            roles: ref
                .watch(roleSelectorNotifierProvider)
                .value!
                .where((e) => e.isSelected)
                .map((e) => e.name.getName)
                .toList(),
          );
          if (context.mounted) {
            GoRouter.of(context).pushReplacementNamed(indexPath);
          }
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
