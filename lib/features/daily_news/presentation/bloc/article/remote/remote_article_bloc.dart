import 'package:flutter_bloc_clean_architecture_with_apis_database/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/article_usecase.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final ArticleUseCase _articleUseCase;

  RemoteArticleBloc(this._articleUseCase) : super(const RemoteArticleLoadingState()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _articleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoadedState(dataState.data!));
    } else {
      print(dataState.error!.message);
      emit(RemoteArticleErrorState(dataState.error!));
    }
  }
}
