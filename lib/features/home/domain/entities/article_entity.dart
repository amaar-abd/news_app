import 'package:news_app/features/home/data/models/source_model.dart';

class ArticleEntity {
  final Source? source;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArticleEntity(
    this.source,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  );
}
