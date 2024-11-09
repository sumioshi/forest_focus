import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/focus_provider.dart';
import '../screens/focus_timer_screen.dart';
import '../screens/forest_screen.dart';
import '../screens/sessions_list_screen.dart';
import '../screens/stats_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final completedSessions = context.watch<FocusProvider>().sessions.where((s) => s.isCompleted).toList();

    final List<Widget> _screens = [
      const FocusTimerScreen(),
      ForestScreen(completedSessions: completedSessions),
      const SessionsListScreen(),
      const StatsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forest Focus'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forest),
            label: 'Forest',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sessions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
      ),
    );
  }
}
