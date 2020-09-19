import 'package:digihealth/Model/Report/prescriptionModel.dart';

class Report {
  String reportUID;
  DateTime reportDate;
  String description;
  String patientUID;
  String patientName;
  String doctorName;
  String doctorUID;
  List<Prescription> prescription;

  Report({
    this.reportDate,
    this.description,
    this.reportUID,
    this.patientUID,
    this.patientName,
    this.doctorName,
    this.doctorUID,
    this.prescription,
  });

  Report.fromMap(Map<String, dynamic> map) {
    this.reportDate = map["reportDate"].toDate();
    this.reportUID = map["reportUID"];
    this.description = map["description"];
    this.patientName = map["patientName"];
    this.patientUID = map["patientUID"];
    this.doctorName = map["doctorName"];
    this.doctorUID = map["doctorUID"];
    this.prescription = List<Prescription>();
    for (var i = 0; i < map["prescription"].length; i++) {
      this.prescription.add(Prescription.fromMap(map["prescription"][i]));
    }
  }

  toJson() {
    return {
      "reportDate": this.reportDate,
      "reportUID": this.reportUID,
      "description": this.description,
      "patientName": this.patientName,
      "patientUID": this.patientUID,
      "doctorName": this.doctorName,
      "doctorUID": this.doctorUID,
      "prescription": this.prescription.map((e) => e.toJson()),
    };
  }
}
