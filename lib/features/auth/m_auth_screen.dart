import 'package:flashcoders/global_components/app_bar/x_mobile_app_bar.dart';
import 'package:flashcoders/global_components/x_drawer.dart';
import 'package:flutter/material.dart';

import 'desktop_component/google_sign_in_button.dart';
import 'mobile_component/m_select_role.dart';

class MAuthScreen extends StatelessWidget {
  const MAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const XDrawer(),
        appBar: const XMobileAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Flash Coders",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const MSelectRole(),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
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
                      const Text(
                        "Note: You can select multiple roles, minimum 1 role is required to continue.",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
