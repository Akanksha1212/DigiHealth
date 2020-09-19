import 'package:digihealth/Model/Other/address.dart';

class DoctorModel {
  String name;
  String uid;
  String email;
  String contact;
  DateTime dateOfBirth;
  String clinicName;
  Address address;
  String verificationCode;
  String specialization;

  DoctorModel({
    this.name,
    this.uid,
    this.email,
    this.contact,
    this.dateOfBirth,
    this.clinicName,
    this.address,
    this.verificationCode,
    this.specialization,
  });

  DoctorModel.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.uid = map["uid"];
    this.email = map["email"];
    this.contact = map["contact"];
    this.dateOfBirth = map["dateOfBirth"].toDate();
    this.clinicName = map["clinicName"];
    this.address =
        map["address"] != null ? Address.fromMap(map["address"]) : null;
    this.verificationCode = map["verificationCode"];
    this.specialization = map["specialization"];
  }

  toJson() {
    return {
      "name": this.name,
      "uid": this.uid,
      "email": this.email,
      "contact": this.contact,
      "dateOfBirth": this.dateOfBirth,
      "clinicName": this.clinicName,
      "address": this.address.toJson(),
      "verificationCode": this.verificationCode,
      "specialization": this.specialization,
    };
  }
}
