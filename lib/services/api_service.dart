// lib/services/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/chat.dart';
import '../models/journal.dart';
import '../models/mood.dart';
import '../utils/constants.dart';

class ApiService {
  // Moods API
  static Future<List<Mood>> getMoods() async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/moods'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Mood> moods = body.map((e) => Mood.fromJson(e)).toList();
      return moods;
    } else {
      throw Exception("Failed to load moods");
    }
  }

  static Future<Mood> createMood(String mood, String note) async {
    final response = await http.post(
      Uri.parse('${Constants.apiBaseUrl}/moods'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"mood": mood, "note": note}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Mood.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create mood");
    }
  }

  // Journals API
  static Future<List<Journal>> getJournals() async {
    final response =
        await http.get(Uri.parse('${Constants.apiBaseUrl}/journals'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Journal> journals = body.map((e) => Journal.fromJson(e)).toList();
      return journals;
    } else {
      throw Exception("Failed to load journals");
    }
  }

  static Future<Journal> createJournal(String title, String content) async {
    final response = await http.post(
      Uri.parse('${Constants.apiBaseUrl}/journals'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "content": content}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Journal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create journal");
    }
  }

  // Chats API
  static Future<List<Chat>> getChats() async {
    final response = await http.get(Uri.parse('${Constants.apiBaseUrl}/chats'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Chat> chats = body.map((e) => Chat.fromJson(e)).toList();
      return chats;
    } else {
      throw Exception("Failed to load chats");
    }
  }

  static Future<Chat> createChat(String username, String message) async {
    final response = await http.post(
      Uri.parse('${Constants.apiBaseUrl}/chats'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "message": message}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Chat.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create chat");
    }
  }
}
