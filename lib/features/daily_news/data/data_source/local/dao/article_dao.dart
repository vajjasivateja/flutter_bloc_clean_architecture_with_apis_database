import 'package:floor/floor.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/models/Articles.dart';

@dao
abstract class ArticleDao{
  @Insert()
  Future<void> insertArticles(ArticleModel article);

  @delete
  Future<void> deleteArticles(ArticleModel article);

  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();
  
}