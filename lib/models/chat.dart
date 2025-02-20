// lib/models/chat.dart
class Chat {
  final int id;
  final String username;
  final String message;
  final String createdAt;

  Chat(
      {required this.id,
      required this.username,
      required this.message,
      required this.createdAt});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      username: json['username'],
      message: json['message'],
      createdAt: json['created_at'].toString(),
    );
  }
}
