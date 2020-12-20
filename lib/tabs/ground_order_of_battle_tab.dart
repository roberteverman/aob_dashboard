import 'package:aob_dashboard/components/ground_order_of_battle_chart_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/components/accordian/gf_accordian.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:aob_dashboard/helpers/test_data.dart';

class GroundOrderOfBattleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        border: Border.all(color: Colors.black, width: 3),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: StaggeredGridView.extent(
              padding: EdgeInsets.fromLTRB(50, 20, 20, 0),
              maxCrossAxisExtent: 600,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              staggeredTiles: List.generate(testGroundData.length, (index) => StaggeredTile.fit(1)),
              children: List.generate(
                testGroundData.length,
                (index) => GFAccordion(
                  titleBorderRadius: BorderRadius.circular(20),
                  contentBorderRadius: BorderRadius.circular(10),
                  collapsedTitleBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
                  expandedTitleBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
                  contentBackgroundColor: Color.fromRGBO(50, 50, 50, 1),
                  titleChild: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            testGroundData[index]['parent'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[50],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LinearPercentIndicator(
                          progressColor: Colors.red,
                          lineHeight: 25,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          percent: testGroundData[index]['strength'],
                          center: Text(
                            (testGroundData[index]['strength'] * 100).toString().split('.')[0] + "%",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  contentChild: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: true,
                                horizontalInterval: 0.1,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.white24,
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Colors.white24,
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              minY: 0,
                              maxY: 1,
                              titlesData: FlTitlesData(
                                leftTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                  margin: 10,
                                  getTitles: (value) {
                                    switch ((value * 10).toInt()) {
                                      case 0:
                                        return '0%';
                                      case 10:
                                        return '100%';
                                    }
                                    return "";
                                  },
                                ),
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                  margin: 10,
                                  getTitles: (value) {
                                    switch (value.toInt()) {
                                      case 1:
                                        return '-24H';
                                      case 12:
                                        return ' -12H';
                                      case 24:
                                        return 'Now';
                                    }
                                    return "";
                                  },
                                ),
                              ),
                              borderData: FlBorderData(
                                show: true,
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  left: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  right: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  top: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  barWidth: 8,
                                  colors: [Colors.red],
                                  dotData: FlDotData(show: false),
                                  isStrokeCapRound: true,
                                  spots: List.generate(
                                      testGroundData[index]['strength_history'].length,
                                      (spotsIndex) => FlSpot(24 - testGroundData[index]['strength_history'][spotsIndex]['hours_ago'],
                                          testGroundData[index]['strength_history'][spotsIndex]['strength'])),
                                  isCurved: true,
                                  belowBarData: BarAreaData(
                                    show: true,
                                    colors: [
                                      Colors.white,
                                      Colors.grey,
                                    ].map((color) => color.withOpacity(0.3)).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                          testGroundData[index]['children'].length,
                          (childIndex) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: AutoSizeText(
                                      testGroundData[index]['children'][childIndex]['child'],
                                      maxFontSize: 15,
                                      minFontSize: 5,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: LinearPercentIndicator(
                                    lineHeight: 15,
                                    percent: testGroundData[index]['children'][childIndex]['strength'],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                      child: Text((testGroundData[index]['children'][childIndex]['strength'] * 100).toString().split('.')[0] + "%")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).size.width > 1500 ? 1 : 0,
            child: Container(
              child: GroundOrderOfBattleChartView(),
            ),
          )
        ],
      ),
    );
  }
}
