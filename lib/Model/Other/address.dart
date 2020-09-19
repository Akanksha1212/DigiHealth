import 'package:flutter/cupertino.dart';

class Address {
  String locality;
  String landmark;
  String city;
  String state;
  int pincode;

  Address({
    @required this.locality,
    @required this.landmark,
    @required this.city,
    @required this.state,
    @required this.pincode,
  });

  Address.fromMap(Map<String, dynamic> map) {
    this.locality = map["locality"];
    this.landmark = map["landmark"];
    this.city = map["city"];
    this.state = map["state"];
    this.pincode = map["pincode"];
  }

  toJson() {
    return {
      "locality": this.locality,
      "landmark": this.landmark,
      "city": this.city,
      "state": this.state,
      "pincode": this.pincode,
    };
  }

  getDisplayAddress() {
    return '''$locality, $landmark, $city, $state, $pincode''';
  }
}
