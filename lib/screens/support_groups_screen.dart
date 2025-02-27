import 'package:flutter/material.dart';
import 'package:wellnest/screens/group_chat_screen.dart';
import 'package:wellnest/widgets/navigation_bar.dart';

class SupportGroupScreen extends StatelessWidget {
  final List<String> groups = [
    "General Mental Health Support",
    "Mindfulness & Meditation",
    "Youth Mental Health",
    "Postpartum Support",
    "Grief & Loss Support",
    "LGBTQ+ Mental Health Community",
    "Single Parents Mental Health Support",
    "Substance Abuse Recovery Support",
  ];

  SupportGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea to ensure we avoid system UI intrusions
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // White background with a large rounded top edge
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            constraints: const BoxConstraints(maxWidth: 480),
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 29),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Top Row: Back Arrow + "WellNest" (centered)
                Row(
                  children: [
                    const BackArrow(),
                    Expanded(
                      child: Center(
                        child: Text(
                          'WellNest',
                          style: TextStyle(
                            color: const Color(0xFF242364),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bitter',
                            shadows: [
                              Shadow(
                                offset: Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Spacer to balance the row
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 41),
                // Tagline
                const Tagline(),
                const SizedBox(height: 62),
                // Support Group Grid (no search bar)
                SupportGroupGrid(groups: groups),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 1,
      ),
    );
  }
}

// Back Arrow Widget
class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

// Tagline Widget
class Tagline extends StatelessWidget {
  const Tagline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Connect with people who understand you !',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Figma Hand',
        color: Color(0xFF010101),
      ),
      textAlign: TextAlign.center,
    );
  }
}

// Grid of Support Groups
class SupportGroupGrid extends StatelessWidget {
  final List<String> groups;

  const SupportGroupGrid({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First Row of Groups
        Row(
          children: [
            Expanded(
              child: SupportGroupItem(
                groupName: groups[0],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/ba29dde75073a63759a967cf90b16c115c108782664ade575abc64ba97f81105?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
            const SizedBox(width: 23),
            Expanded(
              child: SupportGroupItem(
                groupName: groups[1],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/449fff6b765dad811e80ea77fcf90d8227b0bb3d28a00e69de385a4cbdb27167?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
          ],
        ),
        const SizedBox(height: 39),
        // Second Row of Groups
        Row(
          children: [
            Expanded(
              child: SupportGroupItem(
                groupName: groups[2],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/bdd8848327caa0e063702b9f4be1140fd8015cc61dd2504ad2690e9b1bfabf3a?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
            const SizedBox(width: 23),
            Expanded(
              child: SupportGroupItem(
                groupName: groups[3],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/9cc0b1376bbea731ed2a90ee464ebf1969653fe4f61e8927a113a174670591cb?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
          ],
        ),
        const SizedBox(height: 39),
        // Third Row of Groups
        Row(
          children: [
            Expanded(
              child: SupportGroupItem(
                groupName: groups[4],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/0c20a169e06bec20f9665dabf35925780bfb1900e3759b7dffb4d3d3fda40b69?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
            const SizedBox(width: 23),
            Expanded(
              child: SupportGroupItem(
                groupName: groups[5],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/9802c0a265ea461946b1f2c4da163181ab49979ea254b6c9a6aaf3ede8b83962?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
          ],
        ),
        const SizedBox(height: 39),
        // Fourth Row of Groups
        Row(
          children: [
            Expanded(
              child: SupportGroupItem(
                groupName: groups[6],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/2cc4aa0d1d0252b677de485cebc5bd164f88775b4760af3128ddd7156ed8b6c7?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
            const SizedBox(width: 23),
            Expanded(
              child: SupportGroupItem(
                groupName: groups[7],
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/de49af0a42847fc26bb60544e6e66d47748eb66f173f0ddbe7dddfa0d7f8003b?apiKey=f19143deba86463b9da27db7e011b3a1&',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Each Support Group item
class SupportGroupItem extends StatelessWidget {
  final String imageUrl;
  final String groupName;

  const SupportGroupItem({
    super.key,
    required this.imageUrl,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    // Make the entire container clickable
    return InkWell(
      onTap: () {
        // Navigate to the realtime group chat screen for the selected group.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupChatScreen(groupName: groupName),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA1EEBD), // Matches the greenish background
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 6),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: 72,
              height: 75,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                groupName,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Bitter',
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}