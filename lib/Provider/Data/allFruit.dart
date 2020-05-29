import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AllFruitData with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List _newList = [];
  List get newList => _newList;

  Dio dio = new Dio();

  getPartialFruitData(String skip, String limit) async {
    Response response;

    response = await dio.get('http://192.168.254.8:3000/edible/allItem?databaseName=Fruit&collectionName=allFruit&skip='+skip+'&limit='+limit);
    
    if(response.statusCode == 200){
      List collection = response.data;

    _newList.add(collection);

    _isLoading = true;

    notifyListeners();
    }

  }
}