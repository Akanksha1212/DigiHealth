import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInMethods {
  static Future<User> trySignIn(String email, String password) async {
    User firebaseUser;
    try {
      firebaseUser = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
    } on PlatformException catch (e) {
      print("Error ${e.message}");
      Fluttertoast.showToast(msg: "${e.message}");
    }

    if (firebaseUser != null) {
      print("Successfully Signed In with Email and Password");
      return firebaseUser;
    } else {
      print("Failed SignIn with Email and Password");
      return null;
    }
  }

  static Future<User> signUpNewUser(String email, String password) async {
    User firebaseUser;
    try {
      firebaseUser =
          (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
              .user;
    } catch (e) {
      // print("Error ${e.message}");
      Fluttertoast.showToast(msg: "${e.message}");
    }
    if (firebaseUser != null) {
      print("Successfully Signed Up with Email and Password");
      print("new user In UID: ${firebaseUser.uid}");
      if (firebaseUser.emailVerified) {
        print("Email already verified");
      } else {
        print("Sending email verification link");
        await firebaseUser.sendEmailVerification();
      }
      return firebaseUser;
    } else {
      print("Failed SignUp with Email and Password");
      return null;
    }
  }
}
