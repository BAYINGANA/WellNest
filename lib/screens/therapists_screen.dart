import 'package:flutter/material.dart';
import 'package:wellnest/screens/help_screen.dart';
import 'package:wellnest/widgets/navigation_bar.dart';

class TherapistScreen extends StatelessWidget {
  const TherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row with Back Arrow and "WellNest"
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
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black.withValues(alpha: 0.25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // This SizedBox balances the row so the text is centered.
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 40),
                // Available Offline
                const Text(
                  'Available Offline',
                  style: TextStyle(
                    color: Color(0xFF28002C),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 12),
                DoctorCard(
                  name: 'Dr. Devika Rao',
                  specialty:
                      'LGBTQ+ Issues, Self-Esteem, and Peer Relationships',
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/b9e829d0c01ccca2922dca513c8203ee3ef433b6',
                ),
                const SizedBox(height: 18),
                DoctorCard(
                  name: 'Dr. Tanya Khanna',
                  specialty: 'Trauma, Grief, and Identity Issues',
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/984ebdf27ec9d7a304cf2f79bfcd8a60b7db058a',
                ),
                const SizedBox(height: 18),
                DoctorCard(
                  name: 'Dr. Rajesh Iyer',
                  specialty:
                      'Academic Pressure, Stress Management, and Career Counseling',
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/7b96ed8d04e7c11c5eef41e254d701e65c31cd48',
                ),
                const SizedBox(height: 18),
                // Available Online
                const Text(
                  'Available Online',
                  style: TextStyle(
                    color: Color(0xFF28002C),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 12),
                DoctorCard(
                  name: 'Dr. Karan Mehta',
                  specialty:
                      'ADHD, Behavioral Disorders, and Emotional Regulation',
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/068ebb29cec3a6648f55198aa047f7530f368f34',
                ),
                const SizedBox(height: 18),
                DoctorCard(
                  name: 'Dr. Sarah Thompson',
                  specialty:
                      'Social Anxiety, Technology Use, and Parent-Teen Conflicts',
                  imageUrl:
                      'https://cdn.builder.io/api/v1/image/assets/TEMP/169ad8b8dc916c938c006b33e4fd0a83bbd2f7eb',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 2,
      ),
    );
  }
}

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

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Make the container clickable to navigate to HelpScreen.
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HelpScreen(therapistName: name),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA1EEBD),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              // Therapist Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: 78,
                  height: 83,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              // Therapist Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF121417),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      specialty,
                      style: const TextStyle(
                        color: Color(0xFF121417),
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
