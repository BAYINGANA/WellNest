import 'dart:convert';
import 'package:http/http.dart' as http;

class ClaudeService {
  static const String _apiKey =
      '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';
  static const String _model = 'claude-2.1';

  Future<String> getResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.anthropic.com/v1/complete'),
        headers: {
          'X-API-Key': _apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': '\n\nHuman: $message\n\nAssistant:',
          'model': _model,
          'max_tokens_to_sample': 300,
          'temperature': 0.7,
        }),
      );

      return jsonDecode(response.body)['completion'];
    } catch (e) {
      return "Let me think about that...";
    }
  }
}
