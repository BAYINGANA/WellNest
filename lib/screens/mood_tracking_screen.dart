// lib/screens/mood_screen.dart
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'journal_screen.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  State<MoodScreen> createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  double _pointerAngle = 0.0;
  final List<double> _moodAnglesDegrees = [-72, -36, 0, 36, 72];

  // Define emojis and corresponding colors.
  final List<String> _emojis = ['😢', '😊', '😐', '😟', '😡'];
  final List<Color> _moodColors = [
    Colors.blue, // Sad
    Colors.green, // Happy
    Colors.grey, // Neutral
    Colors.orange, // Worried
    Colors.red // Angry
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top row: Back arrow + title
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, size: 30),
                    ),
                    const Spacer(),
                    Text(
                      'WellNest',
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
                Text(
                  "It's Okay to Feel\nWhatever you Feel ♡",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'DancingScript',
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 300,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: const Size(300, 160),
                        painter: _GaugePainter(),
                      ),
                      Positioned(
                        bottom: 30,
                        child: SizedBox(
                          width: 260,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(_emojis.length, (index) {
                              return _buildEmoji(index);
                            }),
                          ),
                        ),
                      ),
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
                Text(
                  "How do you feel today?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmoji(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _pointerAngle = _moodAnglesDegrees[index];
        });
        // Get selected mood emoji and its color.
        String selectedMood = _emojis[index];
        Color selectedColor = _moodColors[index];
        // Get current date as "YYYY-MM-DD"
        String currentDate = DateTime.now().toIso8601String().split('T').first;
        // Navigate to JournalScreen with parameters.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JournalScreen(
              mood: selectedMood,
              moodColor: selectedColor,
              date: currentDate,
            ),
          ),
        );
      },
      child: Text(
        _emojis[index],
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);
    final startAngle = -math.pi;
    final sweepAngle = math.pi;
    paint.shader = const LinearGradient(
      colors: [
        Color(0xFFFF9999),
        Color(0xFF98FB98),
        Color(0xFF87CEFA),
        Color(0xFFFBD38D),
        Color(0xFFFF7F7F),
      ],
      stops: [0.0, 0.25, 0.5, 0.75, 1.0],
    ).createShader(rect);
    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(_GaugePainter oldDelegate) => false;
}
