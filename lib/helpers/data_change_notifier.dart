import 'package:flutter/material.dart';
import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataChangeNotifier extends ChangeNotifier {
  List<Map> airData = testAirData;
  List<Map> groundData = testGroundData;

  // void updateAirData(List<Map> updateData) {
  //   airData = updateData;
  //   notifyListeners();
  // }

  Future<void> updateAirData() async {
    String configString = await rootBundle.loadString('assets/config.json');
    Map configJSON = json.decode(configString);

    if (configJSON['use_test_data'] == true) {
      String url = configJSON['aob'];
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // var x = json.decode(response.body).toList();
        // print(x[0]);
        // Map y = Map.fromIterable(x);
        // print(y.);

        // //print(response.body);
        // var newList = json.decode(response.body).toList();
        // print(newList.runtimeType);
        // airData = newList;
        // // print(airData.runtimeType);
        //
        // // List<Map> blah = List<Map>.from(list);
        // // // airData = blah;
        // // print(blah[0]['airfield']);
        print("finished");
      }
    }
    notifyListeners();
  }
}
