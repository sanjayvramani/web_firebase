import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver
{
  const AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }


}