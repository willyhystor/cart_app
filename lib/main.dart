import 'package:cart_app/routes/app_pages.dart';
import 'package:cart_app/translations/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: AppTranslation.locale,
      fallbackLocale: AppTranslation.fallbackLocale,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
