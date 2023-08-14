import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/data/model/onboardingmodel.dart';
import 'package:get/get.dart';

List<OnBoardingModel> listOnBoarding = [
  OnBoardingModel(
      title: AppLang.chooseProduct.tr,
      image: AppImageAssets.onBoardingImageOne,
      body: AppLang.textHaveProduct.tr),
  OnBoardingModel(
      title: AppLang.easyAndSafePayment.tr,
      image: AppImageAssets.onBoardingImageTwo,
      body: AppLang.canPayCash.tr),
  OnBoardingModel(
      title: AppLang.trackOrder.tr,
      image: AppImageAssets.onBoardingImageThree,
      body: AppLang.orderTrackStage.tr),
];
