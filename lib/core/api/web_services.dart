import 'package:dio/dio.dart';
import 'package:news_app/core/constants/api_constants.dart';

class WebServices {
  late Dio dio;

  WebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {'authorization': 'bearer ${ApiConstants.apiKey}'},
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(LogInterceptor(
    request: true,         
    requestHeader: true,   
    requestBody: true,     
    responseBody: true,    
    error: true,           
  ));
  }

  Future<Map<String,dynamic>> getData(
    String path,
    Map<String, dynamic> queryParameters,
  ) async {
    Response response = await dio.get(path, queryParameters: queryParameters);
    return response.data;
  }
}
