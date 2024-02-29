// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

// class ApiService {
//   final Dio dio;
//   ApiService({required this.dio});

//   final baseUrl = 'https://www.googleapis.com/books/v1/';
// }

class ApiService {
  final Dio dio;
  ApiService({
    required this.dio,
  });

  final String baseUrl = "https://www.googleapis.com/books/v1/";

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    try {
      final response = await dio.get('$baseUrl$endpoint');
      return response.data;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to load data");
    }
  }

  Future<Response> postData(String endpoint, dynamic data) async {
    try {
      final response = await dio.post('$baseUrl$endpoint', data: data);
      return response;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      throw Exception("Failed to post data");
    }
  }
}
