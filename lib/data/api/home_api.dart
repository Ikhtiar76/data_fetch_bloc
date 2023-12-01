import 'package:dio/dio.dart';

import '../../model/user_endpoint.dart';
import 'api_client.dart';

class HomeApi {
  static final _apiClient = ApiClient();

  static Future<Response> getUser(int pageno) async {
    try {
      final Response response =
          await _apiClient.get(Endpoint.users + "?page=$pageno");

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
