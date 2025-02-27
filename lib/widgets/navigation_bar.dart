import 'package:flutter/material.dart';
import 'package:wellnest/screens/Discover_screen.dart';
import 'package:wellnest/screens/emotional_journey_screen.dart';
import 'package:wellnest/screens/home_screen.dart';
import 'package:wellnest/screens/support_groups_screen.dart';
import 'package:wellnest/screens/therapists_screen.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigationBar({super.key, required this.selectedIndex});

  void _onBottomNavTap(BuildContext context, int index) {
    Widget nextPage = getPageForIndex(index);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  Widget getPageForIndex(int index) {
    switch (index) {
      case 0:
        return const DiscoverScreen();
      case 1:
        return SupportGroupScreen();
      case 2:
        return const TherapistScreen();
      case 3:
        return const EmotionalJourneyScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onBottomNavTap(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chair),
          label: 'Therapists',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'Journal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Color(0xFF6EF4A4),
      unselectedItemColor: Colors.grey,
    );
  }
}
