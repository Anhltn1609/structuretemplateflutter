import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:structure_template/core/constants/constants.dart';
import 'package:structure_template/features/daily_news/data/models/article.dart';
import 'package:structure_template/features/daily_news/data/models/article_response.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ArticleResponse>> getNewsArticles({
    @Query("apiKey") String ? apiKey,
    @Query("country") String ? country,
    @Query("category") String ? category,
  });

}