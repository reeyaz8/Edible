import 'package:Edible/Screens/blankScreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class UserEntryDB with ChangeNotifier{

  Dio dio = new Dio();

  sendDatatoDB(BuildContext context ,String name, String gender, String phone, String cCode, String password) async {
    Response response;

    response = await dio.post('http://192.168.254.8:3000/edible/register/', data: {
        "phone":phone,
        "name": name,
        "password":password,
        "c_code":cCode,
        "gender":gender
    });

    if(response.statusCode == 201){
      Navigator.push(context, MaterialPageRoute(builder: (context) => BlankScreen()));
    }

    if(response.statusCode == 403 || response.statusCode == 500){
      Toast.show('Error creating your account. Try Later', context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}