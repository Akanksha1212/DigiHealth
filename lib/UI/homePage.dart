import 'package:digihealth/Bloc/patientBloc.dart';
import 'package:digihealth/Bloc/patientEvent.dart';
import 'package:digihealth/UI/Patient/patients.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'Auth/loginPatient.dart';
import 'package:flutter/material.dart';
import 'Auth/loginChemist.dart';
import 'Auth/loginDoctor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PatientBloc _patientBloc = BlocProvider.of<PatientBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("DigiHealth"),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink[300],
                ),
                child: Center(
                  child: Text("Patients Login"),
                ),
              ),
              onTap: () {
                //Dummy
                _patientBloc
                    .mapEventToState(GetPatientData(email: "teke@mail.com"));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientDashboard()));
              },
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink[400],
                ),
                child: Center(
                  child: Text("Doctor Login"),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginDoctor()));
              },
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink[500],
                ),
                child: Center(
                  child: Text("Chemist Login"),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginChemist()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
