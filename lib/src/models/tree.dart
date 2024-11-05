class Tree {
  final String id;
  final String name;
  final String description;
  final int coinCost;
  final int growthTime;  // em minutos

  Tree({
    required this.id,
    required this.name,
    required this.description,
    required this.coinCost,
    required this.growthTime,
  });

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      coinCost: json['coinCost'],
      growthTime: json['growthTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'coinCost': coinCost,
      'growthTime': growthTime,
    };
  }
}