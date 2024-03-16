part of 'login_bloc.dart';


sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props=> [];
}

class SubmitPhoneNumberWidgetShowEvent extends LoginEvent
{
  @override
  List<Object> get props=> [];
}

class SubmitPhoneNumberEvent extends LoginEvent
{
  final String phoneNumber;

  SubmitPhoneNumberEvent({required this.phoneNumber});

  @override
  List<Object> get props=> [phoneNumber];
}


class VerifyOTPEvent extends LoginEvent
{
  final String otp;

  VerifyOTPEvent({required this.otp});

  @override
  List<Object> get props=> [otp];
}

