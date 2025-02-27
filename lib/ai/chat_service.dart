import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _claudeKey = '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';
  final Box _cache = Hive.box('responseCache');

  Future<String> getResponse(String message) async {
    // Try cached response first
    if (_cache.containsKey(message)) {
      return _cache.get(message);
    }

    try {
      final response = await http.post(
        Uri.parse('https://api.anthropic.com/v1/complete'),
        headers: {'X-API-Key': _claudeKey},
        body: jsonEncode({
          'prompt': '\n\nHuman: $message\n\nAssistant:',
          'model': 'claude-instant-1',
          'max_tokens_to_sample': 300,
        }),
      );

      final result = jsonDecode(response.body)['completion'];
      _cache.put(message, result); // Cache response
      return result;
    } catch (e) {
      return _getLocalFallback(message);
    }
  }

  String _getLocalFallback(String message) {
    final fallbacks = {
      'stress':
          'Try deep breathing exercises. Inhale for 4 counts, hold for 4, exhale for 6.',
      'anxiety':
          'Grounding technique: Name 5 things you see, 4 things you feel, 3 things you hear...',
      'default':
          'I need an internet connection to help properly. Please reconnect.',
    };

    if (message.toLowerCase().contains('stress')) return fallbacks['stress']!;
    if (message.toLowerCase().contains('anxious')) return fallbacks['anxiety']!;
    return fallbacks['default']!;
  }
}
