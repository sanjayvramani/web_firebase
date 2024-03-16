import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:web_firebase/bloc_observer/app_bloc_observer.dart';
import 'package:web_firebase/config/app_config.dart';
import 'package:web_firebase/services/locator_service.dart';
import 'features/myapp/myapp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: AppConfig.firebaseOptions);
  setupLocator();
  Bloc.observer = const AppBlocObserver();
  runApp(const MyApp());
}
