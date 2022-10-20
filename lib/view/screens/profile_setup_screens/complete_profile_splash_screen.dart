import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:pixel/view/screens/home_screen/home_screen.dart';

class CompleteProfileSplashScreen extends StatelessWidget {
  const CompleteProfileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 224, 242, 241),
      splash: Icon(
        Icons.verified,
        color: Colors.green,
        size: size.height * 0.15,
      ),
      splashTransition: SplashTransition.scaleTransition,
      nextScreen: const HomeScreen(),
    );
  }
}
