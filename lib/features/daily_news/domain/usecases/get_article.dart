import 'package:structure_template/core/resources/data_state.dart';
import 'package:structure_template/features/daily_news/data/models/article_response.dart';
import 'package:structure_template/features/daily_news/domain/repositories/article_repository.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/article.dart';
class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}