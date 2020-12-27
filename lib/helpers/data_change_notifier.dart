import 'package:aob_dashboard/models/airfield.dart';
import 'package:flutter/material.dart';
import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataChangeNotifier extends ChangeNotifier {
  List<Airfield> airData;
  List<Map> groundData = testGroundData;
  int refreshRate = 20;
  bool loading = false;
  List<String> airfieldList = [];

  void setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }

  Future<void> updateAirData() async {
    print("Updating Air Data");
    String configString = await rootBundle.loadString('assets/config.json');
    Map configJSON = json.decode(configString);
    refreshRate = configJSON['refresh_rate'];
    if (configJSON['use_test_data'] == false) {
      airData = [];
      String url = configJSON['aob_get'];
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
    for (Airfield airfield in airData) {
      if (!airfieldList.contains(airfield.name)) {
        airfieldList.add(airfield.name);
      }
      airfieldList.sort();
    }
    notifyListeners();
  }

  Future<void> pushAirData(int action, int number, String origin, String destination) async {
    print("Pushing Air Data");
    String configString = await rootBundle.loadString('assets/config.json');
    Map configJSON = json.decode(configString);
    if (configJSON['use_test_data'] == false) {
      String url = configJSON['aob_post'];
      // print(url);
      // print(jsonEncode(<String, dynamic>{
      //   'action': action,
      //   'number': number,
      //   'origin': origin,
      //   'destination': destination,
      // }));
      var response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(<String, dynamic>{
          'action': action,
          'number': number,
          'origin': origin,
          'destination': destination,
        }),
      );
      if (response.statusCode != 201) {
        Fluttertoast.showToast(
          msg: "Success!",
          webBgColor: "#28A228",
          timeInSecForIosWeb: 3,
          webPosition: "right",
        );
        updateAirData();
      } else {
        Fluttertoast.showToast(
          msg: "Error!",
          webBgColor: "#dc2a2a",
          timeInSecForIosWeb: 3,
          webPosition: "right",
        );
      }
    }
  }
}
