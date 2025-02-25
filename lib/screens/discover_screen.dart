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
            backgroundColor: const Color(0xFF242364),
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
                  builder: (context) => const CallScreen()),
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
                'https://cdn.builder.io/api/v1/image/assets/TEMP/d757d6bd231148501c8a54b2f96fefc6b64887b1',
                onTap: () => print('Tapped: Prioritize Self Care for a happy you'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Don\'t overthink it, just let it be.',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f',
                onTap: () => print('Tapped: Don\'t overthink it, just let it be.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'It\'s okay to feel what you feel',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f',
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
                'https://cdn.builder.io/api/v1/image/assets/TEMP/4c88a4bfb6ebf57e3bf1aceda7c05e9add570765',
                onTap: () => print('Tapped: Body positivity is the key'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Quiet the mind, and the soul will speak.',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f',
                onTap: () => print('Tapped: Quiet the mind, and the soul will speak.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Music soothes the soul and calms the mind.',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/ad33659c33381eac40061641b81f19d65a13ad9f',
                onTap: () => print('Tapped: Music soothes the soul and calms the mind.'),
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
                'https://cdn.builder.io/api/v1/image/assets/TEMP/ac08e6515745dae7f2b5c6af9e607175773b6850',
                onTap: () =>
                    print('Tapped: Good movies transport you to a better world.'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Some light-hearted Comedy',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/89d0438e32f8a8d4984336bf7a666109ecfa7dda',
                onTap: () => print('Tapped: Some light-hearted Comedy'),
              ),
              const SizedBox(width: 20),
              CourseCard(
                title: 'Books are a journey for the mind.',
                imageUrl:
                'https://cdn.builder.io/api/v1/image/assets/TEMP/89d0438e32f8a8d4984336bf7a666109ecfa7dda',
                onTap: () => print('Tapped: Books are a journey for the mind.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A generic clickable Course Card widget.
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
              color: Colors.black.withValues(),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
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
