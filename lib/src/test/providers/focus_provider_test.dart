import 'package:flutter_test/flutter_test.dart';
import 'package:forest_focus/src/providers/focus_provider.dart';
import 'package:forest_focus/src/models/focus_session.dart';

void main() {
  group('FocusProvider', () {
    late FocusProvider provider;

    setUp(() {
      provider = FocusProvider();
    });

    test('Adicionar nova sessão', () {
      final session = FocusSession(
        id: '1',
        userId: 'user1',
        treeType: 'oak',
        startTime: DateTime.now(),
        duration: 25,
        isCompleted: false,
        treePlanted: false,
      );

      provider.addSession(session);
      expect(provider.sessions, contains(session));
    });

    test('Iniciar e parar o timer', () {
      final session = FocusSession(
        id: '2',
        userId: 'user2',
        treeType: 'pine',
        startTime: DateTime.now(),
        duration: 1,
        isCompleted: false,
        treePlanted: false,
      );

      provider.setCurrentSession(session);
      provider.startTimer();
      expect(provider.isTimerActive, true);

      provider.stopTimer();
      expect(provider.isTimerActive, false);
    });

    test('Completar sessão', () async {
      final session = FocusSession(
        id: '3',
        userId: 'user3',
        treeType: 'cherry',
        startTime: DateTime.now(),
        duration: 1,
        isCompleted: false,
        treePlanted: false,
      );

      provider.addSession(session);
      provider.setCurrentSession(session);
      
      // Simula a conclusão da sessão
      await provider.updateSession(FocusSession(
        id: session.id,
        userId: session.userId,
        treeType: session.treeType,
        startTime: session.startTime,
        endTime: DateTime.now(),
        duration: session.duration,
        isCompleted: true,
        treePlanted: true,
      ));

      expect(provider.sessions.any((s) => s.isCompleted && s.id == session.id), isTrue);
    });
  });
}
