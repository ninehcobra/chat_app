import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/common/widgets/custom_button.dart';
import 'package:chat_app/src/core/configs/assets/images.dart';
import 'package:chat_app/src/core/util/appwrite.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  String countryCode = "+1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: Image.asset(AppImages.logo)),
                      const Text(
                        'Mimi',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Text(
                      'Hi! welcome to Mimi',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text("Create your account"),
                  const SizedBox(
                    height: 48,
                  ),
                  const Text(
                    "Enter your phone number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F2F4),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: CountryCodePicker(
                            initialSelection: "us",
                            onChanged: (value) {
                              print(value.dialCode);
                              countryCode = value.dialCode!;
                            },
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF1F2F4),
                              hintText: "Enter your phone number",
                              hintStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                      "Securing your personal information is our priority"),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CustomButton(
                  onPressed: () {
                    createPhoneSession(
                            phone: "$countryCode${_phoneNumberController.text}")
                        .then((value) async {
                      if (value != "login_error") {
                        await Navigator.pushNamed(context, RouterConstants.otp,
                            arguments: {
                              'phoneNumber': _phoneNumberController.text,
                              'userId': value
                            });
                      } else {
                        toastification.show(
                          type: ToastificationType.error,
                          context:
                              context, // optional if you use ToastificationWrapper
                          title: const Text('Login fail'),
                          autoCloseDuration: const Duration(seconds: 5),
                        );
                      }
                    });
                  },
                  title: "Next",
                  backgroundColor: const Color(0xFF6468F6),
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
