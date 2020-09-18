import 'Auth/loginPatient.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'Auth/loginChemist.dart';
import 'Auth/loginDoctor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GFButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPatient()));
            },
            text: "Pateint Login",
          ),
          GFButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginDoctor()));
            },
            text: "Doctor Login",
          ),
          GFButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginChemist()));
            },
            text: "Chemist Login",
          ),
        ],
      ),
    );
  }
}
