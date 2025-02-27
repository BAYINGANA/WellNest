import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:hive_flutter/adapters.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:wellnest/screens/login_screen.dart';
import 'package:wellnest/screens/signup_screen.dart';

import 'screens/home_screen.dart';

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  await Hive.initFlutter();
  await Hive.openBox('responseCache');
  runApp(WellNestApp());
}

class WellNestApp extends StatelessWidget {
  const WellNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WellNest',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
