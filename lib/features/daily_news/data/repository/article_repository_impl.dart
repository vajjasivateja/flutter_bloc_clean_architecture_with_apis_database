import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/core/constants/constants.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/repository/article_repository.dart';

import '../models/Articles.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: country,
        category: category,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.unknown,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (exception) {
      return DataError(exception);
    }
  }
}
