import 'package:digihealth/Model/Other/address.dart';

class PatientModel {
  String name;
  String uid;
  String email;
  String contact;
  Address address;
  DateTime dateOfBirth;

  PatientModel({
    this.name,
    this.uid,
    this.email,
    this.contact,
    this.dateOfBirth,
    this.address,
  });

  PatientModel.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.uid = map["uid"];
    this.email = map["email"];
    this.contact = map["contact"];
    this.dateOfBirth = map["dateOfBirth"];
    this.address =
        map["address"] != null ? Address.fromMap(map["address"]) : null;
  }

  toJson() {
    return {
      "name": this.name,
      "uid": this.uid,
      "email": this.email,
      "contact": this.contact,
      "dateOfBirth": this.dateOfBirth,
      "address": this.address.toJson(),
    };
  }
}
