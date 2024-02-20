import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../view/screens/SaplingPage.dart';

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
        await _registerUser(
            name: name,
            email: email,
            password: password,
            userId: userCredential.user!.uid);
        Get.to(const SaplingPage());
      }
    } on FirebaseAuthException catch (e) {
      // Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
      Get.snackbar("There is an error", e.message!,
          backgroundColor: Colors.red);
    }
  }

  static Future<void> signIn(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Get.to(const SaplingPage());
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
      required String password,
      required String userId}) async {
    await userCollection
        .doc(userId)
        .set({"email": email, "name": name, "password": password});
  }

  static Future<void> signInWithGoogle() async {
    //Oturum açma sürecini başlat
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Süreç içerisinden bilgileri al
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Kullanıcı nesnesi oluştur
    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    //Kullanıcı girişini sağla

    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        Get.to(const SaplingPage());
      }
    } on FirebaseAuthException catch (e) {
      // Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
      Get.snackbar("There is an error", e.message!,
          backgroundColor: Colors.red);
    }
  }
}
