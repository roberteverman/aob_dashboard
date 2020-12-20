import 'package:aob_dashboard/components/order_of_battle_chart_view.dart';
import 'package:aob_dashboard/components/order_of_battle_container.dart';
import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AirOrderOfBattleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              border: Border.all(color: Colors.black, width: 3),
              color: Colors.black,
            ),
            // padding: EdgeInsets.fromLTRB(30, 30, 15, 0),
            child: StaggeredGridView.extent(
              padding: EdgeInsets.fromLTRB(50, 30, 15, 0),
              maxCrossAxisExtent: 400,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              staggeredTiles: List.generate(aircraftData.length, (index) => StaggeredTile.fit(1)),
              children: List.generate(
                aircraftData.length,
                (index) => OrderOfBattleContainer(
                  airfield: aircraftData[index]['airfield'],
                  aircraft: aircraftData[index]['aircraft'],
                  status: aircraftData[index]['status'],
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
