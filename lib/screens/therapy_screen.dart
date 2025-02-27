import 'package:flutter/material.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BACK BUTTON + TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'WellNest',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bitter',
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// QUESTION TEXT
            const Center(
              child: Text(
                'What kind of help\ndo you need?',
                style: TextStyle(
                  color: Color(0xFF6EF4A4), // Light green text
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bitter',
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 25),

            /// HELP CARDS LIST
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    HelpCategoryCard(
                      image:
                          'https://br.freepik.com/vetores-premium/ilustracao-de-estilo-simples-de-critica-na-internet_27770461.htm#fromView=search&page=1&position=33&uuid=31a4dcce-e60f-4d27-82a0-ad928cfdac18&query=P%C3%A1gina+3+_+Vetores+e+ilustra%C3%A7%C3%B5es+de+Cyber+bullying+para+download+gratuito+',
                      title: 'Teen Therapy',
                      description:
                          'Safe Spaces for Teens,\nStrong Minds for Life.',
                      onTap: () => print('Teen Therapy clicked'),
                    ),
                    HelpCategoryCard(
                      image: 'assets/images/therapy.png',
                      title: 'Therapy',
                      description: 'Your Safe Space for\nHealing and Growth.',
                      onTap: () => print('Therapy clicked'),
                    ),
                    HelpCategoryCard(
                      image: 'assets/images/couple_therapy.png',
                      title: 'Couple Therapy',
                      description:
                          'Strengthening Bonds,\nEmbracing Growth Together.',
                      onTap: () => print('Couple Therapy clicked'),
                    ),
                  ],
                ),
              ),
            ),

            /// BOTTOM NAVIGATION
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home, size: 30, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite,
                        size: 30, color: Colors.grey),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.person, size: 30, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// HELP CATEGORY CARD WIDGET
class HelpCategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback onTap;

  const HelpCategoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE6F3FF), // Light blue background
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            /// TITLE
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF121417),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Bitter',
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 5),

            /// DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF121417),
                  fontSize: 12,
                  fontFamily: 'Inter',
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
