
import 'package:web_firebase/core/error/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

abstract class LoginDatasource
{
  Future<dynamic> submitPhoneNumber({required String phoneNumber});
  Future<dynamic> verifyOTP({required String OTP});
}

class LoginDatasourceImpl implements LoginDatasource
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ConfirmationResult? _result;
  @override
  Future submitPhoneNumber({required String phoneNumber}) async{
    try
    {
      
       _result = await _auth.signInWithPhoneNumber(phoneNumber);
      return _result?.verificationId;
    }
    catch (e)
    {
      throw ServerException(exception: e.toString());
    }

  }

  @override
  Future verifyOTP({required String OTP}) async{
     try
    {
      _result?.confirm(OTP)
      .then((userCredential) {
        if(userCredential.user==null)
        {
          throw const ServerException(exception: 'wrong otp');
        }
        return userCredential.additionalUserInfo?.username ?? '';
      })
      .onError((error, stackTrace) {
        throw ServerException(exception: error?.toString() ?? 'Something went wrong...');
      });
    }
    catch (e)
    {
      throw ServerException(exception: e.toString());
    }
  }

}