import 'package:flutter_test/flutter_test.dart';
import 'package:forest_focus/src/services/tree_service.dart';

void main() {
  group('TreeService', () {
    late TreeService service;

    setUp(() {
      service = TreeService();
    });

    test('availableTreeTypes should not be empty', () {
      expect(service.availableTreeTypes, isNotEmpty);
    });

    test('availableTreeTypes should contain basic tree types', () {
      final types = service.availableTreeTypes;
      expect(types, contains('oak'));
      expect(types, contains('pine'));
      expect(types, contains('maple'));
    });

    test('getRandomTreeType should return a valid tree type', () {
      final randomType = service.getRandomTreeType();
      expect(service.availableTreeTypes, contains(randomType));
    });

    test('getRandomTreeType should return different values', () {
      // Note: This is a probabilistic test, it might occasionally fail
      final results = <String>{};
      for (var i = 0; i < 10; i++) {
        results.add(service.getRandomTreeType());
      }
      // Should get at least 2 different types in 10 tries
      expect(results.length, greaterThan(1));
    });
  });
}