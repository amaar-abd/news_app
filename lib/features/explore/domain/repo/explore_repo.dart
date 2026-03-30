import 'package:dartz/dartz.dart';
import 'package:news_app/core/entites/article_entity.dart';
import 'package:news_app/core/errors/failure.dart';

abstract class ExploreRepo {
  Future<Either<Failure, List<ArticleEntity>>> getCategoryNews({
    required String category,
  });
}
