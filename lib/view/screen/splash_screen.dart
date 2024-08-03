import 'package:flutter/material.dart';
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
    // TODO: implement initState
    super.initState();
    _navigateToHomeScreen();

  }

  _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 5)); // Adjust duration as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CustomIntroScreenApp()), // Replace with your home screen widget
    );
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
              Expanded(child: SizedBox()),

              Image.network('https://cdn-icons-png.freepik.com/512/9584/9584563.png',height:100,width: 100,),
              SizedBox(
                height: 15,
              ),
              Text('Kanban Board',style: pRegular15,),
          Expanded(child: SizedBox()),
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
