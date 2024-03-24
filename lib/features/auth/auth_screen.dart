import 'package:flashcoders/features/auth/m_auth_screen.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flutter/material.dart';

import '../../global_components/xresponsive_wrapper.dart';
import 'desktop_component/google_sign_in_button.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return XResponsiveWrapper(
      mobile: const MAuthScreen(),
      desktop: Scaffold(
        appBar: const XAppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 700,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Flash Coders",
                              style: TextStyle(
                                fontSize: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 700,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GoogleSignInButton(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
