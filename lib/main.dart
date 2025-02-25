// lib/main.dart
import 'package:flutter/material.dart';
import 'package:wellnest/screens/emotional_journey_screen.dart';
import 'package:wellnest/screens/Discover_screen.dart';
import 'package:wellnest/screens/help_screen.dart';
import 'package:wellnest/screens/journal_screen.dart';
import 'package:wellnest/screens/mood_tracking_screen.dart';
import 'package:wellnest/screens/support_groups_screen.dart';
import 'package:wellnest/screens/therapists_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(WellNestApp());
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
      home: DiscoverScreen(),
    );
  }
}
