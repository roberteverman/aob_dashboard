import 'package:aob_dashboard/components/status_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class OrderOfBattleContainer extends StatelessWidget {
  OrderOfBattleContainer({this.airfield, this.aircraft, this.status});
  final String airfield;
  final String status;
  final List<Map> aircraft;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (status == "OP") {
      statusColor = Colors.green;
    } else if (status == "LIMOP") {
      statusColor = Colors.yellow;
    } else if (status == "NONOP") {
      statusColor = Colors.red;
    }

    return Container(
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
              airfield + " Airbase",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[50],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Status:     "),
                Text(
                  status,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                )
              ],
            ),
            DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columnSpacing: 30,
              showBottomBorder: true,
              showCheckboxColumn: false,
              columns: [
                DataColumn(
                  label: Text(
                    'Type',
                  ),
                ),
                DataColumn(
                  label: Text(
                    '',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Total',
                  ),
                ),
              ],
              rows: List.generate(
                aircraft.length,
                (index) => DataRow(
                  onSelectChanged: (selected) async {
                    int selectedNumber = 1;

                    return await showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (_) => new StatefulBuilder(builder: (_, setState) {
                        return AlertDialog(
                          title: Column(
                            children: [
                              Text("Make changes to:"),
                              Text(
                                airfield + "-based " + aircraft[index]['type'] + 's',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          content: FittedBox(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      splashRadius: 20,
                                      icon: Icon(
                                        FontAwesomeIcons.minusCircle,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (selectedNumber > 1) {
                                            selectedNumber--;
                                          }
                                        });
                                      },
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      selectedNumber.toString(),
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    SizedBox(width: 20),
                                    IconButton(
                                      splashRadius: 20,
                                      icon: Icon(FontAwesomeIcons.plusCircle),
                                      onPressed: () {
                                        setState(() {
                                          if (selectedNumber < int.parse(aircraft[index]['total'].toString())) {
                                            selectedNumber++;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    MaterialButton(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.green,
                                      onPressed: () {},
                                    ),
                                    SizedBox(width: 20),
                                    MaterialButton(
                                      child: Text(
                                        "Move",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.blue,
                                      onPressed: () {},
                                    ),
                                    SizedBox(width: 20),
                                    MaterialButton(
                                      child: Text(
                                        "Destroy",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      color: Colors.red,
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                  cells: [
                    DataCell(Text(
                      aircraft[index]['type'],
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    )),
                    DataCell(
                      LinearPercentIndicator(
                        width: 50,
                        lineHeight: 10.0,
                        percent: aircraft[index]['operational'] / aircraft[index]['total'],
                        animateFromLastPercent: true,
                        backgroundColor: Colors.white24,
                        progressColor: Colors.white,
                      ),
                    ),
                    DataCell(Text(
                      aircraft[index]['operational'].toString() + ' / ' + aircraft[index]['total'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
