import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/entites/article_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ArticleEntity>>> getNewsByQuery({required String query});
}
