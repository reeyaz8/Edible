import 'package:flutter/cupertino.dart';

class CartPageData with ChangeNotifier{

  List<Map<String, dynamic>> _listData = [];
  List<Map<String, dynamic>> get listData => _listData;

  int _checkOutPrice = 0;
  int get checkOutPrice => _checkOutPrice;

  updateCartList(String name, String quantity, String price) {
      Map<String, dynamic> item = {'fullName':name, 'quantity': quantity, 'price':price};
     
      _listData.add(item);
      _checkOutPrice = _checkOutPrice + int.parse(price);

      notifyListeners();
    }

  deleteCartList(int index, String price){
    _listData.removeAt(index);
    _checkOutPrice = _checkOutPrice - int.parse(price);
    
    notifyListeners();
  }
}