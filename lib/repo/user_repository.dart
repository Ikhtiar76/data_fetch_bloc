import 'package:data_fetch_bloc/data/api/home_api.dart';

import '../model/home model/user_model.dart';

class UserRepository {
  static Future<List<UserList>> getUserData({required int pageno}) async {
    try {
      final response = await HomeApi.getUser(pageno);

      final users = UserModel.fromJson(response.data);
      final userList = users.data ?? [];
      return userList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
