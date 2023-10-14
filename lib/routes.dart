import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/view/screen/address/add_map_address.dart';
import 'package:e_commerce_app/view/screen/address/view_address.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/check_email_forget_password.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:e_commerce_app/view/screen/home/home_screen.dart';
import 'package:e_commerce_app/view/screen/favorite/my_favorite.dart';
import 'package:e_commerce_app/view/screen/auth/onboarding/onboarding.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/reset_password.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/verify_code_sign_up_email.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/sign_up.dart';
import 'package:e_commerce_app/view/screen/auth/sign_up/success_check_email_sign_up.dart';
import 'package:e_commerce_app/view/screen/auth/forget_password/verify_code_forget_password.dart';

import 'package:get/get.dart';

import 'core/middleware/my_middleware.dart';
import 'view/screen/address/add_details_address.dart';
import 'view/screen/address/edit_address.dart';
import 'view/screen/auth/language.dart';
import 'view/screen/cart/cart.dart';
import 'view/screen/items/items.dart';
import 'view/screen/items/product_details.dart';
import 'view/screen/setting/setting_home.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoute.language,
    page: () => const AppLanguage(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: '/', page: () => const CartScreen()),
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
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.settingScreen, page: () => const SettingScreen()),
  GetPage(name: AppRoute.cartScreen, page: () => const CartScreen()),
  //*================ address ======================
  GetPage(name: AppRoute.addMapAddress, page: () => const AddMapAddress()),
  GetPage(
      name: AppRoute.addDetailsAddress, page: () => const AddDetailsAddress()),
  GetPage(name: AppRoute.viewAddress, page: () => const ViewAddress()),
  GetPage(name: AppRoute.editAddress, page: () => const EditAddress()),
];
