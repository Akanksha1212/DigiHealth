import 'package:digihealth/Service/signInMethod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoginChemist extends StatefulWidget {
  @override
  LoginChemistState createState() => new LoginChemistState();
}

class LoginChemistState extends State<LoginChemist> {
  final formKey = GlobalKey<FormState>();
  User user;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn'),
        backgroundColor: Colors.pink[200],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Verificiation Code",
                  ),
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Please Enter a Verification Code";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Id",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Please Enter a Email Id";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  obscureText: true,
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Please Enter a Password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: GFButton(
                        key: ValueKey("sign in"),
                        child: Text("Sign In"),
                        type: GFButtonType.outline,
                        onPressed: () async {
                          user = await SignInMethods.trySignIn(
                              _emailController.text, _passController.text);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GFButton(
                        key: ValueKey("sign up"),
                        child: Text("Sign Up"),
                        type: GFButtonType.outline,
                        onPressed: () {
                          SignInMethods.signUpNewUser(
                            _emailController.text,
                            _passController.text,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
