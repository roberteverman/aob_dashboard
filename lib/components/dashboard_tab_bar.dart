import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardTabBar extends StatelessWidget {
  const DashboardTabBar({
    @required this.sideBarWidth,
  });

  final double sideBarWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 30),
      width: sideBarWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.home,
              color: Colors.grey,
            ),
            iconSize: 30,
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.plane),
            iconSize: 50,
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.road,
              color: Colors.grey,
            ),
            iconSize: 30,
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.rocket,
              color: Colors.grey,
            ),
            iconSize: 30,
            onPressed: () {},
          ),
          Expanded(
            child: SizedBox(),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.cogs),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
