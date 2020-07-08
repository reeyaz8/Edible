import 'package:flutter/cupertino.dart';

class BeverageProvider with ChangeNotifier {
  int _index = 0;
  int get index => _index;

  changeIndex(int i) {
    _index = i;
    notifyListeners();
  }
}