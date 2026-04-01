import 'package:hive/hive.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/entites/article_entity.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
class ArticleModel extends HiveObject {
  @HiveField(0)
  final Source? source;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? urlToImage;
  @HiveField(4)
  final String? publishedAt;
  @HiveField(5)
  final String? author;
  @HiveField(6)
  final String? content;

  ArticleModel(
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
  
  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
     entity.source,
      entity.title,
      entity.description,
      entity.urlToImage,
      entity.publishedAt,
      entity.content,
      entity.author
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
