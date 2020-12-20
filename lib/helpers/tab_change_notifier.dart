import 'package:aob_dashboard/tabs/air_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/ground_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/navy_order_of_battle_tab.dart';
import 'package:aob_dashboard/tabs/tbm_order_of_battle_tab.dart';
import 'package:flutter/material.dart';

class TabChangeNotifier extends ChangeNotifier {
  int selectedTab = 1; //change back to zero
  List<bool> tabState = [true, false, false, false];
  Widget tabContent = GroundOrderOfBattleTab(); //change back to air

  void setup() {
    notifyListeners();
  }

  void changeTab(int selectedIndex) {
    //update icons
    tabState[selectedTab] = false;
    selectedTab = selectedIndex;
    tabState[selectedTab] = true;

    //update tab content
    switch (selectedIndex) {
      case 0:
        {
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
