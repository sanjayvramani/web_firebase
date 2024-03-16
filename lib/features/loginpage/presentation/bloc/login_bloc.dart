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
    
    on<SubmitPhoneNumberEvent>((event, emit) async{
      emit(const SubmitMobileNumberInitState());
      final  usecase = SubmitPhoneNumberUsecaseImpl(repository: repository);
      final result = await usecase.execute(phoneNumber: event.phoneNumber);
      
      result.fold((error) {
          emit(SubmitMobileNumberFailureState(error: error.props.first.toString()));
        }, (response) {
          emit(const SubmitMobileNumberSuccessState(data: 'success'));
        }); 
    });


    on<VerifyOTPEvent>((event, emit) async{
      emit(const VerifyOTPInitState());
      final usecase = VerifyOTPUsecaseImpl(repository);
      final result = await usecase.execute(otp: event.otp);
      
      result.fold((error){
          emit(VerifyOTPFailureState(error: error.props.first.toString()));
        }, 
        (response) {
          emit(VerifyOTPSuccessState(data: response));
      });
    });

  }
}
