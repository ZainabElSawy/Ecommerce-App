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
  static const String resendOTP ="$serverPhone/auth/resend.php";
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

  //======================= Items =======================
  static const String items = "$serverPhone/items/items.php";
  static const String search = "$serverPhone/items/search.php";
  //====================================================

  //======================= Favorite =======================
  static const String favoriteAdd = "$serverPhone/favorite/add.php";
  static const String favoriteRemove = "$serverPhone/favorite/remove.php";
  static const String myFavorite = "$serverPhone/favorite/favorite.php";
  static const String removeFromFavorite = "$serverPhone/favorite/deletefromfavorite.php";
  //====================================================

  //======================= Cart =======================
  static const String cartAdd = "$serverPhone/cart/add.php";
  static const String cartDelete = "$serverPhone/cart/delete.php";
  static const String cartItemsCount = "$serverPhone/cart/getcountitems.php";
  static const String cartView = "$serverPhone/cart/view.php";
  //====================================================
}
