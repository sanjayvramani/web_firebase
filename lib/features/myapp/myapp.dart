
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_firebase/features/loginpage/presentation/bloc/login_bloc.dart';
import 'package:web_firebase/features/loginpage/presentation/login_page.dart';
import 'package:web_firebase/services/navigator_service.dart';

import '../../services/locator_service.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider<LoginBloc>(create: (context)=>LoginBloc())],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      navigatorKey: locator<NavigatorService>().navigatorKey,
    ));

  }
}
