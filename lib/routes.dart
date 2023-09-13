import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/middleware/my_middleware.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/check_email_forget_password.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/language.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:e_commerce_app/view/screen/home_screen.dart';
import 'package:e_commerce_app/view/screen/onboarding.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/verify_code_sign_up_email.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/sign_up.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/success_check_email_sign_up.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/verify_code_forget_password.dart';

import 'package:get/get.dart';

import 'view/screen/items.dart';
import 'view/screen/product_details.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const AppLanguage(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: '/', page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verifyCodeForgetPassword,
      page: () => const VerifyCodeForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successCheckEmailSignUp,
      page: () => const SuccessCheckEmailSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessRestPassword()),
  GetPage(name: AppRoute.items, page: () => const ItemsScreen()),
  GetPage(
      name: AppRoute.productDetailsScreen,
      page: () => const ProductDetailsScreen()),
];
