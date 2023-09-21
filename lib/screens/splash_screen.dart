import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';
import 'package:page_transition/page_transition.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: Duration.millisecondsPerSecond,
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: Colors.white,
      splashIconSize: 805,
      splash: Image.asset("assets/images/splash.png"),
      nextScreen: HomeScreen(),
    );
  }
}
