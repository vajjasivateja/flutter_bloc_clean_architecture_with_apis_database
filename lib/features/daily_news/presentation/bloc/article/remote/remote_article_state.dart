import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticleLoadingState extends RemoteArticleState {
  const RemoteArticleLoadingState();
}

class RemoteArticleLoadedState extends RemoteArticleState {
  const RemoteArticleLoadedState(List<ArticleEntity> articlesList) : super(articles: articlesList);
}

class RemoteArticleErrorState extends RemoteArticleState {
  const RemoteArticleErrorState(DioException error) : super(error: error);
}
