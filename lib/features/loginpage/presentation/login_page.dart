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
    _controller.showSubmitPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<LoginBloc,LoginState>(
          listener: (context, state) {
            if(state is SubmitMobileNumberFailureState)
            {
              print('Error');
              print(state.error);
            }
          },
          builder: (context,state) {
            if(state is SubmitMobileNumberSuccessState) {
              return VerifyOTPWidget(controller: _controller);
            }
            else if(state is SubmitMobileNumberFailureState) {
              return Text(state.error);
            }
            
            return SubmitPhoneNumberWidget(controller: _controller);
          }  ,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
