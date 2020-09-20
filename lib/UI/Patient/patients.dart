import 'package:digihealth/UI/Patient/patientHome.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import '../qrCodeGenerator.dart';

class PatientDashboard extends StatefulWidget {
  @override
  MyPatientDashboard createState() => new MyPatientDashboard();
}

class MyPatientDashboard extends State<PatientDashboard> {
  int _selectedIndex = 0;

  void onTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget build(BuildContext context) {
    getScreen(int index) {
      if (index == 0) {
        return PatientHome();
      } else if (index == 1) {
        return QRGenerator(
          uid: "Wf0QZhqBUPLYBMZYHSTy",
        );
      }
    }

    return Scaffold(
      body: getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
              ),
              title: Text('1')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.plus_circle,
                size: 30.0,
              ),
              title: Text('2')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.user,
                size: 30.0,
              ),
              title: Text('3')),
        ],
        onTap: onTapped,
      ),
    );
  }
}
