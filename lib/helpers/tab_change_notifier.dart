import 'dart:convert';

import 'package:aob_dashboard/tabs/air_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/ground_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/navy_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/tbm_order_of_battle_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class TabChangeNotifier extends ChangeNotifier {
  int selectedTab = 0;
  List<bool> tabState = [true, false, false, false];
  Widget tabContent = AirOrderOfBattleTab();

  void setup() {
    notifyListeners();
  }

  void changeTab(int selectedIndex) async {
    //update icons
    tabState[selectedTab] = false;
    selectedTab = selectedIndex;
    tabState[selectedTab] = true;

    //update tab content
    switch (selectedIndex) {
      case 0:
        {
          // String url = "https://my-json-server.typicode.com/roberteverman/demo/air";
          // var response = await http.get(url);
          // if (response.statusCode == 200) {
          //   print(response.body);
          // }

          tabContent = AirOrderOfBattleTab();
        }
        break;

      case 1:
        {
          tabContent = GroundOrderOfBattleTab();
        }
        break;

      case 2:
        {
          tabContent = NavyOrderOfBattleTab();
        }
        break;

      case 3:
        {
          tabContent = TBMOrderOfBattleTab();
        }
        break;

      default:
        {
          tabContent = Text("Placeholder");
        }
        break;
    }
    notifyListeners();
  }
}
