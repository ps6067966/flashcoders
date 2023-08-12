import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deleteAccountNotifierProvider =
    AsyncNotifierProvider<DeleteAccountNotifier, String>(() {
  return DeleteAccountNotifier();
});

class DeleteAccountNotifier extends AsyncNotifier<String> {
  String request = "";
  final deleteAccountCollection =
      FirebaseFirestore.instance.collection("delete_account");

  void onChange(String value) {
    request = value;
    state = AsyncData(request);
  }

  void submitRequest(BuildContext context) async {
    if (request.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a Phone number / Email"),
        ),
      );
      return;
    }
    await deleteAccountCollection.add({"request": request});
    if (context.mounted) {
      request = "";
      state = AsyncData(request);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Request submitted"),
        ),
      );
    }
  }

  @override
  String build() {
    return request;
  }
}
