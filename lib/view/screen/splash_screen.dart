import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_project/utils/text_style.dart';
import 'package:todo_project/view/screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  _navigateToHomeScreen()  {
     Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAll(() => CustomIntroScreenApp());
      },
    ); // Adjust duration as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Kanban Board',
                style: pRegular15,
              ),
              const Expanded(child: SizedBox()),
              Lottie.asset(
                'assets/animations/animation_file.json',
                height: 100,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
