import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_firebase/features/loginpage/presentation/bloc/login_bloc.dart';
import 'package:web_firebase/services/navigator_service.dart';

import '../../../../services/locator_service.dart';

abstract class ILoginController
{
  void dispose();
  void submitPhoneNumber();
  void verifyOTP();
}

class LoginController implements ILoginController
{
  final TextEditingController txtPhoneNumber = TextEditingController();
  final TextEditingController txtOTP = TextEditingController();
  final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  void dispose() {
    txtPhoneNumber.dispose();
    txtOTP.dispose();
  }

  @override
  void submitPhoneNumber() {
    _navigatorService.navigatorKey.currentContext?.read<LoginBloc>().add(SubmitPhoneNumberEvent(phoneNumber: txtPhoneNumber.text));
  }

  @override
  void verifyOTP() {
    _navigatorService.navigatorKey.currentContext?.read<LoginBloc>().add(VerifyOTPEvent(otp: txtOTP.text));
  }

  void showSubmitPhoneNumber()
  {
    _navigatorService.navigatorKey.currentContext?.read<LoginBloc>().add(SubmitPhoneNumberWidgetShowEvent());
  }

}