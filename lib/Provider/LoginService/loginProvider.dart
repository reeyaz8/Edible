import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{

  bool _isMobileInvalid;
  bool get isMobileInvalid => _isMobileInvalid;

  bool _isPasswordInvalid;
  bool get isPasswordInvalid => _isPasswordInvalid;

  String _mobile = '';
  String get mobile => _mobile;

  String _pass = '';
  String get password => _pass;


  getMobileNumber(String updatedMobile){
    if (updatedMobile.length != 10){
      _isMobileInvalid = true;
      notifyListeners();
    }
    else{
      _isMobileInvalid = false;
      _mobile = updatedMobile;
      notifyListeners();
    }
  }

  getPassword(String updatedPassword){
    if(updatedPassword.length < 4){
      _isPasswordInvalid = true;
      notifyListeners();
    }
    else{
      _isPasswordInvalid = false;
      _pass = updatedPassword;
      notifyListeners();
    }
  }
}