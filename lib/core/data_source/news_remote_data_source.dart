import 'package:news_app/core/api/web_services.dart';
import 'package:news_app/core/models/api_response_model.dart';
import 'package:news_app/core/models/everything_params_model.dart';

class NewsRemoteDataSource {
  final WebServices webServices;
  NewsRemoteDataSource({required this.webServices});
  Future<ApiResponse> getAllNews(String path, EverythingParams params) async {
    final result = await webServices.getData(path, params.toMapEverything());
    final ApiResponse apiResponse = ApiResponse.fromJson(result);
    return apiResponse;
  }
}