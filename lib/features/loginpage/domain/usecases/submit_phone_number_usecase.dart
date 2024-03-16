import 'package:dartz/dartz.dart';
import 'package:web_firebase/core/error/failures.dart';
import 'package:web_firebase/features/loginpage/domain/repository/login_repository.dart';

abstract class SubmitPhoneNumberUsecase
{
  Future<Either<Failure,dynamic>> execute({required String phoneNumber});
}

class SubmitPhoneNumberUsecaseImpl implements SubmitPhoneNumberUsecase
{
  final LoginRepository repository;

  SubmitPhoneNumberUsecaseImpl({required this.repository});

  @override
  Future<Either<Failure, dynamic>> execute({required String phoneNumber}) async => repository.submitPhoneNumber(phoneNumber: phoneNumber);

}