import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:forest_focus/src/widgets/timer_widget.dart';
import 'package:forest_focus/src/providers/focus_provider.dart';

void main() {
  group('TimerWidget', () {
    testWidgets('should display timer correctly', (WidgetTester tester) async {
      // Cria um provider para o teste
      final provider = FocusProvider();

      // Constrói o widget dentro de um provider
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<FocusProvider>.value(
            value: provider,
            child: const Scaffold(
              body: TimerWidget(),
            ),
          ),
        ),
      );

      // Verifica se o widget foi construído
      expect(find.byType(TimerWidget), findsOneWidget);

      // Verifica se o botão "Give Up" não está visível quando o timer não está ativo
      expect(find.text('Give Up'), findsNothing);
    });
  });
}