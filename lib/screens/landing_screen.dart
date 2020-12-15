import 'package:aob_dashboard/components/dashboard_tab_bar.dart';
import 'package:aob_dashboard/components/dashboard_title_bar.dart';
import 'package:aob_dashboard/components/order_of_battle_chart_view.dart';
import 'package:aob_dashboard/components/order_of_battle_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  static const String id = "landing_screen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double sideBarWidth = 85;

    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      body: Column(
        children: [
          DashboardTitleBar(),
          Expanded(
            child: Row(
              children: [
                screenSize.width > 700 ? DashboardTabBar(sideBarWidth: sideBarWidth) : SizedBox(width: 0),
                Expanded(
                  child: OrderOfBattleGridView(),
                ),
                screenSize.width > 1400 ? OrderOfBattleChartView(screenSize: screenSize) : SizedBox(width: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
