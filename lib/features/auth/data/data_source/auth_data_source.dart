import '../../../../core/services/api_services.dart';
import '../models/user_model.dart';

abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> signUp(String username, String email, String password);
}

class AuthDataSourceImp extends AuthDataSource {
  final ApiService apiService;
  AuthDataSourceImp(this.apiService);

  @override
  Future<User> login(String email, String password) async {
    // Implement your login API call here
  }

  @override
  Future<User> signUp(String username, String email, String password) async {
    return User();
  }
}
