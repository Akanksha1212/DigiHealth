import 'package:flutter/cupertino.dart';

class Prescription {
  String medicineName;
  String medicineDesc;

  Prescription({
    @required this.medicineName,
    this.medicineDesc,
  });

  Prescription.fromMap(Map<String, dynamic> map) {
    this.medicineName = map["medicineName"];
    this.medicineDesc = map["medicineDesc"];
  }

  toJson() {
    return {
      "medicineName": this.medicineName,
      "medicineDesc": this.medicineDesc,
    };
  }
}
