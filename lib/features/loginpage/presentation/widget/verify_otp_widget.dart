

import 'package:flutter/material.dart';
import 'package:web_firebase/features/loginpage/presentation/controller/login_controller.dart';

class VerifyOTPWidget extends StatefulWidget {
  final LoginController controller;
  const VerifyOTPWidget({super.key,required this.controller});

  @override
  State<VerifyOTPWidget> createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends State<VerifyOTPWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
              controller: widget.controller.txtOTP,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.controller.verifyOTP();
                },
                child: const Text('Verify'))
      ],
    );
  }
}