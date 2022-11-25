import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/nahida.jpeg',
        width: 300,
        fit: BoxFit.cover,
      ),
      nextScreen: Navigation(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Color.fromARGB(220, 255, 255, 255),
      duration: 5000,
    );
  }
}
