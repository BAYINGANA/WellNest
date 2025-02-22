import 'package:flutter/material.dart';
import 'package:wellnest/screens/discover_screen.dart';
import 'package:wellnest/screens/support_groups_screen.dart';
import 'package:wellnest/screens/therapists_screen.dart';

import 'chat_screen.dart';
import 'journal_screen.dart';
import 'meditation_screen.dart';
import 'mood_tracking_screen.dart';
import 'package:wellnest/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            constraints: const BoxConstraints(maxWidth: 480),
            width: double.infinity,
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header remains in a separate file
                const Header(),
                const SizedBox(height: 22),
                Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/76313044ac96923fa4a23d011fdbe673e789790c4a34405725bad9363dc83282?apiKey=f19143deba86463b9da27db7e011b3a1&',
                  width: 162,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 11),
                const Text(
                  'Heyy !!!\nTake whatever you need',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 26),
                OptionCard(
                  title: 'Discover',
                  imagePath:
                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/a1fc1801824e8ec4cec0a15a11bf22584389be56f0f3a1e9b7402642c71563f1?apiKey=f19143deba86463b9da27db7e011b3a1&',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiscoverScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                OptionCard(
                  title: 'Support\nGroups',
                  imagePath:
                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/52ad86e8fba29eb93e78221eb33ccad180a263bbe1b808b832917fa9c1f9a4a5?apiKey=f19143deba86463b9da27db7e011b3a1&',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportGroupsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                OptionCard(
                  title: 'Therapists',
                  imagePath:
                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/3381a64f53a1475ab69b3384f57a521979c02912771bf8730ae8d65e1156568d?apiKey=f19143deba86463b9da27db7e011b3a1&',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TherapistScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                OptionCard(
                  title: 'Your Journal',
                  imagePath:
                  'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/63268f6b20058007f806c475c4f3d936861126a667e4e7c36d00c385846a6167?apiKey=f19143deba86463b9da27db7e011b3a1&',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JournalScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 21),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// The OptionCard widget is defined right here in the same file.
class OptionCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Image.network(
              imagePath,
              fit: BoxFit.contain,
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
