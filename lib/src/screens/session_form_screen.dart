import 'package:flutter/material.dart';
import '../models/focus_session.dart';
import '../services/focus_service.dart';

class SessionFormScreen extends StatefulWidget {
  final FocusSession? session;

  const SessionFormScreen({super.key, this.session});

  @override
  State<SessionFormScreen> createState() => _SessionFormScreenState();
}

class _SessionFormScreenState extends State<SessionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _focusService = FocusService();
  
  late int _duration;
  late String _treeType;
  bool _isCompleted = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _duration = widget.session?.duration ?? 25;
    _treeType = widget.session?.treeType ?? 'oak';
    _isCompleted = widget.session?.isCompleted ?? false;
  }

  Future<void> _saveSession() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true);

    try {
      final session = FocusSession(
        id: widget.session?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'current_user',
        treeType: _treeType,
        startTime: widget.session?.startTime ?? DateTime.now(),
        duration: _duration,
        isCompleted: _isCompleted,
        treePlanted: _isCompleted,
      );

      if (widget.session == null) {
        await _focusService.createSession(session);
      } else {
        await _focusService.updateSession(session);
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.session == null
                  ? 'Session created successfully'
                  : 'Session updated successfully',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.session == null ? 'New Session' : 'Edit Session'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      initialValue: _duration.toString(),
                      decoration: const InputDecoration(
                        labelText: 'Duration (minutes)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter duration';
                        }
                        final duration = int.tryParse(value);
                        if (duration == null || duration <= 0) {
                          return 'Please enter a valid duration';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _duration = int.parse(value!);
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _treeType,
                      decoration: const InputDecoration(
                        labelText: 'Tree Type',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'oak', child: Text('Oak')),
                        DropdownMenuItem(value: 'pine', child: Text('Pine')),
                        DropdownMenuItem(value: 'maple', child: Text('Maple')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _treeType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CheckboxListTile(
                      title: const Text('Completed'),
                      value: _isCompleted,
                      onChanged: (value) {
                        setState(() {
                          _isCompleted = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _saveSession,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        widget.session == null ? 'Create Session' : 'Update Session',
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}