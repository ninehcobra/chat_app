import 'package:chat_app/src/common/widgets/custom_button.dart';
import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: const Text(
                      "Mimi",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Image.asset(AppImages.background),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: const Text(
                        "Let's start the chat",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: const Text(
                        "Connect with friends and family securely and private. Enjoy the best chatting experience.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16, top: 8),
                      child: const CustomButton(
                        title: "Get Started",
                        backgroundColor: Color(0xFF6468F6),
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ]));
  }
}
