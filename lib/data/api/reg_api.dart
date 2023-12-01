import 'dart:convert';

import 'package:data_fetch_bloc/data/api/api_client.dart';
import 'package:data_fetch_bloc/model/registration%20model/reg_model.dart';
import 'package:data_fetch_bloc/model/user_endpoint.dart';
import 'package:dio/dio.dart';

class RegistrationApi {
  static final _apiClient = ApiClient();

  static Future<Registration> registration(Registration model) async {
    try {
      final body = jsonEncode(
          <String, dynamic>{"email": model.email, "password": model.password});

      final Response response =
          await _apiClient.post(Endpoint.register, body: body);
      final data = Registration.fromJson(response.data);
      return data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
