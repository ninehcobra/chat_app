import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/core/util/appwrite.dart';
import 'package:flutter/material.dart';

class CheckUserSession extends StatefulWidget {
  const CheckUserSession({super.key});

  @override
  State<CheckUserSession> createState() => _CheckUserSessionState();
}

class _CheckUserSessionState extends State<CheckUserSession> {
  @override
  void initState() {
    checkSessions().then((value) {
      if (value) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouterConstants.chat, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RouterConstants.onboarding, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
