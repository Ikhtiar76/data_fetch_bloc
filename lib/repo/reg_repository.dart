import 'package:data_fetch_bloc/data/api/reg_api.dart';
import 'package:data_fetch_bloc/model/registration%20model/reg_model.dart';

class RegistrationRepository {
  static Future<Registration> getData(Registration model) async {
    try {
      final result = await RegistrationApi.registration(model);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
