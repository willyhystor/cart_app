import 'package:cart_app/translations/en_US.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
      };
}
