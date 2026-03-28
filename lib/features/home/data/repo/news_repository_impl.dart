import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/api_constants.dart';
import 'package:news_app/core/data_source/news_remote_data_source.dart';
import 'package:news_app/core/errors/dio_error_handler.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/models/everything_params_model.dart';
import 'package:news_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:news_app/features/home/data/models/top_headlines_params_model.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/features/home/domain/repo/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.homeRemoteDataSource, required this.newsRemoteDataSource});

  @override
  Future<Either<Failure, List<ArticleEntity>>> topHeadlineNews() async {
    final TopHeadlinesParams topHeadlinesParams = TopHeadlinesParams(
      country: 'us',
      category: 'general',
      pageSize: 10,
    );
    try {
      final result = await homeRemoteDataSource.getTopHeadLine(
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
  Future<Either<Failure, List<ArticleEntity>>> fetchEverything({required String query}) async {
    final EverythingParams everythingParams = EverythingParams(q: query,);
    try {
      final result = await newsRemoteDataSource.getAllNews(
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
