import 'dart:convert';

import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:aob_dashboard/helpers/military_fonts_icons.dart';
import 'package:aob_dashboard/helpers/tab_change_notifier.dart';
import 'package:aob_dashboard/models/airfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 0,
            iconData: MilitaryFonts.fighter2,
            buttonText: "Air Order of Battle",
            sizeMultiplier: 2,
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 1,
            iconData: MilitaryFonts.tank,
            buttonText: "Ground Order of Battle",
            sizeMultiplier: 1.75,
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 2,
            iconData: MilitaryFonts.warship,
            buttonText: "Navy Order of Battle",
            sizeMultiplier: 2,
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 3,
            iconData: MilitaryFonts.missile,
            buttonText: "Missile Order of Battle",
            sizeMultiplier: 1.5,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SizedBox(),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.cogs),
            iconSize: 30,
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  const TabBarButton({this.iconData, this.buttonText, this.buttonIndex, this.sizeMultiplier});

  final int buttonIndex;
  final IconData iconData;
  final String buttonText;
  final double sizeMultiplier;

  @override
  Widget build(BuildContext context) {
    bool selected = Provider.of<TabChangeNotifier>(context, listen: true).tabState[buttonIndex];

    return Column(
      children: [
        IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          tooltip: buttonText,
          icon: Icon(
            iconData,
            color: selected ? Colors.white : Colors.grey,
          ),
          iconSize: selected ? 50 * sizeMultiplier : 30 * sizeMultiplier,
          onPressed: () async {
            await Provider.of<TabChangeNotifier>(context, listen: false).changeTab(buttonIndex);
          },
        ),
      ],
    );
  }
}
