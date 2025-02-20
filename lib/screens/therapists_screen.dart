import 'package:flutter/material.dart';

class TherapistScreen extends StatelessWidget {
  const TherapistScreen({Key? key}) : super(key: key);

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
                // Top Row with Back Arrow and "HopeHub"
                Row(
                  children: [
                    const BackArrow(),
                    Expanded(
                      child: Center(
                        child: Text(
                          'HopeHub',
                          style: TextStyle(
                            color: const Color(0xFF242364),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bitter',
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
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

                const DoctorCard(
                  name: 'Dr. Devika Rao',
                  specialty:
                  'LGBTQ+ Issues, Self-Esteem, and Peer Relationships',
                  imageUrl:
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/b9e829d0c01ccca2922dca513c8203ee3ef433b6',
                ),
                const SizedBox(height: 18),

                const DoctorCard(
                  name: 'Dr. Tanya Khanna',
                  specialty: 'Trauma, Grief, and Identity Issues',
                  imageUrl:
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/984ebdf27ec9d7a304cf2f79bfcd8a60b7db058a',
                ),
                const SizedBox(height: 18),

                const DoctorCard(
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

                const DoctorCard(
                  name: 'Dr. Karan Mehta',
                  specialty:
                  'ADHD, Behavioral Disorders, and Emotional Regulation',
                  imageUrl:
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/068ebb29cec3a6648f55198aa047f7530f368f34',
                ),
                const SizedBox(height: 18),

                const DoctorCard(
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
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

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
    Key? key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the container in an InkWell or GestureDetector so it's clickable.
    return InkWell(
      onTap: () {
        // TODO: Handle onTap (navigate, show details, etc.)
        debugPrint('Tapped on $name');
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA1EEBD),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              // Doctor Image
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

              // Doctor Info
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
