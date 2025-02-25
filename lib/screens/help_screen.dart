import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellnest/screens/chat_screen.dart'; // Import the new ChatScreen

class HelpScreen extends StatelessWidget {
  final String therapistName;

  const HelpScreen({Key? key, required this.therapistName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea for devices with notches
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            constraints: const BoxConstraints(maxWidth: 480),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back arrow row
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 29, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      BackArrow(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Main image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.network(
                    'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/2687525fbf59c3b7416b5cf833665d81e18a6b08948d6d36299e3336ae58bcab?apiKey=f19143deba86463b9da27db7e011b3a1&',
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                // Main prompt text
                const Text(
                  'Would you like to talk to someone from our team?',
                  style: TextStyle(
                    color: Color(0xFF010101),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Figma Hand',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                // Subtext
                SizedBox(
                  width: 270,
                  child: const Text(
                    'first 5 minutes is free for you after that it would be charged accordingly',
                    style: TextStyle(
                      color: Color(0xFF010101),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 33),
                // Call Button
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Call button pressed');
                    // TODO: Implement call functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6EF4A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: const Size(247, 50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.network(
                        'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/f33d2beaf16d1d025d9f6d5972c94db7ec0107e892ad13c912eebb775d7a5dbd?apiKey=f19143deba86463b9da27db7e011b3a1&',
                        width: 27,
                        height: 30,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'call',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Bitter',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                // Text Button
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Text button pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChatScreen(therapistName: therapistName),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6EF4A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    minimumSize: const Size(247, 50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.network(
                        'https://cdn.builder.io/api/v1/image/assets/f19143deba86463b9da27db7e011b3a1/34b6fab92d50ae70cf4059e0e0e4267e441140139f8f3592481f1ac92b25ab53?apiKey=f19143deba86463b9da27db7e011b3a1&',
                        width: 17,
                        height: 15,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'text',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Bitter',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 160),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Standard Back Arrow Widget remains unchanged
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
