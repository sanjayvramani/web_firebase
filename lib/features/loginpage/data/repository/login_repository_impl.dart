import 'package:dartz/dartz.dart';
import 'package:web_firebase/core/error/exceptions.dart';
import 'package:web_firebase/core/error/failures.dart';
import 'package:web_firebase/features/loginpage/data/datasource/login_datasource.dart';
import 'package:web_firebase/features/loginpage/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository
{
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  
  @override
  Future<Either<Failure, dynamic>> submitPhoneNumber({required String phoneNumber}) async{
    try
    {
      var result = await datasource.submitPhoneNumber(phoneNumber: phoneNumber);
      return Right(result);
    }
    on ServerException catch(e)
    {
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> verifyOTP({required String otp}) async{
    try
    {
      var result = await datasource.verifyOTP(OTP: otp);
      return Right(result);
    }
    on ServerException catch(e)
    {
      return Left(ServerFailure(error: e.toString()));
    }
  }

}