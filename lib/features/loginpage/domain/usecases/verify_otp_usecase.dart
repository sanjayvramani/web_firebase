import 'package:dartz/dartz.dart';
import 'package:web_firebase/core/error/failures.dart';
import 'package:web_firebase/features/loginpage/domain/repository/login_repository.dart';

abstract class VerifyOTPUsecase
{
  Future<Either<Failure,dynamic>> execute({required String otp});
}

class VerifyOTPUsecaseImpl implements VerifyOTPUsecase
{
  final LoginRepository repository;

  VerifyOTPUsecaseImpl(this.repository);
  @override
  Future<Either<Failure, dynamic>> execute({required String otp}) async => repository.verifyOTP(otp: otp);

}