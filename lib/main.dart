import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: AnimatedSplashScreen(
        backgroundColor: const Color(0xFFE0E0E0),
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        splashTransition: SplashTransition.slideTransition,
        animationDuration: const Duration(seconds: 3),
        splash: Container(
          child: Column(
            children: [
              Image.asset(
                'assets/calculator.png',
                width: 60,
                height: 60,
              ),
            ],
          ),
        ),
        nextScreen: const HomeScreen(),
      ),
    );
  }
}
