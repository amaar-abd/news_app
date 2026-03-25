import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/api_constants.dart';
import 'package:news_app/core/errors/dio_error_handler.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/data/datasources/api_remote_data_services.dart';
import 'package:news_app/features/home/data/models/everything_params_model.dart';
import 'package:news_app/features/home/data/models/top_headlines_params_model.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';
import 'package:news_app/features/home/domain/repo/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final ApiRemoteDataServices apiRemoteDataServices;
  NewsRepositoryImpl({required this.apiRemoteDataServices});

  @override
  Future<Either<Failure, List<ArticleEntity>>> topHeadlineNews() async {
    final TopHeadlinesParams topHeadlinesParams = TopHeadlinesParams(
      country: 'us',
      category: 'general',
      pageSize: 10,
    );
    try {
      final result = await apiRemoteDataServices.getTopHeadLine(
        ApiConstants.topHeadlines,
        topHeadlinesParams,
      );
      final List<ArticleEntity> articlesList = result.articles!
          .map((article) => article.toEntity())
          .toList();
      return right(articlesList);
    } on DioException catch (e) {
      return left(ServerFailure(DioErrorHandler.dioHande(e)));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> everythingNews() async {
    final EverythingParams everythingParams = EverythingParams(q: 'sports',);
    try {
      final result = await apiRemoteDataServices.getAllNews(
        ApiConstants.everything,
        everythingParams,
      );
      final List<ArticleEntity> articlesList = result.articles!
          .map((article) => article.toEntity())
          .toList();
      return right(articlesList);
    } on DioException catch (e) {
      return left(ServerFailure(DioErrorHandler.dioHande(e)));
    }
  }
}
