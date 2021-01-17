import 'package:Edible/Screens/blankScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class UserEntryDB with ChangeNotifier{

  Dio dio = new Dio();

  sendDatatoDB(BuildContext context ,String name, String gender, String phone, String cCode, String password) async {
    Response response;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    response = await dio.post(baseURL +'/edible/register/', data: {
        "phone":phone,
        "name": name,
        "password":password,
        "c_code":cCode,
        "gender":gender
    });

    if(response.statusCode == 201){
      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankScreen()));
      preferences.setString('phone', phone);
      preferences.setString('name', name);
      if(gender == '0'){
        preferences.setString('gender', 'Male');
      }else if(gender == '1'){
        preferences.setString('gender', 'Female');
      }else{
        preferences.setString('gender', 'Other');
      }
    }

    if(response.statusCode == 403 || response.statusCode == 500){
      Toast.show('Error creating your account. Try Later', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}