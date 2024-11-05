import 'package:flutter/foundation.dart';
import '../models/focus_session.dart';
import '../services/focus_service.dart';

class FocusProvider with ChangeNotifier {
  final FocusService _focusService = FocusService();
  List<FocusSession> _sessions = [];
  bool _isLoading = false;
  String _error = '';

  List<FocusSession> get sessions => _sessions;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadSessions() async {
    try {
      _isLoading = true;
      notifyListeners();

      _sessions = await _focusService.getCompletedSessions();
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addSession(FocusSession session) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _focusService.completeFocusSession();
      await loadSessions();
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}