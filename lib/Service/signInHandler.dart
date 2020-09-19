import 'package:digihealth/UI/dashboard.dart';
import 'package:digihealth/UI/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error signing in. Please try later"),
              ),
            );
          } else if (snapshot.hasData) {
            print("User UID :: "+snapshot.data.uid);
            return Dashboard();
          }
          return HomePage();
        }
      },
    );
  }
}
