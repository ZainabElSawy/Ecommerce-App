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
  Future<dynamic> checkEmail({required String email});
  Future<dynamic> verifyCodeForgetPassword({
    required String email,
    required int verifyCode,
  });
  Future<dynamic> resetPassword({
    required String email,
    required String newPassword,
  });
  Future otpResend({required String userEmail});
}
