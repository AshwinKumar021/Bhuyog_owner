import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/auth/login_screen.dart';
import 'package:changin/view/screens/home/home_screen.dart';
import 'package:changin/view/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.colors.scaffold,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => OnBoardingPage());
            },
            child: Icon(Icons.arrow_forward_rounded)),
      ),
    );
  }
}
