import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FruitOverhead with ChangeNotifier{

  Dio dio = new Dio();
  bool _hasData = false;
  bool get hasData => _hasData;

  String _description = '';
  String get description => _description;

  // List<dynamic> _recommenddata  = [];
  // List<dynamic> get recommenddata => _recommenddata;
  // List<dynamic> _saledata  = [];
  // List<dynamic> get saledata => _saledata;
  Future retrieveOverheadData(String id) async{
    Response response;
    response = await dio.get('http://192.168.254.8:3000/edible/overhead?id='+id);
    // if(response.statusCode == 200) {
    //   _description = response.data[0]['description'];
      // print(response.data[0]['description']);
      return response.data[0];

      // print(response.data[0]['nutrition'].runtimeType);
    // }
  }
}