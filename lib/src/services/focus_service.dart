import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/focus_session.dart';

class FocusService {
  final String baseUrl = 'http://localhost:3000';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<List<FocusSession>> getAllSessions() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sessions'),
        headers: headers,
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Connection timeout'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => FocusSession.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load sessions: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getAllSessions: $e');
      throw Exception('Failed to connect to server: $e');
    }
  }

  Future<FocusSession> createSession(FocusSession session) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/sessions'),
        headers: headers,
        body: json.encode(session.toJson()),
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Connection timeout'),
      );

      if (response.statusCode == 201) {
        return FocusSession.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create session: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in createSession: $e');
      throw Exception('Failed to connect to server: $e');
    }
  }

  Future<FocusSession> updateSession(FocusSession session) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/sessions/${session.id}'),
        headers: headers,
        body: json.encode(session.toJson()),
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Connection timeout'),
      );

      if (response.statusCode == 200) {
        return FocusSession.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update session: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in updateSession: $e');
      throw Exception('Failed to connect to server: $e');
    }
  }

  Future<void> deleteSession(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/sessions/$id'),
        headers: headers,
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () => throw Exception('Connection timeout'),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete session: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in deleteSession: $e');
      throw Exception('Failed to connect to server: $e');
    }
  }
}