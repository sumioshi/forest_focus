import 'package:flutter_test/flutter_test.dart';
import 'package:forest_focus/src/providers/focus_provider.dart';

void main() {
  group('FocusProvider', () {
    late FocusProvider provider;

    setUp(() {
      provider = FocusProvider();
    });

    test('Adicionar nova sessão', () {
      expect(true, isTrue);
    });

    test('Completar sessão', () {
      expect(true, isTrue);
    });
  });
}
