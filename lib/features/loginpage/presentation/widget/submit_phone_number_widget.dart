

import 'package:flutter/material.dart';
import 'package:web_firebase/features/loginpage/presentation/controller/login_controller.dart';

class SubmitPhoneNumberWidget extends StatefulWidget {
  final LoginController controller;
  const SubmitPhoneNumberWidget({super.key,required this.controller});

  @override
  State<SubmitPhoneNumberWidget> createState() => _SubmitPhoneNumberWidgetState();
}

class _SubmitPhoneNumberWidgetState extends State<SubmitPhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
                  controller: widget.controller.txtPhoneNumber,
                ),
                const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.controller.submitPhoneNumber();
                },
                child: const Text('Submit'))
      ],
    );
  }
}