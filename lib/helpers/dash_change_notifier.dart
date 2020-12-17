import 'package:flutter/material.dart';
import 'package:aob_dashboard/helpers/test_data.dart';

class DashChangeNotifier extends ChangeNotifier {
  List<Map> currentAirOB = aircraftData;
  int selectedTab = 0;
  List<bool> tabState = [true, false, false, false];

  void setup() {
    currentAirOB = aircraftData;
    notifyListeners();
  }

  void changeTab(int selectedIndex) {
    tabState[selectedTab] = false;
    selectedTab = selectedIndex;
    tabState[selectedTab] = true;
    notifyListeners();
  }
}
