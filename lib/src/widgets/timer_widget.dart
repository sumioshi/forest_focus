import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/focus_provider.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FocusProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: provider.isTimerActive ? Colors.green : Colors.grey,
                  width: 4,
                ),
              ),
              child: Center(
                child: Text(
                  provider.timerDisplay,
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (provider.isTimerActive)
              ElevatedButton(
                onPressed: () => provider.stopTimer(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Give Up'),
              ),
          ],
        );
      },
    );
  }
}