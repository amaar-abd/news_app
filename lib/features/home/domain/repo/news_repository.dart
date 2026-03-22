import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';



abstract class NewsRepository {
  Future<Either<Failure,List<ArticleEntity>>> topHeadlineNews();
  Future<Either<Failure,List<ArticleEntity>>> everythingNews();
}
