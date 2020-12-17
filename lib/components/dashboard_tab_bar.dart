import 'package:aob_dashboard/helpers/dash_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            iconData: FontAwesomeIcons.plane,
            buttonText: "Air",
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 1,
            iconData: FontAwesomeIcons.running,
            buttonText: "Ground",
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 2,
            iconData: FontAwesomeIcons.ship,
            buttonText: "Navy",
          ),
          SizedBox(
            height: 30,
          ),
          TabBarButton(
            buttonIndex: 3,
            iconData: FontAwesomeIcons.rocket,
            buttonText: "TBM",
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  const TabBarButton({this.iconData, this.buttonText, this.buttonIndex});

  final int buttonIndex;
  final IconData iconData;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    bool selected = Provider.of<DashChangeNotifier>(context, listen: true).tabState[buttonIndex];

    return Column(
      children: [
        IconButton(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.zero,
          tooltip: buttonText,
          icon: Icon(
            iconData,
            color: selected ? Colors.white : Colors.grey,
          ),
          iconSize: selected ? 50 : 30,
          onPressed: () {
            Provider.of<DashChangeNotifier>(context, listen: false).changeTab(buttonIndex);
          },
        ),
        // Text(
        //   buttonText,
        //   style: TextStyle(
        //     color: selected ? Colors.white : Colors.grey,
        //     // fontSize: selected ? 0 : 13,
        //   ),
        // ),
      ],
    );
  }
}
