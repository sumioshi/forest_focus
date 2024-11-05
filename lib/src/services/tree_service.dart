// lib/src/services/tree_service.dart
class TreeService {
  final List<String> availableTreeTypes = [
    'oak',
    'pine',
    'maple',
    'cherry',
    'birch'
  ];

  String getRandomTreeType() {
    return availableTreeTypes[DateTime.now().microsecond % availableTreeTypes.length];
  }
}