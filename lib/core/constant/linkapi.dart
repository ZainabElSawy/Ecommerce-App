abstract class AppLinks {
  /*
    Open the command prompt (cmd).
    Type ipconfig and press Enter.
    Look for the IPv4 Address under the network adapter (e.g., 192.168.x.x or 10.0.x.x).
  */
  static const String serverPhone = "http://192.168.1.3/ecommerce";
  static const String imagesStatic = "http://192.168.1.3/ecommerce/upload";
  static const String serverPC = "http://10.0.2.2/ecommerce";
  static const String imagesStaticPC = "http://10.0.2.2/ecommerce/upload";
  //====================== Images ======================
  static String imagesCategories = "$imagesStatic/categories";
  static String imagesItems = "$imagesStatic/items";
  //====================================================

  //======================= Auth =======================
  static const String signUp = "$serverPhone/auth/signup.php";
  static const String verifyCodeSignUp = "$serverPhone/auth/verifycode.php";
  static const String login = "$serverPhone/auth/login.php";
  static const String resendOTP = "$serverPhone/auth/resend.php";
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
  static const String removeFromFavorite =
      "$serverPhone/favorite/deletefromfavorite.php";
  //====================================================

  //======================= Cart =======================
  static const String cartAdd = "$serverPhone/cart/add.php";
  static const String cartDelete = "$serverPhone/cart/delete.php";
  static const String cartItemsCount = "$serverPhone/cart/getcountitems.php";
  static const String cartView = "$serverPhone/cart/view.php";
  //====================================================

  //======================= Address =======================
  static const String addressView = "$serverPhone/address/view.php";
  static const String addressAdd = "$serverPhone/address/add.php";
  static const String addressEdit = "$serverPhone/address/edit.php";
  static const String addressDelete = "$serverPhone/address/delete.php";
  //====================================================

  //======================= Coupon =======================
  static const String checkcoupon = "$serverPhone/coupon/checkcoupon.php";
  //====================================================
}
