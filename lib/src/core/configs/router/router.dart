import 'package:chat_app/src/presentation/auth/screens/onboarding.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static MaterialPageRoute generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
