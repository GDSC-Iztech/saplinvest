import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saplinvest/view/HomeScreen.dart';

class AuthService extends GetxController {
  static final userCollection = FirebaseFirestore.instance.collection("users");
  static final firebaseAuth = FirebaseAuth.instance;

  static Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        await _registerUser(name: name, email: email, password: password);
        Get.to(const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      // Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
      Get.snackbar(
        "There is an error",
        e.message!,
        backgroundColor: Colors.red
      );
    }
  }

  static Future<void> signIn(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Get.to(const HomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      // Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
      Get.snackbar("There is an error", e.message!,
          backgroundColor: Colors.red);
    }
  }

  static Future<void> _registerUser(
      {required String name,
      required String email,
      required String password}) async {
    await userCollection
        .doc()
        .set({"email": email, "name": name, "password": password});
  }
}
