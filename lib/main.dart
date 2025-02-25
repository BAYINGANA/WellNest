import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  runApp(WellNestApp());
  await Hive.initFlutter();
  await Hive.openBox('responseCache');
}

class WellNestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellNest',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
