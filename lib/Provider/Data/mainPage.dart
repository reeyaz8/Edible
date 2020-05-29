import 'dart:convert';
import 'package:Edible/Provider/Data/ImageRetriever.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class FruitRecommendation with ChangeNotifier{

  Dio dio = new Dio();
  bool _hasData = false;
  List<dynamic> _recommenddata  = [];
  List<dynamic> get recommenddata => _recommenddata;
  List<dynamic> _saledata  = [];
  List<dynamic> get saledata => _saledata;
  bool get hasData => _hasData;
  retrieveRecommendationData() async{
    Response response;
    response = await dio.get('http://192.168.254.8:3000/edible/mainItem?databaseName=Fruit');
    if(response.statusCode == 200) {
      Map<String, dynamic> collection = json.decode(response.data);

      _recommenddata = collection["recommend"];
      _saledata = collection["hotsale"];
      for (var i = 0; i < collection['recommend'].length; i++) {
          await  ImageRetriver().getImagewithID(collection['recommend'][i]['_id'], 'Fruits');
      }
      for (var i = 0; i < collection['hotsale'].length; i++) {
          await  ImageRetriver().getImagewithID(collection['hotsale'][i]['_id'], 'Fruits');
      }
    }
    _hasData = true;
    notifyListeners();
  }
}