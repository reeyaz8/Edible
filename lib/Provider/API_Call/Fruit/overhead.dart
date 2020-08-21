import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FruitOverhead with ChangeNotifier{

  Dio dio = new Dio();

  bool _hasData = false;
  bool get hasData => _hasData;

  String _description = '';
  String get description => _description;

  Map<String, dynamic> _nutrition;
  Map<String, dynamic> get nutrition => _nutrition;

  
  retrieveOverheadData(String id) async{
    _hasData =false;
    _description = '';
    _nutrition = {};
    Response response;

    response = await dio.get('http://192.168.1.136:3000/edible/fruit/overhead?id='+id);
    
    _description = response.data[0]['description'];

    _nutrition = response.data[0]['nutrition'];

    _hasData = true;

    notifyListeners();

  }
}