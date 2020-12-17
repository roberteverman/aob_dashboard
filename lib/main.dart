import 'package:aob_dashboard/helpers/dash_change_notifier.dart';
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
      providers: [ChangeNotifierProvider<DashChangeNotifier>(create: (context) => DashChangeNotifier())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AOB Dashboard',
        theme: ThemeData.dark(),
        initialRoute: LandingScreen.id,
        routes: {
          LandingScreen.id: (context) => LandingScreen(),
        },
      ),
    );
  }
}
