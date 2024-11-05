// lib/src/models/user.dart
class User {
  final String id;
  final String name;
  final int coins;
  final List<String> unlockedTrees;
  final int totalMinutesFocused;

  User({
    required this.id,
    required this.name,
    this.coins = 0,
    required this.unlockedTrees,
    this.totalMinutesFocused = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      coins: json['coins'],
      unlockedTrees: List<String>.from(json['unlockedTrees']),
      totalMinutesFocused: json['totalMinutesFocused'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coins': coins,
      'unlockedTrees': unlockedTrees,
      'totalMinutesFocused': totalMinutesFocused,
    };
  }
}

// lib/src/models/focus_session.dart
class FocusSession {
  final String id;
  final String userId;
  final String treeType;
  final DateTime startTime;
  DateTime? endTime;
  final int duration; // em minutos
  bool isCompleted;
  bool treePlanted;

  FocusSession({
    required this.id,
    required this.userId,
    required this.treeType,
    required this.startTime,
    this.endTime,
    required this.duration,
    this.isCompleted = false,
    this.treePlanted = false,
  });

  factory FocusSession.fromJson(Map<String, dynamic> json) {
    return FocusSession(
      id: json['id'],
      userId: json['userId'],
      treeType: json['treeType'],
      startTime: DateTime.parse(json['startTime']),
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      duration: json['duration'],
      isCompleted: json['isCompleted'],
      treePlanted: json['treePlanted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'treeType': treeType,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'duration': duration,
      'isCompleted': isCompleted,
      'treePlanted': treePlanted,
    };
  }
}