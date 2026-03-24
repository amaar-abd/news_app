import 'package:news_app/features/home/data/models/article_model.dart';

class ApiResponse {
  final String status;
  final int totalResults;
  final List<ArticleModel>? articles;

  const ApiResponse(this.status, this.totalResults, this.articles);

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      json['status'],
      json['totalResults'],
      (json['articles'] as List).map((e) => ArticleModel.fromJson(e)).toList(),
    );
  }
}
