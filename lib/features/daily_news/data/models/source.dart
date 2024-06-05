import 'package:structure_template/features/daily_news/domain/entities/source.dart';

class SourceModel extends SourceEntity {
  const SourceModel({
    String? id,
    String? name,
  });
  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }
}