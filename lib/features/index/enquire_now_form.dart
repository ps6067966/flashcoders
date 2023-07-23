import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EnquireForm {
  static _storeEquireFormData(String emailOrPhone, BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection("enquiry").doc().set({
        "email_or_phone": emailOrPhone,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Thank you for your interest! We will contact you soon!"),
          ),
        );
      });
    } catch (e) {
      log("$e");
    }
  }

  static showEnquireNowForm(BuildContext context) {
    final TextEditingController emailOrPhoneController =
        TextEditingController();
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Build MVP faster, Don't let your users wait!"),
          content: Column(
            children: [
              const Text(
                "We will get in touch with you within 24 hours or You can call us at +91 8058301863 for any queries.",
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoTextField(
                controller: emailOrPhoneController,
                placeholder: "Email / Phone Number",
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CupertinoColors.systemGrey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text("Close"),
              onPressed: () {
                context.pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text("Submit"),
              onPressed: () {
                if (emailOrPhoneController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter email or phone number"),
                    ),
                  );
                  return;
                }
                context.pop();
                _storeEquireFormData(emailOrPhoneController.text, context);
              },
            ),
          ],
        );
      },
    );
  }
}
