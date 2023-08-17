import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/data_source/local/app_database.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/usecases/article_usecase.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/data_source/remote/news_api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio injection
  sl.registerSingleton<Dio>(Dio());

  //api service injection
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //repository injection
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //use cases injection
  sl.registerSingleton<ArticleUseCase>(ArticleUseCase(sl()));

  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));

  final database = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  sl.registerSingleton<AppDatabase>(database);
}
