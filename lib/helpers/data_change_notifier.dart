import 'package:aob_dashboard/models/airfield.dart';
import 'package:flutter/material.dart';
import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataChangeNotifier extends ChangeNotifier {
  List<Airfield> airData;
  List<Map> groundData = testGroundData;

  Future<void> updateAirData() async {
    print("Updating Air Data");
    String configString = await rootBundle.loadString('assets/config.json');
    Map configJSON = json.decode(configString);
    if (configJSON['use_test_data'] == false) {
      airData = [];
      String url = configJSON['aob'];
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var retrievedData = json.decode(response.body).toList();
        for (int i = 0; i < retrievedData.length; i++) {
          Airfield newEntry = Airfield.fromJson(retrievedData[i]);
          airData.add(newEntry);
        }
      }
    } else {
      airData = [];
      for (int i = 0; i < testAirData.length; i++) {
        Airfield newEntry = Airfield.fromJson(testAirData[i]);
        airData.add(newEntry);
      }
    }
    notifyListeners();
  }
}
