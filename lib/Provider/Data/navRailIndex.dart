import 'package:flutter/cupertino.dart';

class NavRailIndex with ChangeNotifier{
  
  int _currentIndex = 3;
  int get currentIndex => _currentIndex;

  changeIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }
}