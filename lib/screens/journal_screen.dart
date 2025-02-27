// lib/screens/journal_screen.dart
import 'package:flutter/material.dart';
import 'package:wellnest/screens/emotional_journey_screen.dart';

import '../models/journal_entry.dart';
import '../services/database_service.dart';

class JournalScreen extends StatefulWidget {
  final String mood;
  final Color moodColor;
  final String date; // Format: "YYYY-MM-DD"

  const JournalScreen({
    Key? key,
    required this.mood,
    required this.moodColor,
    required this.date,
  }) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _noteController = TextEditingController();
  final DatabaseService dbService = DatabaseService();

  Future<void> _saveEntry() async {
    String content = _noteController.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter some text')),
      );
      return;
    }

    try {
      JournalEntry entry = JournalEntry(
        date: widget.date,
        mood: widget.mood,
        moodColor: widget.moodColor.value,
        content: content,
      );
      debugPrint('Saving entry: ${entry.toMap()}');
      await dbService.insertJournalEntry(entry);
      debugPrint('Entry saved successfully');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EmotionalJourneyScreen(),
        ),
      );
    } catch (e) {
      debugPrint('Error saving entry: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save entry: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Journal"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: widget.moodColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Show the date (formatted) and mood
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: widget.moodColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _formatDate(widget.date),
                      style: const TextStyle(
                        fontFamily: 'Bitter',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Mood: ${widget.mood}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bitter',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  controller: _noteController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: "Write your thoughts here...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveEntry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.moodColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Save Entry",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
