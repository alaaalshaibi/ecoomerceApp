class AppLink {
  static const serverLink = "https://3la2alshaibe.com/ecommerce";
  static const test = "$serverLink/test.php";

  //* ================== Auth ===========
  static const signUp = "$serverLink/auth/sign_up.php";
  static const verifyCode = "$serverLink/auth/verify_code.php";
  static const login = "$serverLink/auth/login.php";
  //* ================== ForGet Password ===========

  static const checkEmail = "$serverLink/auth/forget_password/check_email.php";
  static const resetPassword =
      "$serverLink/auth/forget_password/reset_password.php";
  static const verifyCodeForGet =
      "$serverLink/auth/forget_password/verify_code_forget.php";
}
