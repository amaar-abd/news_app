import 'package:news_app/features/home/data/models/source_model.dart';
import 'package:news_app/features/home/domain/entities/article_entity.dart';

class ArticleModel {
  final Source? source;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? author;

  final String? content;

  const ArticleModel(
    this.source,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.author,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      Source.fromJson(json['source']),
      json['title'],
      json['description'],
      json['urlToImage'],
      json['publishedAt'],
      json['content'],
      json['author'],
    );
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
      source,
      title,
      description,
      author,
      urlToImage,
      publishedAt,
      content,
    );
  }
}
