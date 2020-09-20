import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digihealth/Bloc/patientEvent.dart';
import 'package:digihealth/Model/Patient/patientModel.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PatientBloc extends Bloc {
  PatientModel _patient;
  PatientModel get getPatient => _patient;
  StreamController<PatientEvent> _eventController =
      StreamController<PatientEvent>.broadcast();
  StreamSink<PatientEvent> get eventSink => _eventController.sink;
  Stream<PatientEvent> get eventStream => _eventController.stream;

  StreamController<PatientModel> _patientController =
      StreamController<PatientModel>.broadcast();
  StreamSink<PatientModel> get patientSink => _patientController.sink;
  Stream<PatientModel> get patientStream => _patientController.stream;

  PatientBloc() {
    eventStream.listen(mapEventToState);
  }
  void mapEventToState(PatientEvent event) {
    if (event is RegisterPatient) {
    } else if (event is GetPatientData) {
      FirebaseFirestore.instance
          .collection("patients")
          .where("email", isEqualTo: event.email)
          .snapshots()
          .listen((snapshot) {
        _patient = PatientModel.fromMap(snapshot.docs[0].data());
        patientSink.add(_patient);
      });
    }
  }

  @override
  void dispose() {
    _eventController.close();
    _patientController.close();
  }
}
