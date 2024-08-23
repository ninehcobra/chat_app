import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/presentation/auth/screens/login.dart';
import 'package:chat_app/src/presentation/auth/screens/onboarding.dart';
import 'package:chat_app/src/presentation/auth/screens/otp.dart';
import 'package:chat_app/src/presentation/chat/pages/chat.dart';
import 'package:chat_app/src/presentation/chat/pages/detail_chat.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static MaterialPageRoute generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouterConstants.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case RouterConstants.otp:
        final phoneNumber = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (context) => OtpScreen(
                  phoneNumber: phoneNumber ?? '',
                ));
      case RouterConstants.chat:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      case RouterConstants.detailChat:
        return MaterialPageRoute(
            builder: (context) => const DetailChatScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
