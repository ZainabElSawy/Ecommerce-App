abstract class AppLinks {
  static const String serverPhone = "http://10.0.2.2/ecommerce";
  static const String imagesStatic = "http://10.0.2.2/ecommerce/upload";
  //====================== Images ======================
  static String imagesCategories = "$imagesStatic/categories";
  static String imagesItems = "$imagesStatic/items";
  //====================================================
  //======================= Auth =======================
  static const String signUp = "$serverPhone/auth/signup.php";
  static const String verifyCodeSignUp = "$serverPhone/auth/verifycode.php";
  static const String login = "$serverPhone/auth/login.php";
  //====================================================

  //================= ForgetPassword ===================
  static const String checkEmail =
      "$serverPhone/forget_password/check_email.php";
  static const String verifyCodeForgetPass =
      "$serverPhone/forget_password/verify_code.php";
  static const String resetPass =
      "$serverPhone/forget_password/reset_password.php";
  //====================================================

  //======================= Home =======================
  static const String home = "$serverPhone/home.php";
  //====================================================
}
