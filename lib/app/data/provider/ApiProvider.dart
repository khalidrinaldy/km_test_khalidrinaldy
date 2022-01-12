import 'package:dio/dio.dart';
import 'package:km_test_khalidrinaldy/app/data/models/User.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final _baseUrl = "https://reqres.in/api";

  Future<String> getUser({required pageNumber}) async {
    Response response = await _dio.get("$_baseUrl/users?page=$pageNumber");
    return response.toString();
  }
}