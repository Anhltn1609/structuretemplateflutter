import 'dart:io';

import 'package:dio/dio.dart';
import 'package:structure_template/core/constants/constants.dart';
import 'package:structure_template/core/resources/data_state.dart';
import 'package:structure_template/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:structure_template/features/daily_news/data/models/article.dart';
import 'package:structure_template/features/daily_news/domain/entities/article.dart';
import 'package:structure_template/features/daily_news/domain/repositories/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  // final AppDatabase _appDatabase;
  // ArticleRepositoryImpl(this._newsApiService,this._appDatabase);
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.response.data as Map<String, dynamic>;
        final articles = data['articles'] as List<dynamic>;
        print('*** ${articles}');
        // List<ArticleModel> fetchedArticles  = articles
        //     .map((item) =>  ArticleModel.fromJson(item as Map<String, dynamic>))
        //     .toList();
        List<ArticleModel> fetchedArticles = articles
            .map((item) => ArticleModel.fromJson(item as Map<String, dynamic>))
            .toList();
        print('** ${fetchedArticles}');
        return DataSuccess(fetchedArticles );
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      print('8  $e');
      return DataFailed(e);
    }
  }

// @override
// Future<List<ArticleModel>>
// SavedArticles() async {
//   return _appDatabase.articleDAO.getArticles();
// }

// @override
// Future<void> removeArticle(ArticleEntity article) {
//   return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
// }
//
// @override
// Future<void> saveArticle(ArticleEntity article) {
//   return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
// }
}
