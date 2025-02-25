import 'package:flutter/material.dart';
import 'package:wellnest/screens/call_screen.dart';
// Header and Navigation Bar remain in separate files.
import 'package:wellnest/widgets/header.dart';
import 'package:wellnest/widgets/navigation_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If you have a navigation bar, add it here.
      body: SafeArea(
        child: SingleChildScrollView(
          // Vertical scrolling for the entire screen.
          child: Container(
            constraints: const BoxConstraints(maxWidth: 390),
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Header(),
                SizedBox(height: 40),
                ImmediateHelpButton(),
                SizedBox(height: 30),
                CourseSection(),
                SizedBox(height: 30),
                HealthyBodySection(),
                SizedBox(height: 30),
                RecommendationsSection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}

/// Immediate Help Button Section
class ImmediateHelpButton extends StatelessWidget {
  const ImmediateHelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Are you or anybody near you facing any issue',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Bitter',
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF242364),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            minimumSize: const Size(289, 50),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CallScreen(),
              ),
            );
          },
          child: const Text(
            'Need immediate help!',
            style: TextStyle(
              color: Color(0xFF121417),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bitter',
            ),
          ),
        ),
      ],
    );
  }
}

/// Courses Section with horizontally scrollable clickable cards.
class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Courses',
          style: TextStyle(
            color: Color(0xFF242364),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Bitter',
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CourseCard(
                title: 'Prioritize Self Care for a happy you',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/65b88c855ccdfa26233a990b7d1d1e87731015c2843f6c0027c64fbeda44d8ed?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () =>
                    print('Tapped: Prioritize Self Care for a happy you'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Don\'t overthink it, just let it be.',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/84b460495c043b67cdc6a9044d5b251c9e7b4f99f9ff050e1de12a2882519bc9?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () =>
                    print('Tapped: Don\'t overthink it, just let it be.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'It\'s okay to feel what you feel',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/87af24469ee64c1360e4ce5dbf144547fb4f954ac25e75eb000209cc85086227?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () => print('Tapped: It\'s okay to feel what you feel'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Healthy Body Section with clickable cards.
class HealthyBodySection extends StatelessWidget {
  const HealthyBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Healthy Body = Healthy Mind',
          style: TextStyle(
            color: Color(0xFF242364),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Bitter',
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CourseCard(
                title: 'Body positivity is the key',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/b3008e6136e1e44be0266b6292e91770b3b9726d5fa64d89c76591f64a287a76?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () => print('Tapped: Body positivity is the key'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Quiet the mind, and the soul will speak.',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/e74853d91c2c59c502d9d79fd85759470a6167274ae6a0c08d96f4df9ce3be86?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () =>
                    print('Tapped: Quiet the mind, and the soul will speak.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Music soothes the soul and calms the mind.',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/4d0bbd47c8dd90b81bc61c6eb6dc8e613b78c5915a507e0ebf0a1e70d0b218b5?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () =>
                    print('Tapped: Music soothes the soul and calms the mind.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Recommendations Section with clickable cards.
class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recommendations for you',
          style: TextStyle(
            color: Color(0xFF242364),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Bitter',
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CourseCard(
                title: 'Good movies transport you to a better world.',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/c8ee085bad5fb0829d3a36f5c488a07ce6806cae22d1bb1f62ca0efb64950800?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () => print(
                    'Tapped: Good movies transport you to a better world.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Some light-hearted Comedy',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/07032e9a8dab5723324f027efbbab10369314926c20dac9687625e7548f7b15d?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () => print('Tapped: Some light-hearted Comedy'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Books are a journey for the mind.',
                imageUrl:
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/f196b78623217827aadee8a12b32ee4bb9f10ee9652560f07811fe4677d88491?apiKey=f19143deba86463b9da27db7e011b3a1&',
                onTap: () => print('Tapped: Books are a journey for the mind.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A generic clickable Course Card widget matching the HopeHub option card style.
class CourseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 306,
        height: 168,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background image with rounded corners
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                ),
              ),
            ),
            // Text overlay in the upper left corner
            Positioned(
              left: 20,
              top: 20,
              child: SizedBox(
                width: 160,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF121417),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Bitter',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
