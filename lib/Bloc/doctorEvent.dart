import 'package:digihealth/Model/Doctor/doctorModel.dart';
import 'package:flutter/cupertino.dart';

abstract class DoctorEvent {}

class RegisterDoctor extends DoctorEvent {
  DoctorModel doctorModel;
  RegisterDoctor({@required this.doctorModel});
}

class GetDoctorData extends DoctorEvent {
  String email;
  GetDoctorData({@required this.email});
}

class GetPatientReport extends DoctorEvent {
  String uid;
  GetPatientReport({@required this.uid});
}


