import 'package:aob_dashboard/helpers/data_change_notifier.dart';
import 'package:aob_dashboard/helpers/tab_change_notifier.dart';
import 'package:aob_dashboard/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataChangeNotifier>(create: (context) => DataChangeNotifier()),
        ChangeNotifierProvider<TabChangeNotifier>(create: (context) => TabChangeNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dash.',
        theme: ThemeData.dark(),
        initialRoute: LandingScreen.id,
        routes: {
          LandingScreen.id: (context) => LandingScreen(),
        },
      ),
    );
  }
}
