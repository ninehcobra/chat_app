import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/presentation/auth/screens/check_user_session.dart';
import 'package:chat_app/src/presentation/auth/screens/login.dart';
import 'package:chat_app/src/presentation/auth/screens/onboarding.dart';
import 'package:chat_app/src/presentation/auth/screens/otp.dart';
import 'package:chat_app/src/presentation/chat/pages/chat.dart';
import 'package:chat_app/src/presentation/chat/pages/detail_chat.dart';
import 'package:chat_app/src/presentation/user/pages/profile.dart';
import 'package:chat_app/src/presentation/user/pages/search_user.dart';
import 'package:chat_app/src/presentation/user/pages/update_profile.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static MaterialPageRoute generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.root:
        return MaterialPageRoute(
            builder: (context) => const CheckUserSession());
      case RouterConstants.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouterConstants.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case RouterConstants.otp:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(
            phoneNumber: args['phoneNumber'],
            userId: args['userId'],
          ),
        );
      case RouterConstants.chat:
        return MaterialPageRoute(builder: (context) => const ChatScreen());
      case RouterConstants.detailChat:
        return MaterialPageRoute(
            builder: (context) => const DetailChatScreen());
      case RouterConstants.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RouterConstants.updateProfile:
        return MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen());
      case RouterConstants.search:
        return MaterialPageRoute(
            builder: (context) => const SearchUserScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
    }
  }
}
