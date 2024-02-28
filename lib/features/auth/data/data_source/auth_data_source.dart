import 'package:ecommerce_app/core/constant/linkapi.dart';

import '../../../../core/services/api_services.dart';
import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<User> login({required String email, required String password});
  Future<dynamic> verifyCodeSignUp(
      {required String email, required int verifyCode});
  Future<dynamic> signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  });
}

class AuthDataSourceImp extends AuthDataSource {
  final ApiService apiService;
  AuthDataSourceImp(this.apiService);

  @override
  Future<User> login({required String email, required String password}) async {
    return User();
  }

  @override
  Future<dynamic> signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    var data = await apiService.post(endPoint: AppLinks.signUp, data: {
      "users_name": username,
      "users_password": password,
      "users_email": email,
      "users_phone": phone,
    });
    return data;
  }

  @override
  Future<dynamic> verifyCodeSignUp(
      {required String email, required int verifyCode}) async {
    var data =
        await apiService.post(endPoint: AppLinks.verifyCodeSignUp, data: {
      "users_email": email,
      "users_verifycode": verifyCode,
    });
    print("111111111111111111111");
    print(data);
    return data;
  }
}
