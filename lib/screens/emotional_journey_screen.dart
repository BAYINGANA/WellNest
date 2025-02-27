import 'package:flutter/material.dart';
import 'package:wellnest/models/journal_entry.dart';
import 'package:wellnest/services/database_service.dart';
import 'package:wellnest/screens/mood_tracking_screen.dart';
import 'package:wellnest/widgets/navigation_bar.dart'; // Import the custom navigation bar

class EmotionalJourneyScreen extends StatefulWidget {
  const EmotionalJourneyScreen({super.key});

  @override
  _EmotionalJourneyScreenState createState() => _EmotionalJourneyScreenState();
}

class _EmotionalJourneyScreenState extends State<EmotionalJourneyScreen> {
  final DatabaseService dbService = DatabaseService();

  Future<List<JournalEntry>> _fetchJournalEntries() async {
    return await dbService.getJournalEntries();
  }

  // Refresh the list after returning from JournalScreen.
  void _refreshEntries() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Replace the AppBar with the custom header
      appBar: AppBar(
        backgroundColor: Colors.white, // Match the background color
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Back arrow
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
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
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
          ),
        ),
        actions: const [
          SizedBox(width: 48), // Spacer to balance the row
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                // Emotion indicators (static examples)
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
                const Text(
                  'Your Emotional Journey',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                // Simplified Calendar widget
                const _CalendarWidget(),
                const SizedBox(height: 30),
                const Text(
                  'Your Recent Journals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                FutureBuilder<List<JournalEntry>>(
                  future: _fetchJournalEntries(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Error loading entries');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No journal entries yet.');
                    } else {
                      return Column(
                        children: snapshot.data!
                            .map((entry) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: JournalEntryWidget(
                            date: _formatDate(entry.date),
                            dateColor: Color(entry.moodColor),
                            title: 'Dear Me,',
                            content: entry.content,
                            onTap: () => debugPrint(
                                'Tapped entry: ${entry.date}'),
                          ),
                        ))
                            .toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // Add the CustomBottomNavigationBar
      bottomNavigationBar: const CustomBottomNavigationBar(
        selectedIndex: 3, // Set the selected index for this screen
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to MoodScreen, then refresh entries when returning.
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MoodScreen()),
          );
          _refreshEntries();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

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

  // Helper to format date strings (assumes "YYYY-MM-DD")
  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return "${date.day} ${_monthAbbreviation(date.month)}";
    } catch (e) {
      return dateStr;
    }
  }

  String _monthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

/// A simplified calendar widget.
class _CalendarWidget extends StatelessWidget {
  const _CalendarWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA5DBB2),
            Color(0xFF7BCF8D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Month header with navigation arrows
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
          // Weekdays row
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
          _buildCalendarDays(),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
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
                color: Colors.white.withValues(alpha: 0.3),
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

/// A widget to display individual journal entries.
class JournalEntryWidget extends StatelessWidget {
  final String date;
  final Color dateColor;
  final String title;
  final String content;
  final VoidCallback onTap;

  const JournalEntryWidget({
    super.key,
    required this.date,
    required this.dateColor,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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