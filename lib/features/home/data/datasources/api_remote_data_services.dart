import 'package:news_app/features/home/data/models/api_response_model.dart';
import 'package:news_app/features/home/data/models/everything_params_model.dart';
import 'package:news_app/features/home/data/models/top_headlines_params_model.dart';
import 'package:news_app/features/home/data/web_services/web_services.dart';

class ApiRemoteDataServices {
  final WebServices webServices;
  ApiRemoteDataServices({required this.webServices});

  Future<ApiResponse> getTopHeadLine(
    String path,
    TopHeadlinesParams params,
  ) async {
    final result = await webServices.getData(path, params.toMap());
    final ApiResponse apiResponse = ApiResponse.fromJson(result);
    return apiResponse;
  }

  Future<ApiResponse> getAllNews(String path,EverythingParams params) async {
   final result = await webServices.getData(path, params.toMap());
    final ApiResponse apiResponse = ApiResponse.fromJson(result);
    return apiResponse;
  }
}
