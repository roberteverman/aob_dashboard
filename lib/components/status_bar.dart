import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  StatusBar({this.percentage, this.height, this.width, this.color: Colors.white});
  final double percentage;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width * percentage,
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
            // borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white, width: height / 10),
          ),
        ),
      ],
    );
  }
}
