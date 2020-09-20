import 'package:digihealth/Model/Patient/patientModel.dart';
import 'package:flutter/cupertino.dart';

abstract class PatientEvent {}

class RegisterPatient extends PatientEvent {
  PatientModel patientModel;
  RegisterPatient({@required this.patientModel});
}

class GetPatientData extends PatientEvent {
  String email;
  GetPatientData({@required this.email});
}
