import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/app_colors.dart';

class EnrollNowButton extends StatelessWidget {
  const EnrollNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPress: () async {
        await Future.delayed(
          const Duration(milliseconds: 500),
          () => null,
        );

        // ignore: use_build_context_synchronously
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return Center(
              child: CupertinoAlertDialog(
                title: const Text(
                  "Reserve your seat now!",
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColors.primaryBlackColor,
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Have a refferal code?"),
                    const SizedBox(
                      height: 8,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Referral Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text(
                      "Pay",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      launchUrl(
                          Uri.parse("https://rzp.io/l/flutter-internship"));
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      width: 200,
      height: 60,
      text: "Enroll Now",
      gradient: const LinearGradient(colors: [
        AppColors.primaryColor,
        AppColors.scaffoldBackgroundColor,
      ]),
      selectedTextColor: AppColors.primaryBlackColor,
      backgroundColor: Colors.white,
      transitionType: TransitionType.LEFT_TO_RIGHT,
      textStyle: const TextStyle(
        fontSize: 20,
        letterSpacing: 1.2,
        color: AppColors.primaryBlackColor,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
