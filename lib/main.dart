import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/core/controller/theme_controller.dart';

import 'package:todo_project/view/screen/splash_screen.dart';

void main() {
  final ThemeController themeController = Get.put(ThemeController());

  runApp(
    Obx(
      () {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: generateMaterialColor(themeController.selectedColor.value),
          ),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(
              name: '/',
              page: () => SplashScreen(),
            ),
          ],
        );
      }
    ),
  );
}
