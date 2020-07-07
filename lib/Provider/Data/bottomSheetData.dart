import 'package:flutter/cupertino.dart';

class CartData with ChangeNotifier {
  int _quantity = 1;
  int get quantity => _quantity;

  int _price = 0;
  int get price => _price;

  initPrice(int price) {
    _price = price;
  }

  initQuantity() {
    _quantity = 1;
  }

  incrementPrice(int currentPrice) {
    _price = _price + currentPrice;
    notifyListeners();
  }

  decrementPrice(int currentPrice) {
    if (_quantity == 1) {
      _price = currentPrice;
    } else {
      _price = _price - currentPrice;
    }
    notifyListeners();
  }

  increment() {
    _quantity = _quantity + 1;
    print(_quantity);
    notifyListeners();
  }

  decrement() {
    if (_quantity == 1) {
      _quantity = 1;
    } else {
      _quantity = _quantity - 1;
    }
    notifyListeners();
  }

  updatedPrice(int incomingPrice) {
    _price = _price + incomingPrice;
    notifyListeners();
  }
}
