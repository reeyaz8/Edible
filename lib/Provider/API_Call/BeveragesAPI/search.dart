import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BeverageSearch with ChangeNotifier{

  Dio dio = new Dio();

  bool _hasData = true;
  bool get hasData => _hasData;

  bool _startSearch = false;
  bool get startSearch => _startSearch;

  List _searchData = [];
  List get  searchData => _searchData;

  retrieveSearchItem (String searchName) async {
    _startSearch = true;
    _searchData = [];
    notifyListeners();

    Response response;

    response = await dio.get('http://192.168.254.8:3000/edible/beverages/search?searchq='+searchName);
    
    _searchData.addAll(response.data);

    response = await dio.get('http://192.168.254.8:3000/edible/beverageshard/search?searchq='+searchName);
    
    _searchData.addAll(response.data);

    _startSearch = false;

    if (_searchData.length == 0){
      _hasData = false;
    }

    notifyListeners();
  }
}