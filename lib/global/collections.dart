import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userCollection = FirebaseFirestore.instance.collection("user");
final currentUserSnapshot = userCollection
    .doc(FirebaseAuth.instance.currentUser?.email ?? "")
    .get();
