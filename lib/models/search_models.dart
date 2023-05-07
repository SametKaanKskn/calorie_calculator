// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Items {
  String? name;
  double? fatTotalG;
  double? calories;
  double? proteinG;
  double? carbohydratesTotalG;
  Items({
    this.name,
    this.fatTotalG,
    this.calories,
    this.proteinG,
    this.carbohydratesTotalG,
  });

  Items copyWith({
    String? name,
    double? fatTotalG,
    double? calories,
    double? proteinG,
    double? carbohydratesTotalG,
  }) {
    return Items(
      name: name ?? this.name,
      fatTotalG: fatTotalG ?? this.fatTotalG,
      calories: calories ?? this.calories,
      proteinG: proteinG ?? this.proteinG,
      carbohydratesTotalG: carbohydratesTotalG ?? this.carbohydratesTotalG,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fatTotalG': fatTotalG,
      'calories': calories,
      'proteinG': proteinG,
      'carbohydratesTotalG': carbohydratesTotalG,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      name: map['name'] != null ? map['name'] as String : null,
      fatTotalG:
          map['fat_total_g'] != null ? map['fat_total_g'] as double : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      proteinG: map['protein_g'] != null ? map['protein_g'] as double : null,
      carbohydratesTotalG: map['carbohydrates_total_g'] != null
          ? map['carbohydrates_total_g'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Items(name: $name,fatTotalG: $fatTotalG, calories: $calories, proteinG: $proteinG, carbohydratesTotalG: $carbohydratesTotalG)';
  }

  @override
  bool operator ==(covariant Items other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.fatTotalG == fatTotalG &&
        other.calories == calories &&
        other.proteinG == proteinG &&
        other.carbohydratesTotalG == carbohydratesTotalG;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        fatTotalG.hashCode ^
        calories.hashCode ^
        proteinG.hashCode ^
        carbohydratesTotalG.hashCode;
  }
}
