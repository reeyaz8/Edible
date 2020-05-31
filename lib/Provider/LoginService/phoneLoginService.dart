import 'package:Edible/Screens/registerScreens/passwordSetup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneSignClass with ChangeNotifier{
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static String _verificationId;
  var _authCredential;

  Future signInwithPhone(BuildContext context, String phonenumber) async {
    _auth.verifyPhoneNumber(
          phoneNumber: phonenumber, 
          timeout: Duration(seconds: 0), 
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationfailed, 
          codeSent: codeSent, 
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
}
  final PhoneVerificationCompleted verificationCompleted = (AuthCredential _authcredential){
            _auth.signInWithCredential(_authcredential).then((AuthResult result){
              if(result.user != null) {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordSetup()));
              }
              else{
                print('invalid otp');
              }
            }).catchError((error){
              print('failed authenticatuon');
            });
        };

  final PhoneVerificationFailed verificationfailed = (AuthException authException){
      if (authException.message.contains('not authorized')){
        print('You are not aithorized');
      }
      else if(authException.message.contains('Network')){
        print('Network Failure');
      }
      else{
        print(authException.message);
      }
      
  };

  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verId){
     _verificationId = verId;
  };

  final PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
    print(verificationId);
  };

  void signInwithPhoneNumber(BuildContext context ,String smsCode){
    _authCredential = PhoneAuthProvider.getCredential(verificationId: _verificationId, smsCode: smsCode);
    _auth.signInWithCredential(_authCredential).then((AuthResult result){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordSetup()));
    });
  }
}