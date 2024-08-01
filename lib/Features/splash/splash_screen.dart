import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../reels/presentation/views/reels_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/shopping_cart.png',
      splashIconSize: 90,
      nextScreen: const ReelsScreen(),
      backgroundColor: Colors.deepPurpleAccent,
      curve: Curves.bounceInOut,
      splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
