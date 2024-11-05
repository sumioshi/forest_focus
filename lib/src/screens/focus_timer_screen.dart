// lib/src/screens/focus_timer_screen.dart
import 'package:flutter/material.dart';
import '../widgets/timer_widget.dart';

class FocusTimerScreen extends StatefulWidget {
  const FocusTimerScreen({super.key});

  @override
  State<FocusTimerScreen> createState() => _FocusTimerScreenState();
}

class _FocusTimerScreenState extends State<FocusTimerScreen> {
  bool _isActive = false;

  void _handleComplete() {
    setState(() {
      _isActive = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Session completed!')),
    );
  }

  void _handleCancel() {
    setState(() {
      _isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerWidget(
              duration: 25,
              onComplete: _handleComplete,
              onCancel: _handleCancel,
            ),
          ],
        ),
      ),
    );
  }
}