import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/api_constants.dart';
import 'package:news_app/core/data_source/news_remote_data_source.dart';
import 'package:news_app/core/errors/dio_error_handler.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/models/everything_params_model.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/search/domain/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl({required this.newsRemoteDataSource});
  final NewsRemoteDataSource newsRemoteDataSource;

  @override
  Future<Either<Failure, List<ArticleEntity>>> getNewsByQuery({
    required String query,
  }) async {
    final EverythingParams params = EverythingParams(q: query);
    try {
      final result = await newsRemoteDataSource.getAllNews(
        ApiConstants.everything,
        params,
      );
      final List<ArticleEntity> articles = result.articles!
          .map((article) => article.toEntity())
          .toList();
      return right(articles);
    } on DioException catch (e) {
      return left(ServerFailure(DioErrorHandler.dioHande(e)));
    }
  }
}
