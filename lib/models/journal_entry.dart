// lib/models/journal_entry.dart
class JournalEntry {
  final int? id;
  final String date; // Stored as "YYYY-MM-DD"
  final String mood; // e.g. "😊"
  final int moodColor; // Stored as an ARGB integer
  final String content;

  JournalEntry({
    this.id,
    required this.date,
    required this.mood,
    required this.moodColor,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'mood': mood,
      'mood_color': moodColor,
      'content': content,
    };
  }

  factory JournalEntry.fromMap(Map<String, dynamic> map) {
    return JournalEntry(
      id: map['id'],
      date: map['date'],
      mood: map['mood'],
      moodColor: map['mood_color'],
      content: map['content'],
    );
  }
}
