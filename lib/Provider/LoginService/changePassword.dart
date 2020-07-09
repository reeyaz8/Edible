import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class ChangePassword with ChangeNotifier{

  bool _currentPasswordValid;
  bool _confirmPasswordValid;
  bool _confirmnewPasswordValid;
  bool _passwordValidationChecked = false;

  bool get currentPasswordValid => _currentPasswordValid;
  bool get confirmPasswordValid => _confirmPasswordValid;
  bool get confirmnewPasswordValid => _confirmnewPasswordValid;
  bool get passwordValidationChecked => _passwordValidationChecked;

  bool _showCurrentPass = false;
  bool _showNewPass = false;
  bool _showConfirmPass = false;

  bool get showCurrentPass => _showCurrentPass;
  bool get showNewPass => _showNewPass;
  bool get showConfirmPass => _showConfirmPass;

  bool _hasPasswordChangeProcessComplete = false;

  bool get hasPasswordChangeProcessComplete => _hasPasswordChangeProcessComplete;

  validateCurrentPassword(String currentPassword){
    if(currentPassword.length < 4){
      _currentPasswordValid = false;
    }else{
      _currentPasswordValid = true;
    }
    notifyListeners();
  }

  validateNewPassword(String newPassword){
    if(newPassword.length < 4){
      _confirmPasswordValid = false;
    }else{
      _confirmPasswordValid = true;
    }
    notifyListeners();
  }

  validateConfirmPassword(String newPassword, String confirmPassword){
    if(confirmPassword != newPassword){
      _confirmnewPasswordValid = false;
    }else{
      _confirmnewPasswordValid = true;
    }
    notifyListeners();
  }

  void showOldPassText(){
    _showCurrentPass = !_showCurrentPass;
    notifyListeners();
  }
  void showNewPassText (){
    _showNewPass = !_showNewPass;
    notifyListeners();
  }
  void showConfirmPassText (){
    _showConfirmPass = !_showConfirmPass;
    notifyListeners();
  }

  Future<bool> changePasswordRequest(String phone ,String currentPassword, String confirmnewPassword)async{
    bool hasPasswordChanged = false;
    HttpClient client = HttpClient();

    Map<String, String> password = {
      "phone":phone,
      "oldpassword": currentPassword,
      "newpassword": confirmnewPassword,
    };
    HttpClientRequest request = await client.patchUrl(Uri.parse('http://192.168.254.8:3000/edible/changepassword'));
    request.headers.set('content-type', 'application/json');
    request.contentLength = -1;
    request.add(utf8.encode(json.encode(password)));


    HttpClientResponse response = await request.close();

    if(response.statusCode == 200){
     hasPasswordChanged = true;
    }
    return hasPasswordChanged;
  }
}