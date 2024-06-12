import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:structure_template/core/constants/constants.dart';
import 'package:structure_template/core/resources/data_state.dart';
import 'package:structure_template/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:structure_template/features/daily_news/data/models/article.dart';
import 'package:structure_template/features/daily_news/domain/entities/article.dart';
import 'package:structure_template/features/daily_news/domain/repositories/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article_response.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  // final AppDatabase _appDatabase;
  // ArticleRepositoryImpl(this._newsApiService,this._appDatabase);
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = httpResponse.data;// as Map<String, dynamic>;
        debugPrint(data.toString());
        final json = {
          "source": {
            "id": null,
            "name": "BBC News"
          },
          "author": null,
          "title": "Narendra Modi: Will coalition turn him into a humbler leader? - BBC.com",
          "description": "Will Narendra Modi, who has dominated Indian politics for a decade, be able to run a coalition government?",
          "url": "https://www.bbc.com/news/articles/cn00xl6n8ldo",
          "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/064b/live/c7f97ff0-2585-11ef-baa7-25d483663b8e.png",
          "publishedAt": "2024-06-09T07:50:28Z",
          "content": "India is no stranger to coalition governments.\r\nSome of the worlds largest coalitions, comprising between six and a dozen parties, have been formed in the world's most populous democracy. \r\nFrom 1989… [+6673 chars]"
        };
        ArticleModel temp1 = ArticleModel.fromJson(json);
        debugPrint("temp: "+temp1.toString() );

        // final articles = data['articles'] as List<dynamic>;
        // print('*** ${articles}');
        // // List<ArticleModel> fetchedArticles  = articles
        // //     .map((item) =>  ArticleModel.fromJson(item as Map<String, dynamic>))
        // //     .toList();
        // List<ArticleModel> fetchedArticles = articles
        //     .map((item) => ArticleModel.fromJson(item as Map<String, dynamic>))
        //     .toList();
        // print('** ${fetchedArticles}');
        //data.articles;
        List<ArticleEntity> temp = [];
        return DataSuccess(temp);
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
