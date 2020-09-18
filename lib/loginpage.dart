import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  MyLoginPage createState() => new MyLoginPage();
}

class MyLoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
        backgroundColor: Colors.pink[200],
        automaticallyImplyLeading: false,
      ),
    );
  }
}