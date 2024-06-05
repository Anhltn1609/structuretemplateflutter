import 'package:structure_template/core/resources/data_state.dart';
import 'package:structure_template/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:structure_template/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../daily_news/domain/usecases/get_article.dart';
class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState>{

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter <RemoteArticleState> emit) async{
  final dataState = await _getArticleUseCase();
  print('REMOTE_ARTICLE_BLOC : ${dataState.data.runtimeType}');
  if(dataState is DataSuccess  && dataState.data!.isNotEmpty){
    emit(
      RemoteArticlesDone(dataState.data!)
    );
  }
  if(dataState is DataFailed){
    emit(
      RemoteArticlesError(dataState.error!)
    );
    print('REMOTE_ARTICLE_BLOC error: ${dataState.data}');
  }
  }

  
}