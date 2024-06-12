import 'package:structure_template/features/daily_news/data/models/article.dart';
import 'package:structure_template/features/daily_news/domain/entities/article.dart';

class ArticleResponse{
  ArticleResponse({
    required this.status,
    required this.totalResults,
    this.articles,
  });

  final String status;
  final int totalResults;
  List<ArticleModel>? articles;


  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      status: json['status'] as String ?? "",
      totalResults: json['totalResults'] as int ?? 0,
      articles: (json['articles'] as List<dynamic>?)?.map((articleJson) {
        return ArticleModel.fromJson(articleJson as Map<String, dynamic>);
      }).toList(),
    );
  }

  @override
  String toString() {
    return 'ArticleResponse{status: $status, totalResults: $totalResults, articles: $articles}';
  }
}