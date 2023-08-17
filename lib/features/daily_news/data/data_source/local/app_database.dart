import 'package:floor/floor.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/data_source/local/dao/article_dao.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/models/Articles.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';


@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase{
  ArticleDao get articleDAO;
}