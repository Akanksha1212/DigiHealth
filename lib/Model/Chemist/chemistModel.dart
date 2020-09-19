import 'package:digihealth/Model/Other/address.dart';

class ChemistModel {
  String name;
  String uid;
  String email;
  String contact;
  String shopName;
  String verificationCode;
  Address address;

  ChemistModel({
    this.name,
    this.uid,
    this.email,
    this.contact,
    this.shopName,
    this.verificationCode,
    this.address,
  });

  ChemistModel.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.uid = map["uid"];
    this.email = map["email"];
    this.contact = map["contact"];
    this.shopName = map["shopName"];
    this.verificationCode = map["verificationCode"];
    this.address =
        map["address"] != null ? Address.fromMap(map["address"]) : null;
  }

  toJson() {
    return {
      "name": this.name,
      "uid": this.uid,
      "email": this.email,
      "contact": this.contact,
      "shopName": this.shopName,
      "verificationCode": this.verificationCode,
      "address": this.address.toJson(),
    };
  }
}
