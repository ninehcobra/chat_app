import 'dart:async';

import 'package:chat_app/src/common/constants/router.dart';
import 'package:chat_app/src/common/widgets/custom_button.dart';
import 'package:chat_app/src/core/util/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String userId;
  const OtpScreen({super.key, required this.phoneNumber, required this.userId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _pin1FocusNode = FocusNode();
  final FocusNode _confirmButtonFocusNode = FocusNode();

  late final _pin1 = TextEditingController();
  late final _pin2 = TextEditingController();
  late final _pin3 = TextEditingController();
  late final _pin4 = TextEditingController();

  // ignore: unused_field
  Timer? _timer;
  int _secondsRemaining = 120; // 2 minutes

  @override
  void initState() {
    super.initState();
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_pin1FocusNode);
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void _onSuccessTyping() {
    if (_pin1.text.isNotEmpty &&
        _pin2.text.isNotEmpty &&
        _pin3.text.isNotEmpty &&
        _pin4.text.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_confirmButtonFocusNode);
      });
    }
  }

  void _onSubmit() {
    if (_pin1.text.isNotEmpty &&
        _pin2.text.isNotEmpty &&
        _pin3.text.isNotEmpty &&
        _pin4.text.isNotEmpty) {
      loginWithOtp(
              otp: (_pin1.text + _pin2.text + _pin3.text + _pin4.text),
              userId: widget.userId)
          .then((value) {
        if (value) {
          Navigator.pushNamedAndRemoveUntil(
              context, RouterConstants.chat, (route) => false);
        } else {
          toastification.show(
            type: ToastificationType.error,
            context: context, // optional if you use ToastificationWrapper
            title: const Text('Invalid OTP'),
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
      });
    } else {
      toastification.show(
        type: ToastificationType.error,
        context: context, // optional if you use ToastificationWrapper
        title: const Text('Please enter all OTP'),
        autoCloseDuration: const Duration(seconds: 5),
      );
    }
  }

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
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 4),
                  child: const Center(
                    child: Text(
                      "Verify Phone Number",
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Code has been sent to +84 ${widget.phoneNumber}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 84,
                        width: 84,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          controller: _pin1,
                          focusNode: _pin1FocusNode,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF6468F6),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 84,
                        width: 84,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          controller: _pin2,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF6468F6),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 84,
                        width: 84,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          controller: _pin3,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF6468F6),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 84,
                        width: 84,
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          controller: _pin4,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: InputDecoration(
                            fillColor: const Color(0xFF6468F6),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _secondsRemaining == 0
                    ? const Center(
                        child: Text(
                          "Didn't get OTP Code ?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Resend code after ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: const Color(0xFF6468F6)),
                          )
                        ],
                      ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      _secondsRemaining == 0
                          ? () {
                              setState(() {
                                _secondsRemaining = 120;
                              });
                              startTimer();
                            }
                          : null;
                    },
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _secondsRemaining == 0
                            ? const Color(0xFF6468F6)
                            : Colors.grey,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: CustomButton(
                onPressed: () {
                  _onSubmit();
                },
                title: "Verify",
                backgroundColor: const Color(0xFF6468F6),
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
