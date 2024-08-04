import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/languages.dart';
import 'package:todo_project/view/screen/splash_screen.dart';

Rx<Color> appColor = Colors.blue.obs;

void main() {
  runApp(
    GetMaterialApp(
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      locale: Locale('en'),
      fallbackLocale: Locale('en'),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
      ],
    ),
  );
}
