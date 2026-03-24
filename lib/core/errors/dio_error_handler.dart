import 'package:dio/dio.dart';

class DioErrorHandler {
  static String dioHande(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.connectionError:
        return 'Please check your network connection.';
      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response?.statusCode);

      default:
        return 'Unecpected error : ${e.message}';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Resource not found (404). Please check the URL or request data.';
      case 500:
        return 'Internal server error (500). Please try again later.';
      default:
        return 'Something went wrong. Status code: $statusCode';
    }
  }
}
