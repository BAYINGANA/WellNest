// lib/models/journal.dart
class Journal {
  final int id;
  final String title;
  final String content;
  final String createdAt;

  Journal(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt});

  factory Journal.fromJson(Map<String, dynamic> json) {
    return Journal(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createdAt: json['created_at'].toString(),
    );
  }
}
