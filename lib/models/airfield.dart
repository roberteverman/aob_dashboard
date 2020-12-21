import 'package:flutter/material.dart';

class Airfield {
  Airfield({this.name, this.status, this.aircraft});
  String name;
  String status;
  List<dynamic> aircraft;

  factory Airfield.fromJson(Map<String, dynamic> json) {
    return Airfield(
      name: json['airfield'],
      status: json['status'],
      aircraft: json['aircraft'],
    );
  }
}
