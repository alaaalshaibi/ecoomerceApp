import 'package:e_commerce_app/bindings/init_bindings.dart';
import 'package:e_commerce_app/core/localization/change_locale.dart';
import 'package:e_commerce_app/core/localization/translations.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslations(),
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: controller.appTheme,
      initialBinding: InitBindings(),
      //initialRoute: '/',
      // home: AppLanguage(),
      getPages: routes,
    );
  }
}
