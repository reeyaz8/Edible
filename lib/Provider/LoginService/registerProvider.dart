import 'package:flutter/cupertino.dart';

class RegisterProvider with ChangeNotifier{

  int _selectedGender;
  int get selectedGender => _selectedGender;

  bool _hasgenderselected = false;
  bool get hasgenderselected => _hasgenderselected;

  bool _conditionaccepted = false;
  bool get conditionaccepted => _conditionaccepted;

  bool _isMobileInvalid;
  bool get isMobileInvalid => _isMobileInvalid;

  bool _invalidFullName;
  bool get invalidFullName => _invalidFullName;

  bool _isOtpValid;
  bool get isOtpValid => _isOtpValid;

  bool _ispasswordValid;
  bool get ispasswordValid => _ispasswordValid;

  bool _isconfirmpasswordValid;
  bool get isconfirmpasswordValid => _isconfirmpasswordValid; 


  changeGender(int _selectedGenderValue){
    _selectedGender = _selectedGenderValue;
    _hasgenderselected = true;
    notifyListeners();
  }

  changeConditionStatus(bool status){
    _conditionaccepted = status;
    notifyListeners();
  }

  getFullName(String name){
    if(name.length == 0 || name.contains(new RegExp(r'[0-9]'))){
      _invalidFullName = true;
      notifyListeners();
    }
    else{
      _invalidFullName = false;
      notifyListeners();
    }
  }

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

  getOTP(String otp){
    if(otp.length == 6){
      _isOtpValid = true;
      notifyListeners();
    }
    else{
      _isOtpValid = false;
      notifyListeners();
    }
  }

  getUpdatedPassword(String password){
    if(password.length < 4){
      _ispasswordValid = false;
      notifyListeners();
    }
    else{
      _ispasswordValid = true;
      notifyListeners();
    }
  }

  getConfirmPassword(String newpass, String confirmpass){
    if(newpass != confirmpass){
      _isconfirmpasswordValid = false;
      notifyListeners();
    }
    else{
      _isconfirmpasswordValid = true;
      notifyListeners();
    }
  }
}