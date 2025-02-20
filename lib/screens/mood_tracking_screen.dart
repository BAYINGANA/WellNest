// lib/screens/mood_tracking_screen.dart
import 'package:flutter/material.dart';

import '../models/mood.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MoodScreen extends StatefulWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  /// The current rotation angle of the pointer (in degrees).
  double _pointerAngle = 0.0;

  /// Angles for each emoji (in degrees). Adjust as needed.
  final List<double> _moodAnglesDegrees = [-72, -36, 0, 36, 72];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If you have a separate bottom navigation bar, add it here.
      body: SafeArea(
        child: SingleChildScrollView(
          // Makes the screen scrollable if needed
          child: Container(
            // Rounded white background
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            width: double.infinity,
            // Reduced padding to bring content higher
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// TOP ROW: Back Arrow + "HopeHub"
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle back navigation or other action
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back, size: 30),
                    ),
                    const Spacer(),
                    Text(
                      'HopeHub',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bitter',
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 10),

                /// Cursive green text: "It's okay to feel whatever you feel ♡"
                Text(
                  "It's Okay to Feel\nWhatever you Feel ♡",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'DancingScript', // or any cursive font you prefer
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                /// SEMI-CIRCLE GAUGE WITH EMOJIS & POINTER
                // Use a SizedBox to control the gauge size (no Expanded)
                SizedBox(
                  width: 300,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // 1) Semi-circle background
                      CustomPaint(
                        size: const Size(300, 160),
                        painter: _GaugePainter(),
                      ),

                      // 2) Row of emojis (clickable), positioned on the arc
                      Positioned(
                        bottom: 30,
                        child: SizedBox(
                          width: 260,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildEmoji('😢', 0),   // Sad
                              _buildEmoji('😊', 1),   // Happy
                              _buildEmoji('😐', 2),   // Neutral
                              _buildEmoji('😟', 3),   // Worried
                              _buildEmoji('😡', 4),   // Angry
                            ],
                          ),
                        ),
                      ),

                      // 3) Pointer that rotates based on _pointerAngle
                      Positioned(
                        bottom: 0,
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..rotateZ(_pointerAngle * math.pi / 180),
                          child: Container(
                            width: 6,
                            height: 60,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                /// Prompt: "How do you feel today?"
                Text(
                  "How do you feel today?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // If you want a bit more space at the bottom, uncomment:
                // const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds an emoji that sets the pointer angle when tapped.
  Widget _buildEmoji(String emoji, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _pointerAngle = _moodAnglesDegrees[index];
        });
      },
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

/// A simple custom painter for the semi-circle gauge background.
/// Replace this with an image if you have a custom graphic.
class _GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // We'll draw a semi-circle (180 degrees).
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    final startAngle = -math.pi; // -180 degrees
    final sweepAngle = math.pi;  // 180 degrees

    // Create a gradient for the arc (5 color slices).
    paint.shader = const LinearGradient(
      colors: [
        Color(0xFFFF9999), // pinkish
        Color(0xFF98FB98), // pale green
        Color(0xFF87CEFA), // light blue
        Color(0xFFFBD38D), // light orange
        Color(0xFFFF7F7F), // light red
      ],
      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    ).createShader(rect);

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(_GaugePainter oldDelegate) => false;
}
