import 'package:flashcoders/features/delete_account/delete_notifier.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheOneAndOnlyDeleteAccountRequestScreen extends StatelessWidget {
  const TheOneAndOnlyDeleteAccountRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Delete Account Request",
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "The one and only App",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 500,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer(builder: (context, ref, child) {
                    final refRead =
                        ref.read(deleteAccountNotifierProvider.notifier);
                    final phoneNumber =
                        ref.watch(deleteAccountNotifierProvider);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Are you sure you want to delete your account?",
                          style: TextStyle(fontSize: 24),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Ask for phone number text field
                        TextFormField(
                          initialValue: phoneNumber.value,
                          decoration: const InputDecoration(
                            hintText: "Enter your phone number",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            refRead.onChange(value);
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            refRead.submitRequest(context);
                          },
                          child: const Text("Submit"),
                        )
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
