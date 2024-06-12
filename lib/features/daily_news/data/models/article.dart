import 'package:structure_template/features/daily_news/data/models/source.dart';
import 'package:structure_template/features/daily_news/domain/entities/article.dart';
import 'package:structure_template/features/daily_news/domain/entities/source.dart';

class ArticleModel {
  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    // String? source,
  });

  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'] as String? ?? "",
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

  @override
  String toString() {
    return 'ArticleModel{source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content}';
  }
}
