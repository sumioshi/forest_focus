import 'package:flutter/foundation.dart';
import 'dart:async';
import '../models/focus_session.dart';
import '../services/focus_service.dart';

class FocusProvider with ChangeNotifier {
  final FocusService _focusService = FocusService();
  List<FocusSession> _sessions = [];
  bool _isLoading = false;
  String _error = '';
  
  FocusSession? _currentSession;
  bool _isTimerActive = false;
  double _timerProgress = 0.0;
  Timer? _timer;
  int _remainingSeconds = 0;

  List<FocusSession> get sessions => _sessions;
  bool get isLoading => _isLoading;
  String get error => _error;
  FocusSession? get currentSession => _currentSession;
  bool get isTimerActive => _isTimerActive;
  double get timerProgress => _timerProgress;
  int get remainingSeconds => _remainingSeconds;

  String get timerDisplay {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void setCurrentSession(FocusSession? session) {
    _timer?.cancel();
    _currentSession = session;
    if (session != null) {
      _remainingSeconds = session.duration * 60;
    }
    _timerProgress = 0.0;
    _isTimerActive = false;
    notifyListeners();
  }

  void startTimer() {
    if (_currentSession == null) return;

    _isTimerActive = true;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        _timerProgress = 1 - (_remainingSeconds / (_currentSession!.duration * 60));
        notifyListeners();
      } else {
        _timer?.cancel();
        _completeSession();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _isTimerActive = false;
    notifyListeners();
  }

  Future<void> _completeSession() async {
    if (_currentSession == null) return;

    final completedSession = FocusSession(
      id: _currentSession!.id,
      userId: _currentSession!.userId,
      treeType: _currentSession!.treeType,
      startTime: _currentSession!.startTime,
      endTime: DateTime.now(),
      duration: _currentSession!.duration,
      isCompleted: true,
      treePlanted: true,
    );

    await updateSession(completedSession);
    _isTimerActive = false;
    _currentSession = null;
    notifyListeners();
  }

  Future<void> loadSessions() async {
    try {
      _isLoading = true;
      notifyListeners();

      _sessions = await _focusService.getAllSessions();
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

      await _focusService.createSession(session);
      await loadSessions();
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateSession(FocusSession session) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _focusService.updateSession(session);
      await loadSessions();

      if (session.isCompleted && session.id == _currentSession?.id) {
        _currentSession = null;
        _isTimerActive = false;
        _timer?.cancel();
      }

      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
