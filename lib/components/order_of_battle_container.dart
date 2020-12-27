import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class OrderOfBattleContainer extends StatelessWidget {
  OrderOfBattleContainer({this.airfield, this.aircraft, this.status});
  final String airfield;
  final String status;
  final List<dynamic> aircraft;

  @override
  Widget build(BuildContext context) {
    //Form values
    int formSelectionIndex = 0;
    String dropdownValue = Provider.of<DataChangeNotifier>(context, listen: false).airfieldList[0];
    bool formProcessing = false;

    //Other
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
                    List<String> selections = ['Add', 'Move', 'Destroy'];
                    dropdownValue = airfield;
                    formProcessing = false;

                    return await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => new StatefulBuilder(builder: (_, setState) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              airfield + " " + aircraft[index]['type'] + 's',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          content: FittedBox(
                            child: Container(
                              width: 300,
                              child: formProcessing
                                  ? LoadingBouncingLine.circle()
                                  : Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: List<Widget>.generate(3, (int index) {
                                            return ChoiceChip(
                                              selectedColor: Colors.white,
                                              label: Text(selections[index]),
                                              selected: formSelectionIndex == index,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  formSelectionIndex = selected ? index : null;
                                                });
                                              },
                                            );
                                          }),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("Number to " + selections[formSelectionIndex].toLowerCase() + ":"),
                                                Expanded(
                                                  child: Container(),
                                                ),
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
                                            formSelectionIndex == 1
                                                ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                                    Text("Move to:"),
                                                    DropdownButton<String>(
                                                      value: dropdownValue,
                                                      onChanged: (String newValue) {
                                                        setState(() {
                                                          dropdownValue = newValue;
                                                        });
                                                      },
                                                      items: Provider.of<DataChangeNotifier>(context, listen: false)
                                                          .airfieldList
                                                          .map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ])
                                                : Container()
                                          ],
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  formProcessing = true;
                                });
                                await Provider.of<DataChangeNotifier>(context, listen: false)
                                    .pushAirData(formSelectionIndex, selectedNumber, airfield, dropdownValue);
                                formProcessing = false;
                                Navigator.pop(context);
                              },
                              child: Text("Submit"),
                            )
                          ],
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
