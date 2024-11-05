import 'package:flutter_test/flutter_test.dart';
import 'package:forest_focus/src/providers/focus_provider.dart';
import 'package:forest_focus/src/models/focus_session.dart';
import 'package:forest_focus/src/services/focus_service.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([FocusService])
void main() {
  group('FocusProvider', () {
    test('initial values should be empty', () {
      final provider = FocusProvider();
      
      expect(provider.sessions, isEmpty);
      expect(provider.isLoading, false);
      expect(provider.error, '');
      expect(provider.currentSession, null);
      expect(provider.isTimerActive, false);
      expect(provider.timerProgress, 0.0);
    });

    test('timer management should work correctly', () {
      final provider = FocusProvider();
      final session = FocusSession(
        id: '1',
        userId: 'user1',
        treeType: 'oak',
        startTime: DateTime.now(),
        duration: 25,
      );

      // Set current session
      provider.setCurrentSession(session);
      expect(provider.currentSession, session);
      expect(provider.isTimerActive, false);

      // Start timer
      provider.startTimer();
      expect(provider.isTimerActive, true);

      // Stop timer
      provider.stopTimer();
      expect(provider.isTimerActive, false);

      // Reset timer
      provider.resetTimer();
      expect(provider.timerProgress, 0.0);
      expect(provider.isTimerActive, false);
    });

    test('timer progress should update correctly', () {
      final provider = FocusProvider();
      const progress = 0.5;

      provider.updateTimerProgress(progress);
      expect(provider.timerProgress, progress);
    });
  });
}