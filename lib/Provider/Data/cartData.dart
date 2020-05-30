import 'package:flutter/cupertino.dart';

class CartPageData with ChangeNotifier{

  List<Map<String, dynamic>> _listData = [];

  List<Map<String, dynamic>> get listData => _listData;

  updateCartList(String name, String quantity, String price) {
      Map<String, dynamic> item = {'fullName':name, 'quantity': quantity, 'price':price};
      _listData.add(item);
      notifyListeners();
  }
}