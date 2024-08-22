import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/core/configs/router/router.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ToastificationWrapper(
      child: MaterialApp(
        title: "Chat App",
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRouter,
        initialRoute: RouterConstants.onboarding,
      ),
    );
  }
}
