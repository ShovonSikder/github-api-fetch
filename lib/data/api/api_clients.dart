import 'package:dio/dio.dart';
import 'package:github_api_fetch/data/api/api_helper.dart';

class ApiClients {
  final baseURL = 'https://api.github.com/users/';
  final apiHelper = ApiHelper();
  final dio = Dio();

  Future<Response> fetchUser(String username) {
    final url = apiHelper.getUserURL(baseURL, username);
    return dio.get(Uri.parse(url).toString());
  }
}
