import 'package:flutter/material.dart';
import '../models/focus_session.dart';
import '../services/focus_service.dart';
import 'package:intl/intl.dart';
import 'session_form_screen.dart';

class SessionsListScreen extends StatefulWidget {
  const SessionsListScreen({super.key});

  @override
  State<SessionsListScreen> createState() => _SessionsListScreenState();
}

class _SessionsListScreenState extends State<SessionsListScreen> {
  final FocusService _focusService = FocusService();
  List<FocusSession> _sessions = [];
  bool _isLoading = true;
  String? _error;
  bool _mounted = true;

  @override
  void initState() {
    super.initState();
    _loadSessions();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> _loadSessions() async {
    if (!_mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final sessions = await _focusService.getAllSessions();
      if (!_mounted) return;
      
      setState(() {
        _sessions = sessions;
        _isLoading = false;
      });
    } catch (e) {
      if (!_mounted) return;
      
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteSession(String id) async {
    if (!_mounted) return;

    try {
      await _focusService.deleteSession(id);
      if (!_mounted) return;
      
      await _loadSessions();
      
      if (_mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Session deleted successfully')),
        );
      }
    } catch (e) {
      if (!_mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting session: ${e.toString()}')),
      );
    }
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            'Error: ${_error ?? "Unknown error"}',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadSessions,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionsList() {
    if (_sessions.isEmpty) {
      return const Center(
        child: Text('No sessions found'),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadSessions,
      child: ListView.builder(
        itemCount: _sessions.length,
        itemBuilder: (context, index) {
          final session = _sessions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('Duration: ${session.duration} minutes'),
              subtitle: Text(
                'Started: ${DateFormat.yMd().add_jm().format(session.startTime)}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SessionFormScreen(session: session),
                      ),
                    ).then((_) => _loadSessions()),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Session'),
                        content: const Text(
                          'Are you sure you want to delete this session?'
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          TextButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteSession(session.id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildErrorWidget()
              : _buildSessionsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SessionFormScreen(),
          ),
        ).then((_) => _loadSessions()),
        child: const Icon(Icons.add),
      ),
    );
  }
}