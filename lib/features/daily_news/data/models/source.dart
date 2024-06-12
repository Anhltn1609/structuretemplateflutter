import 'package:structure_template/features/daily_news/domain/entities/source.dart';

class SourceModel{
  SourceModel({
    this.id,
    this.name,
  });
  final String? id;
  final String? name;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }

  @override
  String toString() {
    return 'SourceModel{id: $id, name: $name}';
  }
}