class PillModel {
  final String id;
  final String name;
  final String ingredient;
  final String ingredientCode;
  final String effect;
  final List<String> sideEffects;
  final bool isCurrentlyTaking;

  PillModel({
    this.id = '',
    required this.name,
    required this.ingredient,
    required this.ingredientCode,
    required this.effect,
    required this.sideEffects,
    this.isCurrentlyTaking = true,
  });

  factory PillModel.fromJson(Map<String, dynamic> json) {
    return PillModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ingredient: json['ingredient'] ?? '',
      ingredientCode: json['ingredient_code'] ?? '',
      effect: json['effect'] ?? '',
      sideEffects: List<String>.from(json['side_effects'] ?? []),
      isCurrentlyTaking: json['isCurrentlyTaking'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ingredient': ingredient,
      'ingredient_code': ingredientCode,
      'effect': effect,
      'side_effects': sideEffects,
      'isCurrentlyTaking': isCurrentlyTaking,
    };
  }
}