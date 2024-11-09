import 'package:flutter/material.dart';
import 'package:forest_focus/src/models/focus_session.dart';

class ForestScreen extends StatelessWidget {
  final List<FocusSession> completedSessions;

  ForestScreen({required this.completedSessions});

  IconData _getTreeIcon(String treeType) {
    switch (treeType.toLowerCase()) {
      case 'oak':
        return Icons.nature;
      case 'pine':
        return Icons.park;
      case 'cherry':
        return Icons.local_florist;
      default:
        return Icons.eco;
    }
  }

  Color _getTreeColor(String treeType) {
    switch (treeType.toLowerCase()) {
      case 'oak':
        return Colors.brown;
      case 'pine':
        return Colors.green;
      case 'cherry':
        return Colors.pink;
      default:
        return Colors.green[800]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Floresta'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: completedSessions.length,
        itemBuilder: (context, index) {
          final session = completedSessions[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getTreeIcon(session.treeType),
                color: _getTreeColor(session.treeType),
                size: 50,
              ),
              SizedBox(height: 5),
              Text(
                session.treeType,
                style: TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}
