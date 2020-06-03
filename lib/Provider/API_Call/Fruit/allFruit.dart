import 'package:Edible/Provider/Data/ImageRetriever.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AllFruitData with ChangeNotifier{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List _newList = [];
  List get newList => _newList;
  bool _changeLoadingState = false;
  bool get changeLoadingState => _changeLoadingState;

  Dio dio = new Dio();

  getPartialFruitData(String skip, String limit) async {
    _changeLoadingState = true;
    notifyListeners();

    Response response;

    response = await dio.get('http://192.168.254.8:3000/edible/allItem?databaseName=Fruit&collectionName=allFruit&skip='+skip+'&limit='+limit);
    
    if(response.statusCode == 200){
      List collection = response.data;
      
      _newList.addAll(collection);

      for (var i = 0; i < collection.length; i++) {
        await  ImageRetriver().getImagewithID(collection[i]['_id'], 'Fruits');
        }
      }
      _isLoading = true;

      _changeLoadingState = false;

      notifyListeners();
  }
}