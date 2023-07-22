import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../theme/app_colors.dart';
import 'coupon_applied_notifier.dart';

class EnrollNowButton extends StatelessWidget {
  const EnrollNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return AnimatedButton(
        onPress: () async {
          await Future.delayed(
            const Duration(milliseconds: 500),
            () => null,
          );
          ref
              .read(couponAppliedNotifierProvider.notifier)
              .checkIfCouponIsCorrect("");

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
                      const Text("Have a coupon code?"),
                      const SizedBox(
                        height: 8,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Coupon Code",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onChanged: (value) async {
                            ref
                                .read(couponAppliedNotifierProvider.notifier)
                                .checkIfCouponIsCorrect(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Consumer(builder: (context, ref, child) {
                        final isCouponApplied =
                            ref.watch(couponAppliedNotifierProvider).value ??
                                false;
                        if (!isCouponApplied) {
                          return const SizedBox();
                        }
                        return const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check, size: 20, color: Colors.green),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Coupon Applied",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        );
                      })
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
                    Consumer(builder: (context, ref, child) {
                      return CupertinoDialogAction(
                        child: const Text(
                          "Pay",
                          style: TextStyle(
                            color: AppColors.primaryBlackColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          final isCouponApplied =
                              ref.watch(couponAppliedNotifierProvider).value ??
                                  false;
                          if (isCouponApplied) {
                            launchUrl(Uri.parse(
                                "https://rzp.io/l/flutter-internship"));
                          } else {
                            launchUrl(Uri.parse(
                                "https://pages.razorpay.com/flutterinternshipoffer"));
                          }
                        },
                      );
                    }),
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
    });
  }
}
