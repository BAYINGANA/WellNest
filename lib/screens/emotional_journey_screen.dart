import 'package:flutter/material.dart';

class EmotionalJourneyScreen extends StatelessWidget {
  const EmotionalJourneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If you have a separate bottom navigation bar, you can add it here:
      // bottomNavigationBar: CustomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          // Makes the whole screen vertically scrollable
          child: Padding(
            // A little padding around the screen
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                /// TOP ROW: Back Arrow + "HopeHub" Title
                Row(
                  children: [
                    // Back arrow (clickable)
                    InkWell(
                      onTap: () {
                        // Handle back navigation or any action
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    // "HopeHub" in purple
                    Text(
                      'WellNest',
                      style: TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade700,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),

                const SizedBox(height: 25),

                /// EMOTION INDICATORS (Two Rows)
                // First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildEmotionIndicator(
                      emotion: 'Happy',
                      color: Colors.green,
                      onTap: () => debugPrint('Happy tapped'),
                    ),
                    _buildEmotionIndicator(
                      emotion: 'Angry',
                      color: Colors.red,
                      onTap: () => debugPrint('Angry tapped'),
                    ),
                    _buildEmotionIndicator(
                      emotion: 'Neutral',
                      color: Colors.grey,
                      onTap: () => debugPrint('Neutral tapped'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildEmotionIndicator(
                      emotion: 'Sad',
                      color: Colors.blue,
                      onTap: () => debugPrint('Sad tapped'),
                    ),
                    _buildEmotionIndicator(
                      emotion: 'Anxious',
                      color: Colors.orange,
                      onTap: () => debugPrint('Anxious tapped'),
                    ),
                    _buildEmotionIndicator(
                      emotion: 'No Journal',
                      color: Colors.purple.shade300,
                      onTap: () => debugPrint('No Journal tapped'),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// "Your Emotional Journey"
                const Text(
                  'Your Emotional Journey',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                /// CALENDAR (Greenish Background)
                const _CalendarWidget(),

                const SizedBox(height: 30),

                /// "Your Recent Journals"
                const Text(
                  'Your Recent Journals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),

                // JOURNAL ENTRIES (Clickable)
                JournalEntryWidget(
                  date: '17 Aug',
                  dateColor: Colors.purple.shade300,
                  title: 'Dear Me,',
                  content: 'I feel a lot better today...',
                  onTap: () => debugPrint('Tapped journal entry: 17 Aug'),
                ),
                const SizedBox(height: 14),
                JournalEntryWidget(
                  date: '16 Aug',
                  dateColor: Colors.green.shade300,
                  title: 'Dear Me,',
                  content: 'I feel so annoyed by myself...',
                  onTap: () => debugPrint('Tapped journal entry: 16 Aug'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// A helper widget for clickable emotion indicators with a colored circle.
  Widget _buildEmotionIndicator({
    required String emotion,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: Colors.black),
            ),
          ),
          const SizedBox(width: 6),
          Text(emotion, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

/// A simplified greenish calendar widget with clickable days.
class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      // Slightly rounded corners + drop shadow
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFA5DBB2),
            const Color(0xFF7BCF8D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          /// MONTH & NAVIGATION ARROWS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => debugPrint('Previous month'),
                child: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Text(
                'August',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => debugPrint('Next month'),
                child: const Icon(Icons.chevron_right, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// WEEKDAYS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                .map((day) => Text(
              day,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ))
                .toList(),
          ),
          const SizedBox(height: 16),

          /// DAYS GRID
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
    // For simplicity, we’ll assume August has 31 days
    final List<Widget> rows = [];
    int currentDay = 1;

    while (currentDay <= 31) {
      final List<Widget> week = [];
      for (int i = 0; i < 7 && currentDay <= 31; i++) {
        week.add(
          InkWell(
            onTap: () => debugPrint('Tapped day $currentDay'),
            child: Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              alignment: Alignment.center,
              child: Text(
                '$currentDay',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
        currentDay++;
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: week,
        ),
      );
    }

    return Column(
      children: rows
          .map((weekRow) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: weekRow,
      ))
          .toList(),
    );
  }
}

/// A clickable journal entry with a colored date box.
class JournalEntryWidget extends StatelessWidget {
  final String date;
  final Color dateColor;
  final String title;
  final String content;
  final VoidCallback onTap;

  const JournalEntryWidget({
    Key? key,
    required this.date,
    required this.dateColor,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // White card with a drop shadow
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Colored date box
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: dateColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                date,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Bitter',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Journal title + content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Bitter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(
                      fontFamily: 'Bitter',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
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
