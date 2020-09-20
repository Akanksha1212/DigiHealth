import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digihealth/Model/Doctor/doctorModel.dart';
import 'package:digihealth/Model/Report/reportModel.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'doctorEvent.dart';

class DoctorBloc extends Bloc {
  DoctorModel _doctor;
  DoctorModel get getDoctor => _doctor;
  List<Report> _report;
  List<Report> get getReport => _report;
  StreamController<DoctorEvent> _eventController =
      StreamController<DoctorEvent>.broadcast();
  StreamSink<DoctorEvent> get eventSink => _eventController.sink;
  Stream<DoctorEvent> get eventStream => _eventController.stream;

  StreamController<DoctorModel> _doctorController =
      StreamController<DoctorModel>.broadcast();
  StreamSink<DoctorModel> get doctorSink => _doctorController.sink;
  Stream<DoctorModel> get doctorStream => _doctorController.stream;

  StreamController<List<Report>> _reportController =
      StreamController<List<Report>>.broadcast();
  StreamSink<List<Report>> get reportSink => _reportController.sink;
  Stream<List<Report>> get reportStream => _reportController.stream;

  DoctorBloc() {
    eventStream.listen(mapEventToState);
  }
  void mapEventToState(DoctorEvent event) {
    if (event is RegisterDoctor) {
    } else if (event is GetDoctorData) {
      FirebaseFirestore.instance
          .collection("doctors")
          .where("email", isEqualTo: event.email)
          .snapshots()
          .listen((snapshot) {
        _doctor = DoctorModel.fromMap(snapshot.docs[0].data());
        doctorSink.add(_doctor);
      });
    } else if (event is GetPatientReport) {
      FirebaseFirestore.instance
          .collection("records")
          .where("patientUID", isEqualTo: event.uid)
          .snapshots()
          .listen(
        (snapshot) {
          _report = List<Report>();
          for (int i = 0; i < snapshot.docs.length; i++) {
            _report.add(Report.fromMap(snapshot.docs[i].data()));
          }
          reportSink.add(_report);
        },
      );
    }
  }

  @override
  void dispose() {
    _eventController.close();
    _doctorController.close();
    _reportController.close();
  }
}
