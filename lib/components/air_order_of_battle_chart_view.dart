import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AirOrderOfBattleChartView extends StatelessWidget {
  const AirOrderOfBattleChartView({
    @required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = (screenSize.width - 100) / 4;

    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        width: widgetWidth,
        height: screenSize.height,
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 30, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(30, 30, 30, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Total Inventory",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "OP",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "LIMOP",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "NONOP",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 50,
                            sections: [
                              PieChartSectionData(
                                value: 25,
                                title: "25%",
                                color: Colors.green,
                                radius: widgetWidth / 2 - 100,
                              ),
                              PieChartSectionData(
                                value: 20,
                                color: Colors.blue,
                                title: "20%",
                                radius: widgetWidth / 2 - 120,
                              ),
                              PieChartSectionData(
                                value: 55,
                                color: Colors.redAccent,
                                title: "55%",
                                radius: widgetWidth / 2 - 140,
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
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(30, 30, 30, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Aircraft Type",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Fighters",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.5,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Bombers",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.8,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Transport",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.5,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Helicopters",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.3,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "UAVs",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.9,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(30, 30, 30, 1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Aircraft Location",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "1st AD",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.7,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "2nd AD",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.3,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "3rd AD",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.5,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "4th AD",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                          LinearPercentIndicator(
                            width: widgetWidth / 1.75,
                            lineHeight: 14.0,
                            percent: 0.1,
                            animateFromLastPercent: true,
                            backgroundColor: Colors.white24,
                            progressColor: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
