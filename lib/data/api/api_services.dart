import 'package:data_fetch_bloc/model/user_endpoint.dart';
import 'package:data_fetch_bloc/model/home%20model/user_model.dart';
import 'package:data_fetch_bloc/data/api/api_client.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> get(String url);
  Future<Response> post(String url);
}
