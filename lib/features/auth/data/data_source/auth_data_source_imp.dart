import '../../../../core/constant/linkapi.dart';
import '../../../../core/services/api_services.dart';
import 'auth_data_source.dart';

class AuthDataSourceImp extends AuthDataSource {
  final ApiService apiService;
  AuthDataSourceImp(this.apiService);

  @override
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    var data = await apiService.post(endPoint: AppLinks.login, data: {
      "users_email": email,
      "users_password": password,
    });
    return data;
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
    return data;
  }
}