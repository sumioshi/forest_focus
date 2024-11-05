import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/focus_session.dart';

class FocusService {
  final String baseUrl = 'http://localhost:3000';

  Future<List<FocusSession>> getCompletedSessions() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/sessions'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList
            .map((json) => FocusSession.fromJson(json))
            .where((session) => session.isCompleted)
            .toList();
      }
      throw Exception('Failed to load sessions');
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> completeFocusSession() async {
    try {
      final session = FocusSession(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'current_user',
        treeType: 'oak',
        startTime: DateTime.now().subtract(const Duration(minutes: 25)),
        endTime: DateTime.now(),
        duration: 25,
        isCompleted: true,
        treePlanted: true,
      );

      final response = await http.post(
        Uri.parse('$baseUrl/sessions'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(session.toJson()),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save session');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}