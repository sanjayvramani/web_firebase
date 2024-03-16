import 'package:dartz/dartz.dart';
import 'package:web_firebase/core/error/failures.dart';

abstract class LoginRepository
{
  Future<Either<Failure,dynamic>> submitPhoneNumber({required String phoneNumber});
  Future<Either<Failure,dynamic>> verifyOTP({required String otp});
}