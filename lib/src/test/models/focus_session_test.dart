import 'package:flutter_test/flutter_test.dart';
import 'package:forest_focus/src/models/focus_session.dart';

void main() {
  group('FocusSession', () {
    final testDate = DateTime(2024, 1, 1, 12, 0); // Fixed date for testing

    test('should create with correct default values', () {
      final session = FocusSession(
        id: '1',
        userId: 'user1',
        treeType: 'oak',
        startTime: testDate,
        duration: 25,
      );

      expect(session.id, '1');
      expect(session.userId, 'user1');
      expect(session.treeType, 'oak');
      expect(session.startTime, testDate);
      expect(session.duration, 25);
      expect(session.isCompleted, false);
      expect(session.treePlanted, false);
      expect(session.endTime, null);
    });

    test('should convert to JSON correctly', () {
      final session = FocusSession(
        id: '1',
        userId: 'user1',
        treeType: 'oak',
        startTime: testDate,
        duration: 25,
      );

      final json = session.toJson();

      expect(json['id'], '1');
      expect(json['userId'], 'user1');
      expect(json['treeType'], 'oak');
      expect(json['startTime'], testDate.toIso8601String());
      expect(json['duration'], 25);
      expect(json['isCompleted'], false);
      expect(json['treePlanted'], false);
      expect(json['endTime'], null);
    });

    test('should create from JSON correctly', () {
      final json = {
        'id': '1',
        'userId': 'user1',
        'treeType': 'oak',
        'startTime': testDate.toIso8601String(),
        'duration': 25,
        'isCompleted': true,
        'treePlanted': true,
        'endTime': testDate.add(const Duration(minutes: 25)).toIso8601String(),
      };

      final session = FocusSession.fromJson(json);

      expect(session.id, '1');
      expect(session.userId, 'user1');
      expect(session.treeType, 'oak');
      expect(session.startTime, testDate);
      expect(session.duration, 25);
      expect(session.isCompleted, true);
      expect(session.treePlanted, true);
      expect(session.endTime, testDate.add(const Duration(minutes: 25)));
    });
  });
}