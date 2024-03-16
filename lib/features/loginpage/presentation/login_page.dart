import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_firebase/features/loginpage/presentation/bloc/login_bloc.dart';
import 'package:web_firebase/features/loginpage/presentation/controller/login_controller.dart';
import 'package:web_firebase/features/loginpage/presentation/widget/submit_phone_number_widget.dart';
import 'package:web_firebase/features/loginpage/presentation/widget/verify_otp_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc,LoginState>(
          buildWhen: (previous, current) => current is SubmitMobileNumberInitState || current is VerifyOTPInitState ,
          builder: (context,state) {
            if(state is SubmitMobileNumberScreenState) {
              return SubmitPhoneNumberWidget(controller: _controller);
            }
            
            return VerifyOTPWidget(controller: _controller);
          }  ,
        listenWhen: (previous, current) => current is SubmitMobileNumberFailureState || current is SubmitMobileNumberSuccessState ||
        current is VerifyOTPFailureState || current is VerifyOTPSuccessState ,
        listener: (context,state){

        },),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
