import 'package:flutter_bloc_clean_architecture_with_apis_database/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleEntity>>> getNewsArticle ();
}