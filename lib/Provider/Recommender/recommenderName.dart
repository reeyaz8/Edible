import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameRecommendation with ChangeNotifier{
  SharedPreferences preferences;
  // List<String> _fruits, _bakery, _vegetable, _beverage = [];

  Future<DocumentSnapshot> recommendedFruitName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future<DocumentSnapshot> data = Firestore.instance.collection('today-recommend').document('fruit').get();
    data.then((value){
        List<String> _list = List<String>.from(value.data['names']);
        preferences.setStringList('fruitRecommendation', _list);
    });
    return data;
  }

  Future<DocumentSnapshot> recommendedBakeryName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future<DocumentSnapshot> data = Firestore.instance.collection('today-recommend').document('bakery').get();
    data.then((value){
        List<String> _list = List<String>.from(value.data['names']);
        preferences.setStringList('bakeryRecommendation', _list);
    });
    return data;
  }

  Future<DocumentSnapshot> recommendedVegetableName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future<DocumentSnapshot> data = Firestore.instance.collection('today-recommend').document('vegetable').get();
    data.then((value){
        List<String> _list = List<String>.from(value.data['names']);
        preferences.setStringList('vegetableRecommendation', _list);
    });
    return data;
  }

  Future<DocumentSnapshot> recommendedBeverageName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future<DocumentSnapshot> data = Firestore.instance.collection('today-recommend').document('beverage').get();
    data.then((value){
        List<String> _list = List<String>.from(value.data['names']);
        preferences.setStringList('beverageRecommendation', _list);
    });
    return data;
  }
}