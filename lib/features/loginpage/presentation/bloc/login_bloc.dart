import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_firebase/features/loginpage/data/datasource/login_datasource.dart';
import 'package:web_firebase/features/loginpage/data/repository/login_repository_impl.dart';
import 'package:web_firebase/features/loginpage/domain/repository/login_repository.dart';
import 'package:web_firebase/features/loginpage/domain/usecases/submit_phone_number_usecase.dart';
import 'package:web_firebase/features/loginpage/domain/usecases/verify_otp_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final LoginRepository repository = LoginRepositoryImpl(datasource: LoginDatasourceImpl());
    
    on<SubmitPhoneNumberWidgetShowEvent>((event, emit){
      emit(const SubmitMobileNumberScreenState());
    });
    
    on<SubmitPhoneNumberEvent>((event, emit) {
      emit(const SubmitMobileNumberInitState());
      final  usecase = SubmitPhoneNumberUsecaseImpl(repository: repository);
      usecase.execute(phoneNumber: event.phoneNumber)
      .then((result){
        result.fold((error) {
          emit(SubmitMobileNumberFailureState(error: error));
        }, (response) {
          emit(SubmitMobileNumberSuccessState(data: response));
          emit(const VerifyOTPScreenState());
        });
      });
    });


    on<VerifyOTPEvent>((event, emit) {
      emit(const VerifyOTPInitState());
      final usecase = VerifyOTPUsecaseImpl(repository);
      usecase.execute(otp: event.otp)
      .then((result){
        result.fold((error){
          emit(VerifyOTPFailureState(error: error));
        }, 
        (response) {
          emit(VerifyOTPSuccessState(data: response));
        });
      });
    });
  }
}
