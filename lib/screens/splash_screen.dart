import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:aob_dashboard/helpers/military_fonts_icons.dart';
import 'package:aob_dashboard/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<DataChangeNotifier>(context, listen: false).updateAirData();
    super.initState();
  }

  Future<void> navigateToLandingScreen() async {
    await Navigator.pushNamed(context, LandingScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
            child: TypewriterAnimatedTextKit(
              text: ["  Dash."],
              textStyle: TextStyle(fontSize: 100.0, color: Colors.white),
              speed: Duration(milliseconds: 300),
              // pause: Duration(seconds: 5),
              repeatForever: false,
              isRepeatingAnimation: false,
              onTap: () async {
                await navigateToLandingScreen();
              },
              onFinished: () async {
                await navigateToLandingScreen();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                MilitaryFonts.fighter2,
                size: 80,
              ),
              Icon(
                MilitaryFonts.tank,
                size: 80,
              ),
              Icon(
                MilitaryFonts.warship,
                size: 80,
              ),
              Icon(
                MilitaryFonts.missile,
                size: 80,
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                    onPressed: () async {
                      await navigateToLandingScreen();
                    },
                    child: Text(
                      "Skip...",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
