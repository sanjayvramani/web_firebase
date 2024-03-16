part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props=> [];
}

class LoginInitial extends LoginState {}

class SubmitMobileNumberScreenState extends LoginState
{

  const SubmitMobileNumberScreenState();

  @override
  List<Object> get props=> [];
}

class SubmitMobileNumberInitState extends LoginState
{
  const SubmitMobileNumberInitState();

  @override
  List<Object> get props=> [];
}

class SubmitMobileNumberSuccessState extends LoginState
{
  final dynamic data;

  const SubmitMobileNumberSuccessState({required this.data});

  @override
  List<Object> get props=> [data];
}

class SubmitMobileNumberFailureState extends LoginState
{
  final dynamic error;

  const SubmitMobileNumberFailureState({required this.error});

  @override
  List<Object> get props=> [error];
}

class VerifyOTPScreenState extends LoginState
{

  const VerifyOTPScreenState();

  @override
  List<Object> get props=> [];
}

class VerifyOTPInitState extends LoginState
{
  const VerifyOTPInitState();
  @override
  List<Object> get props=> [];
}

class VerifyOTPSuccessState extends LoginState
{
  final dynamic data;

  const VerifyOTPSuccessState({required this.data});

  @override
  List<Object> get props=> [data];
}

class VerifyOTPFailureState extends LoginState
{
  final dynamic error;

  const VerifyOTPFailureState({required this.error});

  @override
  List<Object> get props=> [error];
}