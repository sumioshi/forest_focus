import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/timer_widget.dart';
import '../widgets/tree_widget.dart';
import '../providers/focus_provider.dart';
import '../models/focus_session.dart';
import '../services/tree_service.dart';
import '../utils/string_extensions.dart';

class FocusTimerScreen extends StatefulWidget {
  const FocusTimerScreen({super.key});

  @override
  State<FocusTimerScreen> createState() => _FocusTimerScreenState();
}

class _FocusTimerScreenState extends State<FocusTimerScreen> {
  final TreeService _treeService = TreeService();
  String _selectedTreeType = 'oak';
  int _selectedDuration = 25;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FocusProvider>().loadSessions();
    });
  }

  void _showSessionSelector() {
    final provider = context.read<FocusProvider>();
    final sessions = provider.sessions;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Session'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _startNewSession();
                },
                child: const Text('Create New Session'),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              const Text('Or select an existing session:'),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sessions.where((s) => !s.isCompleted).length,
                  itemBuilder: (context, index) {
                    final session = sessions
                        .where((s) => !s.isCompleted)
                        .toList()[index];
                    return ListTile(
                      leading: Icon(
                        Icons.park,
                        color: Colors.green[700],
                      ),
                      title: Text('${session.treeType.capitalize()} - ${session.duration} min'),
                      subtitle: Text('Created: ${_formatDate(session.startTime)}'),
                      onTap: () {
                        provider.setCurrentSession(session);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startNewSession() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Session'),
        content: StatefulBuilder(
          builder: (context, setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedTreeType,
                decoration: const InputDecoration(
                  labelText: 'Tree Type',
                  border: OutlineInputBorder(),
                ),
                items: _treeService.availableTreeTypes
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.capitalize()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTreeType = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _selectedDuration,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                  border: OutlineInputBorder(),
                ),
                items: [15, 25, 30, 45, 60]
                    .map((duration) => DropdownMenuItem(
                          value: duration,
                          child: Text('$duration minutes'),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDuration = value!;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newSession = FocusSession(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                userId: 'current_user',
                treeType: _selectedTreeType,
                startTime: DateTime.now(),
                duration: _selectedDuration,
                isCompleted: false,
                treePlanted: false,
              );
              
              final provider = context.read<FocusProvider>();
              provider.addSession(newSession);
              provider.setCurrentSession(newSession);
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FocusProvider>(
      builder: (context, provider, child) {
        final currentSession = provider.currentSession;
        
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentSession != null) ...[
                  TreeWidget(
                    treeType: currentSession.treeType,
                    progress: provider.timerProgress,
                    isPlanted: currentSession.isCompleted,
                  ),
                  const SizedBox(height: 32),
                  const TimerWidget(),
                  if (!provider.isTimerActive) ...[
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => provider.startTimer(),
                      child: const Text('Start Timer'),
                    ),
                    TextButton(
                      onPressed: _showSessionSelector,
                      child: const Text('Select Different Session'),
                    ),
                  ],
                ] else ...[
                  const Text(
                    'No session selected',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: _showSessionSelector,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Select or Create Session'),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}