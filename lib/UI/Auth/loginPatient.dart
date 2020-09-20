import 'package:digihealth/Bloc/patientBloc.dart';
import 'package:digihealth/Service/signInMethod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:getwidget/getwidget.dart';

class LoginPatient extends StatefulWidget {
  @override
  LoginPatientState createState() => new LoginPatientState();
}

class LoginPatientState extends State<LoginPatient> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  PatientBloc patientBloc;
  User user;
  @override
  Widget build(BuildContext context) {
    patientBloc = BlocProvider.of<PatientBloc>(context);
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
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email Id",
                  ),
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
                            patientBloc,
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
