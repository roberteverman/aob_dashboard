import 'package:aob_dashboard/components/order_of_battle_chart_view.dart';
import 'package:aob_dashboard/components/order_of_battle_grid_view.dart';
import 'package:flutter/material.dart';

class AirOrderOfBattleTab extends StatelessWidget {
  const AirOrderOfBattleTab({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: OrderOfBattleGridView()),
        screenSize.width > 1400 ? OrderOfBattleChartView(screenSize: screenSize) : SizedBox(width: 0),
      ],
    );
  }
}
