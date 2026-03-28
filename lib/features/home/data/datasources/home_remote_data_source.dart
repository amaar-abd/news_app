import 'package:news_app/core/api/web_services.dart';
import 'package:news_app/core/models/api_response_model.dart';
import 'package:news_app/features/home/data/models/top_headlines_params_model.dart';

class HomeRemoteDataSource {
  final WebServices webServices;
  HomeRemoteDataSource({required this.webServices});
  Future<ApiResponse> getTopHeadLine(
    String path,
    TopHeadlinesParams params,
  ) async {
    final result = await webServices.getData(path, params.toMap());

    final ApiResponse apiResponse = ApiResponse.fromJson(result);
    return apiResponse;
  }
}
