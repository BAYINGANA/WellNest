// lib/models/mood.dart
class Mood {
  final int id;
  final String mood;
  final String? note;
  final String createdAt;

  Mood(
      {required this.id,
      required this.mood,
      this.note,
      required this.createdAt});

  factory Mood.fromJson(Map<String, dynamic> json) {
    return Mood(
      id: json['id'],
      mood: json['mood'],
      note: json['note'],
      createdAt: json['created_at'].toString(),
    );
  }
}
