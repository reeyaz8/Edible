import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{

  bool _isMobileInvalid;
  bool get isMobileInvalid => _isMobileInvalid;

  bool _isPasswordInvalid;
  bool get isPasswordInvalid => _isPasswordInvalid;


  getMobileNumber(String updatedMobile){
    if (updatedMobile.length != 10){
      _isMobileInvalid = true;
      notifyListeners();
    }
    else{
      _isMobileInvalid = false;
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
      notifyListeners();
    }
  }
}