import 'package:news_app/features/home/data/models/article_model.dart';

class ApiResponse {
  final String status;
  final int totalResulte;
  final List<ArticleModel>? articles;

  const ApiResponse(this.status, this.totalResulte, this.articles);

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(json['status'], json['totalResulte'], json['articles']);
  }
}
