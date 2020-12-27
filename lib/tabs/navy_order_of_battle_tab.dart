import 'package:flutter/material.dart';

class NavyOrderOfBattleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
        border: Border.all(color: Colors.black, width: 3),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No naval order of battle to display."),
        ],
      ),
    );
  }
}
