import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'order_of_battle_container.dart';

class OrderOfBattleGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
