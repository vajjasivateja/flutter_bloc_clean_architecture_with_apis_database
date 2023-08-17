import 'package:flutter_bloc_clean_architecture_with_apis_database/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/entities/article.dart';
import 'package:flutter_bloc_clean_architecture_with_apis_database/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/usecases/usecase.dart';

class ArticleUseCase extends UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  ArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
