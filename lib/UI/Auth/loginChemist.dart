import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LoginChemist extends StatefulWidget {
  @override
  LoginChemistState createState() => new LoginChemistState();
}

class LoginChemistState extends State<LoginChemist> {
  final formKey = GlobalKey<FormState>();
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
                child: GFButton(
                  onPressed: () {},
                  text: "Login",
                  color: Colors.pink[200],
                  shape: GFButtonShape.standard,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
