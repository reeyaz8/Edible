import 'package:Edible/Screens/blankScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Login with ChangeNotifier{
  Dio dio = new Dio();

  bool _isLogging = false;
  bool get isLogging => _isLogging;

  login(context, phone,password) async {
    _isLogging = true;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Response response;
    response = await dio.post('http://192.168.1.136:3000/edible/login/', data: {
        "phone":phone,
        "password":password,
    });
       if(response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankScreen()));
      preferences.setString('phone', phone);
      preferences.setString('name', response.data['name']);
      if(response.data['gender'] == '0'){
        preferences.setString('gender', 'Male');
      }else if(response.data['gender'] == '1'){
        preferences.setString('gender', 'Female');
      }else{
        preferences.setString('gender', 'Other');
      }
      
      }else{
        Toast.show('Invalid Username and Password', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        _isLogging = false;
        notifyListeners();
      }
    }
}