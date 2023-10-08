class AppLink {
  static const String serverLink = "https://3la2alshaibe.com/3la2/ecommerce";

  static const String imageStatic = "$serverLink/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String test = "$serverLink/test.php";

  //* ================== Auth ===========
  static const String signUp = "$serverLink/auth/sign_up.php";
  static const String verifyCode = "$serverLink/auth/verify_code.php";
  static const String login = "$serverLink/auth/login.php";
  static const String resendVerifyCode = "$serverLink/auth/reset_code.php";
  //* ================== ForGet Password ===========

  static const String checkEmail =
      "$serverLink/auth/forget_password/check_email.php";
  static const String resetPassword =
      "$serverLink/auth/forget_password/reset_password.php";
  static const String verifyCodeForGet =
      "$serverLink/auth/forget_password/verify_code_forget.php";

  //* ================= Home ===================
  static const String home = "$serverLink/home.php";
  //* ================= items View ===================

  static const String itemsView = "$serverLink/items/view.php";

  //* ================= favorite ===================
  static const String addFavorite = "$serverLink/favorite/add.php";
  static const String removeFavorite = "$serverLink/favorite/remove.php";
  static const String viewFavorite = "$serverLink/favorite/view.php";
  static const String removeFromFavorite =
      "$serverLink/favorite/remove_favorite.php";
  //* ================= cart ===================
  static const String cartAdd = "$serverLink/cart/add.php";
  static const String cartRemove = "$serverLink/cart/remove.php";
  static const String cartView = "$serverLink/cart/view.php";
  static const String cartItemCount = "$serverLink/cart/get_count_cart.php";
}
