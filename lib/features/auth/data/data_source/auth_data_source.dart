abstract class AuthDataSource {
  Future<dynamic> login({required String email, required String password});
  Future<dynamic> verifyCodeSignUp(
      {required String email, required int verifyCode});
  Future<dynamic> signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  });
}

