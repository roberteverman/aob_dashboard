import 'package:aob_dashboard/helpers/test_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GroundOrderOfBattleChartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, right: 30, left: 20),
      child: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 30, 30, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.width / 6,
                    lineWidth: 20,
                    percent: 0.87,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Strength",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "87%",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    progressColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 30, 30, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "Total Strength (Past 24H)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
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
                                testGroundData[0]['strength_history'].length,
                                (spotsIndex) => FlSpot(24 - testGroundData[0]['strength_history'][spotsIndex]['hours_ago'],
                                    testGroundData[0]['strength_history'][spotsIndex]['strength'])),
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 30, 30, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularPercentIndicator(
                radius: MediaQuery.of(context).size.width / 6,
                lineWidth: 20,
                percent: 0.42,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LRA Strength",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "42%",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                progressColor: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(30, 30, 30, 1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "LRA Strength (Past 24H)",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
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
                                testGroundData[0]['strength_history'].length,
                                (spotsIndex) => FlSpot(24 - testGroundData[1]['strength_history'][spotsIndex]['hours_ago'],
                                    testGroundData[1]['strength_history'][spotsIndex]['strength'])),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
