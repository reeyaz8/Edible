import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FruitProvider with ChangeNotifier{
  List<String> _name;
  List<String> get name => _name;

  recvRecommendationName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _name = preferences.getStringList('fruitRecommendation');
  }
}