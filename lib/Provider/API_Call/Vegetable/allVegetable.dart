import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AllVegetableData with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List _newList = [];
  List get newList => _newList;
  bool _changeLoadingState = false;
  bool get changeLoadingState => _changeLoadingState;

  Dio dio = new Dio();

  getPartialVegetableData(String skip, String limit) async {
    print('fkjvdfkbndfbnkbnkbnkgjbnkbn');
    _changeLoadingState = true;
    notifyListeners();

    Response response;

    response = await dio.get(
        'http://192.168.1.136:3000/edible/vegetable/allItem?skip=' +
            skip +
            '&limit=' +
            limit);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List collection = response.data;
      _newList.addAll(collection);
    }
    _isLoading = true;

    _changeLoadingState = false;

    notifyListeners();
  }
}
