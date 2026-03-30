import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/api_constants.dart';
import 'package:news_app/core/data_source/news_remote_data_source.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/errors/dio_error_handler.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/models/everything_params_model.dart';
import 'package:news_app/features/explore/domain/repo/explore_repo.dart';

class ExploreRepoImpl implements ExploreRepo {
  final NewsRemoteDataSource newsRemoteDataSource;

  ExploreRepoImpl({required this.newsRemoteDataSource});
  @override
  Future<Either<Failure, List<ArticleEntity>>> getCategoryNews({
    required String category,
  }) async {
    final EverythingParams categoryParams = EverythingParams(q: category);
    try {
      final results = await newsRemoteDataSource.getAllNews(
        ApiConstants.everything,
        categoryParams,
      );
      final List<ArticleEntity> articlesList = results.articles!
          .map((article) => article.toEntity())
          .toList();
      return right(articlesList);
    } on DioException catch (e) {
      return left(ServerFailure(DioErrorHandler.dioHande(e)));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
