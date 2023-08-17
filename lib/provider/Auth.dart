import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authintcation with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<void>? signUp(String email, String password, String phonNum) {
    final auth_result = auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => _fireStore
            .collection("UserPhone")
            .doc(value.user!.uid)
            .set({'email': email, 'phone': phonNum}));

    return auth_result;
  }

  Future<UserCredential> signIn(String email, String password) {
    final auth_result =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return auth_result;
  }
}
