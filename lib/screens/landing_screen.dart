import 'package:aob_dashboard/components/dashboard_tab_bar.dart';
import 'package:aob_dashboard/components/dashboard_title_bar.dart';
import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:aob_dashboard/helpers/tab_change_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  static const String id = "landing_screen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<DashChangeNotifier>(context, listen: false).setup();
    var screenSize = MediaQuery.of(context).size;
    double sideBarWidth = 85;
    // List<Widget> dataDisplay = [
    //   AirOrderOfBattleTab(),
    //   Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
    //         border: Border.all(color: Colors.black, width: 3),
    //         color: Colors.black,
    //       ),
    //       child: Text("TEST", style: TextStyle(color: Colors.white))),
    // ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DashboardTitleBar(),
          Expanded(
            child: Row(
              children: [
                screenSize.width > 700 ? DashboardTabBar(sideBarWidth: sideBarWidth) : SizedBox(width: 0),
                Expanded(
                  child: Provider.of<TabChangeNotifier>(context, listen: true).tabContent,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Text(
                  "CAO: 2020-12-26T12:35",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    Provider.of<DataChangeNotifier>(context, listen: false).setLoading(true);
                    await Provider.of<DataChangeNotifier>(context, listen: false).updateAirData();
                    Provider.of<DataChangeNotifier>(context, listen: false).setLoading(false);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
