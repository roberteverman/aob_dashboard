import 'dart:async';

import 'package:aob_dashboard/components/air_order_of_battle_chart_view.dart';
import 'package:aob_dashboard/components/order_of_battle_container.dart';
import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';

class AirOrderOfBattleTab extends StatefulWidget {
  @override
  _AirOrderOfBattleTabState createState() => _AirOrderOfBattleTabState();
}

class _AirOrderOfBattleTabState extends State<AirOrderOfBattleTab> {
  Timer timer;

  @override
  void initState() {
    if (Provider.of<DataChangeNotifier>(context, listen: false).airData == null) {
      loadData();
    }
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = new Timer.periodic(Duration(seconds: Provider.of<DataChangeNotifier>(context, listen: false).refreshRate), (timer) {
      loadData();
    });
  }

  void loadData() async {
    Provider.of<DataChangeNotifier>(context, listen: false).loading = true;
    await Provider.of<DataChangeNotifier>(context, listen: false).updateAirData();
    setState(() {
      Provider.of<DataChangeNotifier>(context, listen: false).loading = false;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    print("timer cancelled");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Provider.of<DataChangeNotifier>(context, listen: true).loading == true
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingBouncingGrid.square(),
              Text("Loading..."),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
                    border: Border.all(color: Colors.black, width: 3),
                    color: Colors.black,
                  ),
                  // padding: EdgeInsets.fromLTRB(30, 30, 15, 0),
                  child: StaggeredGridView.extent(
                    padding: EdgeInsets.fromLTRB(50, 30, 15, 0),
                    maxCrossAxisExtent: 400,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    staggeredTiles:
                        List.generate(Provider.of<DataChangeNotifier>(context, listen: true).airData.length, (index) => StaggeredTile.fit(1)),
                    children: List.generate(
                      Provider.of<DataChangeNotifier>(context, listen: true).airData.length,
                      (index) => OrderOfBattleContainer(
                        airfield: Provider.of<DataChangeNotifier>(context, listen: true).airData[index].name,
                        aircraft: Provider.of<DataChangeNotifier>(context, listen: true).airData[index].aircraft,
                        status: Provider.of<DataChangeNotifier>(context, listen: true).airData[index].status,
                      ),
                    ),
                  ),
                ),
              ),
              screenSize.width > 1400 ? AirOrderOfBattleChartView(screenSize: screenSize) : SizedBox(width: 0),
            ],
          );
  }
}
