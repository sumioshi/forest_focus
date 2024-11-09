class FocusSession {
  final String id;
  final String userId;
  final String treeType;
  final DateTime startTime;
  DateTime? endTime;
  final int duration;
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
