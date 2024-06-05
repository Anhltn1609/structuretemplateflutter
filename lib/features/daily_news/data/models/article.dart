import 'package:structure_template/features/daily_news/data/models/source.dart';
import 'package:structure_template/features/daily_news/domain/entities/article.dart';
import 'package:structure_template/features/daily_news/domain/entities/source.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    // String? source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'] as String? ?? "a",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      url: json['url'] as String? ?? "",
      urlToImage: json['urlToImage'] as String? ?? "",
      publishedAt: json['publishedAt'] as String? ?? "",
      content: json['content'] as String? ?? "",
      // source: json['source'].toString() as String? ?? "",
      // source: json['source']! as Map<String, dynamic> ?? {},
    );
  }
}
