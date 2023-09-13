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
}
